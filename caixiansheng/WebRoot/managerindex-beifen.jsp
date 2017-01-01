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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.navibar{
			float:left;
			width:200px;
			background-color: #ddd;
			
			
		}
		.contentbar{
			float:right;
			margin-right:40px;
			width:1300px;
			background-color: #ddd;
		}
		#content{
			width: 1300px;
			height:600px;
		}
	</style>
  </head>
  
  <body>
    <s:if test="#session.admininfo!=null">
    	<div style="width: 100%;height:25px;">
    		欢迎您，管理员：${admininfo}
			<a href="${pageContext.request.contextPath}/admin_logout.action">安全退出</a>
    	</div>
		<div class="navibar">
				<a href="${pageContext.request.contextPath}/admin_showAllProduct.action" target="content">删除产品</a><br>
				<a href="yonghuguanli.jsp" target="content">用户管理</a><br>
				<a href="dingdanguanli.jsp" target="content">订单管理</a><br>
				<a href="dingdanguanli.jsp" target="content">**管理</a><br>
				
		</div>
		<div class="contentbar">
			<iframe id="content" name="content" scrolling="auto">
			</iframe>
		</div>
	</s:if>
			
	
  </body>
</html>
