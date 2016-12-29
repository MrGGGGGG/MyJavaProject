package com.cxs.action;
import com.cxs.entity.User;
import com.cxs.service.UserService;
@SuppressWarnings("serial")
public class UserAction extends SuperAction {
	//1����װ��������
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	//2������service�����ɶ���
	private UserService userservice = new UserService();
	//3�������¼
	public String login(){
			//System.out.println(user.getCid()+user.getCpsd());
			User userinfo = userservice.login(user);
			if(userinfo!=null){
				//��¼�ɹ�
				session.setAttribute("userinfo", userinfo.getCname());
				session.setAttribute("userid", userinfo.getCid());
				return "loginsuccess";
			}else{
				return "login";
			}
	}
	
	//�û�ע������
	public String logout(){
		if(session.getAttribute("userinfo")!=null){
			//System.out.println("����ע��������");
			session.removeAttribute("userinfo");
			session.removeAttribute("userid");
		}
		return "logoutsuccess";
	}
}
