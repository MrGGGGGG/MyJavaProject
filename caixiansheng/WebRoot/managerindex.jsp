<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<s:if test="#session.adminid==null">
	<jsp:forward page="weidenglu.jsp"></jsp:forward>
</s:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员主页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/backmanager.css">

</head>

<body>
	<s:if test="#session.admininfo!=null">
		<div class="part-left">
			<div class="left-top">
				<div class="top-title">管理页面</div>
			</div>
			<div class="left-below">
				<div class="left-below1">
					<div class="head">
						<img src="images/head.png" width="110" height="125">
					</div>
					<div class="username">
						<a style="font-size:x-large" class="userlink">Welcome</a> <font
							style="font-size:large" class="wel">${admininfo}</font>
					</div>
				</div>
				<div class="left-below2">
					<ul class="left-list">
						<li type="friend" class="list1">
							<div class="tubaio">
								<img src="images/tubiao1.png" width="25" height="25">
							</div> <a
							href="${pageContext.request.contextPath}/admin_showAllProduct.action"
							target="content">删除产品</a>
						</li>
						<li type="friend" class="list1">
							<div class="tubaio">
								<img src="images/tubiao3.png" width="25" height="25">
							</div> <a href="nonghuguanli.jsp" target="content">农户管理</a>
						</li>
						<li type="friend" class="list1">
							<div class="tubaio">
								<img src="images/tubiao2.png" width="25" height="25">
							</div> <a href="kehuguanli.jsp" target="content">客户管理</a>
						</li>
						<li type="friend" class="list1">
							<div class="tubaio">
								<img src="images/tubiao4.png" width="25" height="25">
							</div> <a href="dingdanguanli.jsp" target="content">订单管理</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="part-right">
			<div class="right-top">
				<div class="top-search">
					<a class="search-one"><img src="images/xiala.jpg" width="20"
						height="20"></a> <a class="search-two"><img
						src="images/shuaxin.jpg" width="20" height="20"></a>
				</div>
				<div class="top-sign">
					<div class="message">
						<img src="images/message.jpg" width="30" height="30">
					</div>
					<div class="administrator">
						<div class="top-name">
							<font style="width:20px;" class="wel">${admininfo}</font>
						</div>
						<div class="top-head">
							<img src="images/head.png" width="50" height="55">
						</div>
					</div>
					<div class="setup">
						<img src="images/setup.jpg" width="20" height="20">
					</div>
				</div>
			</div>
			<div class="right-below">
				<iframe id="content" name="content" scrolling="auto"
					src="${pageContext.request.contextPath}/admin_showAllProduct.action"> </iframe>
			</div>
		</div>
	</s:if>


</body>
</html>
