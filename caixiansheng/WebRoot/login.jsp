<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

	<div class="login-header">
    
    <span class="logo"><img src="./images/cartlogo.png"  /></span>
    <a href="index.jsp">返回首页</a>
    <a href="register.jsp">免费注册</a>
    </div>
	<div class="login-content">
		<div class="pic"><img alt="" src="./images/66667.jpg" width="85%"></div>
		<div class="login-div">
			<div class="login-box">
				
				<form class="login-form" action="<%=path %>/user_login.action
" method="post">
                <h2>欢迎登录</h2>
					<input type="text" class="login-input" name="user.cid" placeholder="请输入用户名"><br><br><br>
					<input type="password" class="login-input" name="user.cpsd" placeholder="请输入密码"><div ></div><br><br>
					
					<input type="submit" class="login-btn" id="login-btn" value="登录">
                    <a href="register.jsp">免费注册</a>
                    <a href="">忘记密码？</a>
                    
				</form>
			</div>
		</div>
	</div>
	<div class="login-footer"></div>
</body>
</html>