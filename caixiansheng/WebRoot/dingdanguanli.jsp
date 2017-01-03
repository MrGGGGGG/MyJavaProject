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
	<s:if test="#session.orderlist!=null">
		<div class="productbox">
			<form action="<%=path%>/admin_DeleteOrder.action">
				<h4 align="center">所有产品</h4>
				<table>
					<tr>
						<th>订单编号</th>
						<th>产品名称</th>
						<th>产品数量</th>
						<th>订单总价</th>
						<th>订单状态</th>
						<th>下单日期</th>
						<th>配送地址</th>
						<th>订单备注</th>
						<th>评价ID</th>
						<th>用户ID</th>
						<th>商品ID</th>
						<th>选择</th>
					</tr>
					<s:iterator value="#session.orderlist" var="or" id="ord">
						<tr>
							<td>${ord.onumber}</td>
							<td>${ord.pname }</td>
							<td>${ord.oprice}</td>
							<td>${ord.ocount }</td>
							<td>${ord.ostatus }</td>
							<td>${ord.odate }</td>
							<td>${ord.oaddress}</td>
							<td>${ord.olog }</td>
							<td>${ord.evid  }</td>
							<td>${ord.cid }</td>
							<td>${ord.pid }</td>
							<td><input name="chkName" type="checkbox" value="${ord.onumber }"></td>
						</tr>
					</s:iterator>
				</table>
				<input type="submit" id="deletebutton" value="删除选中">
			</form>
		</div>
	</s:if>
	<s:else>
		目前没有订单！
	</s:else>
</body>
</html>
