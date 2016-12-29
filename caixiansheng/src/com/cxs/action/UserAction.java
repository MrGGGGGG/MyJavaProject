package com.cxs.action;
import com.cxs.entity.User;
import com.cxs.service.UserService;
@SuppressWarnings("serial")
public class UserAction extends SuperAction {
	//1、封装请求数据
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	//2、调用service，生成对象
	private UserService userservice = new UserService();
	//3、处理登录
	public String login(){
			//System.out.println(user.getCid()+user.getCpsd());
			User userinfo = userservice.login(user);
			if(userinfo!=null){
				//登录成功
				session.setAttribute("userinfo", userinfo.getCname());
				session.setAttribute("userid", userinfo.getCid());
				return "loginsuccess";
			}else{
				return "login";
			}
	}
	
	//用户注销方法
	public String logout(){
		if(session.getAttribute("userinfo")!=null){
			//System.out.println("调用注销方法。");
			session.removeAttribute("userinfo");
			session.removeAttribute("userid");
		}
		return "logoutsuccess";
	}
}
