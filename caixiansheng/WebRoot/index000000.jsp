<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>菜鲜生</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/caixiansheng.css">


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/sl.js"></script>
	<style type="text/css">
		body {font-size:12px; color:#222; font-family:Verdana,Arial,Helvetica,sans-serif; background:#f0f0f0;}
		ul,li {list-style:none; margin:0px; padding:0px;}
		img {border:0;}
		.focus {width:800px; height:280px; overflow:hidden; position:relative;}
		.focus ul {height:380px; position:absolute;}
		.focus ul li {float:left; width:800px; height:280px; overflow:hidden; position:relative; background:#000;}
		.focus ul li div {position:absolute; overflow:hidden;}
		.focus .btnBg {position:absolute; width:800px; height:20px; left:0; bottom:0; background:#000; display:none;}
		.focus .btn {position:absolute; width:780px; height:23px; padding:0px 10px 0px 10px; right:0; bottom:6px; text-align:right;}
		.focus .btn span {display:inline-block; _display:inline; _zoom:1; width:25px; height:24px; line-height:24px; text-align:center; _font-size:0; margin-left:5px; cursor:pointer; background:#fff;}
		.focus .btn span.on {background:#fff;}
		.focus .preNext {width:45px; height:100px; position:absolute; top:90px; background:url(images/sprite.png) no-repeat 0 0; cursor:pointer;}
		.focus .pre {left:0;}
		.focus .next {right:0; background-position:right top;}
		</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
	  	$.focus("#focus001");
	});

</script>
<body>
	<div id="navigation">
		<div id="navi-contain">
			<ul id="nav-left">
			<s:if test="#session.userinfo!=null">
				<li>欢迎您，${userinfo}</li>
					<li><a href="${pageContext.request.contextPath}/user_logout.action">注销</a></li>
			</s:if>
			<s:else>
				<li>欢迎您来到菜鲜生！</li>
				<li>请<a href="login.jsp">登录</a>&nbsp;</li> 
				<li>还没有账号？<a href="">免费注册</a></li>
			</s:else>
				
				<li class="btn-group">
				<a class="btn dropdown-toggle" data-toggle="dropdown" style="font-size: 12px;">网站导航<span class="caret"></span></a>
				<ul id="navi-menu" class="dropdown-menu nav-xiala" style="float: left;z-index: 9999;width: 990px;height:180px;position: absolute;">
                          <li>
                          	<a style="text-align: center;font-size: 17px;font-weight:bold">水果</a>
                          	<p>
                          		<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
                          	</p>
                          </li>
                          <li>
                          	<a style="text-align: center;font-size: 17px;font-weight:bold">蔬菜</a>
                          	<p>
								<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
                          	</p>
                          </li>
                          <li>
                          	<a style="text-align: center;font-size: 17px;font-weight:bold">家禽</a>
                          	<p>
								<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
                          	</p>
                          </li>
                          <li>
                          	<a style="text-align: center;font-size: 17px;font-weight:bold">特产</a>
                          	<p>
								<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
								<a href="#">这里占位置</a><br>
                          	</p>
                          </li>
                        </ul>
				</li>
			</ul>
			<ul id="nav-right">
				<li ><a href="${pageContext.request.contextPath}/order_showMyOrder.action">我的订单</a></li>
				<li ><a href="cart.html">购物车</a></li>
				<li ><a href="">联系客服</a></li>
				
			</ul>
		</div>
	</div>
	<div id="leftside"></div>
	<div id="container">
		<div id="header">
			<div id="logo"><img class="image" src="images/temple.png"></div>
			<div id="searchbar">
				<form>
					<input type="text" id="s1" class="search-input" name="searchkeyword" placeholder="请输入关键词">
					<input type="submit" id="btn-search" class="search-input" name="btn-search" value="搜索">
				</form>
			</div>
			<div id="navi">
				<ul>
					<li><a href="${pageContext.request.contextPath}/product_showAllProduct.action">水果</a></li>
					<li><a href="vegetable.html" target="myframe">蔬菜</a></li>
					<li><a href="techan.html" target="myframe">特产</a></li>
					<li><a href="animal.html" target="myframe">家禽</a></li>
				</ul>
			</div>
		</div>
		<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>

		<div id="info">
			<div class="focus" id="focus001">
				<ul>
					<li><img src="images/01.jpg"></li>
					<li><img src="images/02.jpg"></li>
					<li><img src="images/03.jpg"></li>
				</ul>
			</div>
		</div>
		<iframe id="myframe" name="myframe" scrolling="no" style="width:990px;height: 2557px;margin-left: 100px;float: left;" ></iframe>
	</div>
	<div id="rightside"></div>
	<div id="footer">这里是底部</div>
</body>
</html>
