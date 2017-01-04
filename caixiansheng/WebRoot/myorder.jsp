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
<link rel="stylesheet" href="./source/base.min.css">
<link rel="stylesheet" href="./source/common.min.css">
<link rel="stylesheet" href="./source/bottomanimate.min.css">
<link rel="stylesheet" href="./source/index.min.css">
<link rel="stylesheet" href="./source/slider.min.css">
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

<div class="topbar">
		<div class="container clearfix">
			<ul class="top-login fl">
				<!--登录注册-->
				<s:if test="#session.userinfo!=null">
					<li>欢迎您，${userinfo}&nbsp;&nbsp;&nbsp;</li>
					<li><a
						href="${pageContext.request.contextPath}/user_logout.action">注销&nbsp;&nbsp;&nbsp;</a></li>
					<li><a href="${pageContext.request.contextPath}/order_showMyOrder.action">我的订单</a></li>
				</s:if>
				<s:else>
					<li>
						<ul class="fl" id="userNoLoginInfo">
							<li class="label orange">欢迎进入菜鲜生</li>
							<li class="label p-login"><a title="登录菜鲜生" href="login.jsp">请登录</a></li>
							<li class="label"><a title="注册菜鲜生" href="<%=path%>/register.jsp">免费注册 </a></li>
						</ul>
					</li>
				</s:else>

			</ul>
			<ul class="top-nav fr">
				<li class="pngfix">
					<div class="label">
						<a href="">个人主页</a>
					</div>
				</li>
				<li class="dropdown pngfix">
					<div class="dropdown-label">
						<i>&nbsp;</i><span>帮助中心</span>
					</div>
					<div class="dropdown-layer dd-help-center">
						<p>
							<a href="">常见问题</a> <a href="service.jsp">联系客服</a>
						</p>
					</div>
				</li>
				<li class="dropdown pngfix">
					<div class="dropdown-label">
						<i>&nbsp;</i><span>网站导航</span>
					</div>
					<div class="dropdown-layer dd-site-map">
						<p>
							<a href="" class="fwb">水果</a> <a href="" class="fwb">蔬菜</a> <a
								href="" class="fwb">零食</a>
						</p>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!--2层-->
	<div class="header">
		<!--2-1层-->
		<div class="container">
			<div class="site-logo fl">
				<a href="" title="首页"><img src="./img/index_logo.png"
					width="388" height="123"></a>
			</div>
			<div class="site-search">
				<form id="searchForm" action="<%=path %>/search_search.action">
					<div class="search-area">
						<div class="autoComplete">
							<input id="keyword" name="keyword" type="text"
								placeholder="输入货品名称" class="search-inpt">
						</div>
						<input type="submit" value="搜 索" class="search-btn">
					</div>
				</form>
			</div>
			<div class="clear"></div>
		</div>

		<!--2-2层-->
		<div class="main-nav">
			<div class="container">
				<ul class="clearfix">
					<li class="market"><span>产品分类</span></li>
					<li><a href="">定制中心</a></li>
					<li><a href="">溯源信息</a></li>
					<li><a href="<%=path %>/message_showAllMessagesById.action">朋友圈</a></li>
				</ul>
			</div>
		</div>
	</div>

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
