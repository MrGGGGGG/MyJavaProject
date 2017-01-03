<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.orderbox {
	margin: auto;
	width: 1000px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #aaa;
}

th {
	vertical-align: baseline;
	padding: 5px 15px 5px 6px;
	background-color: #b5cfd2;
	border: 1px solid #aaa;
	text-align: left;
}

td {
	border: 1px solid #aaa;
}
</style>
</head>

<body>
	<s:if test="#session.userlist!=null">
		<div class="userbox">
			<form action="<%=path%>/admin_DeleteUser.action">
				<h4 align="center">所有 用户</h4>
				<table>
					<tr>
						<th>用户编号</th>
						<th>用户名称</th>
						<th>用户性别</th>
						<th>联系方式</th>
						<th>邮箱</th>
						<th>注册时间</th>
						<th>选择</th>
					</tr>
					<s:iterator value="#session.userlist" var="us" id="usr">
						<tr>
							<td>${usr.cid}</td>
							<td>${usr.cname }</td>
							<td>${usr.csex }</td>
							<td>${usr.ctel }</td>
							<td>${usr.cEmail }</td>
							<td>${usr.cdate }</td>
							<td><input name="chkName" type="checkbox" value="${usr.cid }"></td>
						</tr>
					</s:iterator>
				</table>
				<input type="submit" id="deletebutton" value="删除选中">
			</form>
		</div>
	</s:if>
	<s:else>
		目前没有产品！
	</s:else>
</body>
</html>
