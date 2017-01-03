<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<s:if test="#session.userinfo==null">
	<jsp:forward page="weidenglu.jsp"></jsp:forward>
</s:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的订单</title>

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
<script type="text/javascript">
		
	</script>
</head>

<body>
	<a href="<%=path%>/index.jsp">返回主页</a>
	<s:if test="#session.myorder!=null">
		<div class="orderbox">
			<form action="<%=path%>/order_deleteOrders.action">
				<h4 align="center">我的订单</h4>
				<table>
					<tr>
						<th>选择</th>
						<th>订单号</th>
						<th>商品名称</th>
						<th>订单价格</th>
						<th>订单状态</th>
						<th>下单时间</th>
						<th>收货地址</th>
					</tr>
					<s:iterator value="#session.myorder" var="od" id="ord">
						<tr>
							<td style="text-align: center;"><input class="checkone"
								name="chkName" type="checkbox" value="${ord.onumber}"></td>
							<td>${ord.onumber}</td>
							<td>${ord.pname}</td>
							<td>${ord.oprice}</td>
							<td>${ord.ostatus}</td>
							<td>${ord.odate}</td>
							<td>${ord.oaddress}</td>
						</tr>
					</s:iterator>
				</table>
				<br> <input type="submit" id="deletebutton" value="删除选中订单">
			</form>
		</div>
	</s:if>
	<s:else>
		您目前还没有订单
		<a>立即购物</a>
	</s:else>
</body>
</html>
