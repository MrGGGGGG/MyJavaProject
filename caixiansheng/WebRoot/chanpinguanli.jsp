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
	<s:if test="#session.list!=null">
		<div class="productbox">
			<form action="<%=path%>/admin_Delete.action">
				<h4 align="center">所有产品</h4>
				<table>
					<tr>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>产品介绍</th>
						<th>产品数量</th>
						<th>产品价格/元</th>
						<th>产品图片</th>
						<th>上架日期</th>
						<th>商家ID</th>
						<th>类型ID</th>
						<th>溯源ID</th>
						<th>选择</th>
					</tr>
					<s:iterator value="#session.list" var="pr" id="pro">
						<tr>
							<td>${pro.pid }</td>
							<td>${pro.pname }</td>
							<td>${pro.pintro }</td>
							<td>${pro.pcount }</td>
							<td>${pro.price }</td>
							<td><img style="width: 50px;height: 50px;"
								src="images/${pro.picture }"></td>
							<td>${pro.pdate }</td>
							<td>${pro.fid }</td>
							<td>${pro.typeid  }</td>
							<td>${pro.syid }</td>
							<td><input name="chkName" type="checkbox" value="${pro.pid }"></td>
						</tr>
					</s:iterator>
				</table>
				<input type="submit" id="deletebutton" value="删除选中">
			</form>
			<a href="addproduct.jsp" target="content">添加新商品</a>
		</div>
	</s:if>
	<s:else>
		目前没有产品！
	</s:else>
</body>
</html>
