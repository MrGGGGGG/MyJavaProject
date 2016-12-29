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
	//2、调用service，生成对象
	private EvaluateService evaservice  = new EvaluateService();

	//查询评论
	public String selecteva(){
		
		if(session.getAttribute("userid").toString()!=null){
			String epid = request.getParameter("epid");
			System.out.println("产品ID："+epid);
			List<Evaluate> list = new ArrayList<Evaluate>();
			list=	evaservice.selecteva(epid);
			System.out.println("查询结果："+list);
			session.setAttribute("evaluate", list);
			
			return "publishsuccess";
		}
		else{
			return "fail";
		}

	}
	
	//发表评论
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
			System.out.println("成功发表评论");
			return "publishsuccess";
		}
		else return "fail";
		
		
	}

}
