package com.cxs.action;
import javax.servlet.http.HttpSession;

import com.cxs.entity.Register;
import com.cxs.service.RegisterService;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
@SuppressWarnings("serial")
public class RegisterAction extends SuperAction {
	//1、封装请求数据

	private Register register;
	public Register getRegister() {
		return register;
	}

	public void setRegister(Register register) {
		this.register = register;
	}

	//2、调用service，生成对象

	private RegisterService registerService  = new RegisterService ();
	//3、处理注册

	public String Register(){
		String ctel =register.getCtel();
		String cpsd =register.getCpsd();
		String checkword =register.getCheckword();
		HttpSession session =request.getSession(false);
		String  num =(String) session.getAttribute("num");
		System.out.println(ctel+"/"+cpsd+"/"+num+"/"+checkword);

		if(checkword.equals(num)){
			registerService.register(register);
			return "success";
		}
		else{
			return "error";
		}
		
		
		
		
	}
	//发送验证码
	public String Check(){
		int number = (int) (Math.random()*10000);
		String num =String.valueOf(number);
		HttpSession session =request.getSession();
		session.setAttribute("num", num);
		session.setMaxInactiveInterval(60);
		String to =request.getParameter("ctel");
		System.out.println(to);
		String url="https://eco.taobao.com/router/rest";
		String appkey="23553171";
		String secret="d79406344773c3b0fa577d202c260220";
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
	//	req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("菜鲜生");
		req.setSmsParamString("{\"number\":'"+num+"'}");
		req.setRecNum(to);
		req.setSmsTemplateCode("SMS_32420152");
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		try {
			rsp = client.execute(req);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(rsp.getBody());
		return "";

	}

}
