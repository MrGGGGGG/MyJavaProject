<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.cxs.zy.DealDatabeifen" %>
<%
	String action=request.getParameter("action");
	DealDatabeifen dd=new DealDatabeifen();
	//用户登录
	if("login".equals(action)){
		
		
		out.println(dd.userLogin(session, application));
	}
	//获取所有聊天消息
	else if("ChatList".equals(action)){
		String usernameInSession=(String)session.getAttribute("userinfo");
		if(usernameInSession==null){
	out.print("unLogin");
		}else{
	
	out.print(dd.AllChatList(application));
		}
	}
	//发送消息
	else if("SendContent".equals(action)){
		String content=request.getParameter("content");
		out.println(dd.addContent(content,application,session));
		
	}
	//获取在线人员列表
	else if("onLineList".equals(action)){
		out.println(dd.GetOnlineUsers(application));
	}
	//下线
	else if("OffLine".equals(action)){
		out.print(dd.OffLine(application,session));
	}
%>
