package com.cxs.action;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.cxs.service.EvaluateService;
import com.cxs.entity.Evaluate;
@SuppressWarnings("serial")
public class EvaluateAction extends SuperAction {
	private Evaluate evaluate;

	public Evaluate getEval() {
		return evaluate;
	}

	public void setEval(Evaluate evaluate) {
		this.evaluate= evaluate;
	}
	//2������service�����ɶ���
	private EvaluateService evaservice  = new EvaluateService();

	//��ѯ����
	public String selecteva(){
		
		if(session.getAttribute("userid").toString()!=null){
			String epid = request.getParameter("epid");
			System.out.println("��ƷID��"+epid);
			List<Evaluate> list = new ArrayList<Evaluate>();
			list=	evaservice.selecteva(epid);
			System.out.println("��ѯ�����"+list);
			session.setAttribute("evaluate", list);
			
			return "publishsuccess";
		}
		else{
			return "fail";
		}

	}
	
	//��������
	public String publisheva(){
		String evid = session.getAttribute("userid").toString();
		String econt=request.getParameter("econt");
		String evdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String epid = session.getAttribute("epid").toString();
		if(econt!=null){
			evaservice.publisheva(evid, econt, evdate, epid);
			List<Evaluate> list = new ArrayList<Evaluate>();
			list=	evaservice.selecteva(epid);
			System.out.println(list);
			session.setAttribute("evaluate", list);
			System.out.println("�ɹ���������");
			return "publishsuccess";
		}
		else return "fail";
		
		
	}

}
