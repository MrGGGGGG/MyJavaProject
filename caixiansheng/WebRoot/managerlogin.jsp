<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'managerlogin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
body{
	background: #0ca3d2;
}
.login-box {
	position: relative;
	margin: 0 auto;
	padding: 20px 20px 20px;
	width: 310px;
	background: white;
	border-radius: 3px;
	border: 1px ;
	text-align: center;
}
.login-icon{
	width:30px;
	height: 20px;	
}
input{
	width:200px;
	height: 40px;
}
#username{
	margin-left: 10px;
}
</style>
</head>

<body>
	<div class="login-box">
		<h1>后台管理</h1>
		<form action="<%=path %>/admin_login.action" method="post">
			<img class="login-icon" src="images/usernameico.png">&nbsp;<input type="text" id="username" name="admin.adminid" placeholder="请输入管理员账号">
			<br> <br>
			<img class="login-icon" src="images/passwordico.png">&nbsp;<input type="password" name="admin.adminpassword"
				placeholder="请输入管理员密码"><br><br> <input type="submit"
				value="登录">
		</form>
	</div>
</body>
</html>
