package com.cxs.zy;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
public class DealData {
	//�û���¼���ж�
	public String userLogin(HttpSession session,ServletContext application){
		if(session.getAttribute("userinfo")!=null){
			String username=session.getAttribute("userinfo").toString();
			List<String> users=(List<String>)application.getAttribute("users");
			if(users==null){
				users=new ArrayList<String>();
			}
				if(users.contains(username)!=true){
					//����ǰ�û������û��б�
					users.add(username);
					//����application�еĶ���
					application.setAttribute("users", users);
				}
				
			
			return "True";
		}
		else{
			return "Flase";
		}
		
	}
	//�����Ϣ
	public String addContent(String content,ServletContext application,HttpSession session){
		List<String> strList=(List<String>) application.getAttribute("MessageList");
		if(strList==null){
			strList=new ArrayList<String>();
		}
		//��ȡsession�е��û���
		String username=(String)session.getAttribute("userinfo");
		//��ȡʱ��
		Date date=new Date();
		content=content.replace("<:", "<img src='QQface/");
		content=content.replace(":>", ".gif' />");
		content=content.replace("*#emo_", "<img src='img/emo_");
		content=content.replace("#*", ".gif' />");
		//��װ��Ϣ
		String message="<font >"+username+"&nbsp"+date.toLocaleString()+"��</font><br />&nbsp"+content;
		//��ӵ�������
		strList.add(message);
		//����application������
		application.setAttribute("MessageList", strList);
		return "True";
	}
	//��ȡ���е���Ϣ
	public String AllChatList(ServletContext application){
		StringBuffer sb=new StringBuffer();
		List<String> strList=(List<String>) application.getAttribute("MessageList");
		if(strList!=null){
			for(String s:strList){
				sb.append(s+"<br />");
			}
		} 
		return sb.toString();
	}
	//��ȡ�����û��б�
	public String GetOnlineUsers(ServletContext application){
		StringBuffer sb=new StringBuffer();
		List<String> strList=(List<String>) application.getAttribute("users");
		if(strList!=null){
			for(String s:strList){
				sb.append(s+"<br />");
			}
		} 
		return sb.toString();
	}
	//����
	public String OffLine(ServletContext application,HttpSession session){
		//��ȡ���û���
		String username=(String)session.getAttribute("userinfo");
		//�Ƴ�session�е�����
		session.removeAttribute("userinfo");
		//�Ƴ��û��б��е��û���
		List<String> strList=(List<String>) application.getAttribute("users");
		if(strList!=null){
			strList.remove(username);
		} 
		return "True";
	}
}
