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

<title>朋友圈</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/messagebroad.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/messagebroad.js"></script>
</head>

<body background="images/背景.png" style="margin:0">
	<div class="top">
		<span class="top-left"> <span class="top-left-logo"> <a
				class="logo" title="朋友圈"><img src="images/朋友.jpg" width="41"
					height="41" /><span>朋友圈</span></a>
		</span> <span class="top-left-list"> <a id="pcenter" herf="javascript"><span>个人中心</span></a>
		</span> <span class="top-left-list"> <a id="pcenter" herf="javascript"><span>我的主页</span></a>
		</span> <span class="top-left-list"> <a id="pcenter" herf="javascript"><span>我的好友</span></a>
		</span>
		</span> <span class="top-right"> <a><img src="images/car.jpg"
				width="30" height="30" /><span>鲜果园</span></a>
		</span> <span class="top-right">
			<form>
				<input type="text" class="search" placeholder="用户/动态" />
			</form>
		</span>
	</div>


	<div class="upper">
		<div class="upper-name">
			<span>菜 鲜 生</span>
		</div>
		<span class="upper-head"> <img src="images/car.jpg" width="125"
			height="125" />
		</span> <span class="upper-headname">鲜果园</span>
	</div>


	<div class="middle">
		<div class="middle-menu">
			<span class="middle-menu-n1"><a id=middlelist
				herf="javascript"> 主页</a> </span> <span class="middle-menu-n1"><a
				id=middlelist herf="javascript"> 动态</a> </span> <span
				class="middle-menu-n1"><a id=middlelist herf="javascript">
					简介</a> </span> <span class="middle-menu-n1"><a id=middlelist
				herf="javascript"> 更多</a> </span>
		</div>
	</div>



	<div class="under">
		<div class="under-left">
			<ul class="under-left-list">
				<li type="friend" class="list1"><a herf="<%=path %>/message_showAllMessagesById.action">好友动态</a></li>
				<li type="friend" class="list1"><a herf="javascipt">特别关注</a></li>
				<li type="friend" class="list1"><a herf="javascipt">我的收藏</a></li>
				<li type="friend" class="list1"><a herf="javascipt">朋友推荐</a></li>
			</ul>
		</div>
		<div class="under-right">
			<div class="sign" style="z-index: -2;">
				<div class="time" style="z-index: -1;">
					<span class="week">周六</span> <span class="day">12.3</span>
				</div>
				<div class="sign-right"></div>
			</div>
			<div class="adver">
				<a herf=""><img src="images/new year.jpg" width="190"
					height="110"></a>
			</div>
		</div>
		<div class="under-above">
			<form action="<%=path%>/message_createnewmessage.action">
				<div class="under-above-top">
					<textarea style="outline: none;width:100%;height: 100%;" name="message_text"></textarea>
				</div>
				<div class="under-above-below">
					<input id="file" type="file" name="file" />
					<input class="imgtempname" id="pic1" type="text" name="pic1" />
					<input class="imgtempname" id="pic2" type="text" name="pic2" />
					<input class="imgtempname" id="pic3" type="text" name="pic3" />
					<button class="tietu-btn" onclick="file.click()"><img id="tietu-ico" class="tietu-ico" src="images/camera.png" onclick="return false;"></button>
					<button id="upbutton" class="upload" onclick="return false;">上传</button>
					<button type="submit" class="fabiao-btn">发表</button>
				</div>
			</form>
		</div>
		<div class="under-below">
			<s:iterator value="#session.friendmessage" var="ms" id="msg">
				<div class="message-box">
					<div class="message-info">
						<div class="messageimg">
							<img src="images/car.jpg" style="width:100%;height:100%;">
						</div>
						<div class="messagent">
							<a style="font-size: x-large" class="userlink" href="">${msg.cname}</a><br>
							<font style="font-size:small">${msg.message_time}</font>
						</div>
					</div>
					<p style="margin-left:40px;margin-top:90px;">${msg.message_text }</p>
					<s:if test="#msg.message_img!=null">
						<img src="images/${msg.message_img}"
						style="width:200px;height:200px;margin-left: 30px;">
					</s:if>
					<div class="operation-box">
						<button class="opera-btn"><img style="width:18px;height:18px;" src="images/dianzan.png"><font id="msg${msg.message_id }">${msg.message_zan }</font></button>
						<button class="zf-btn"><img style="width:18px;height:18px;" src="images/zhuanfa.png"></button>
					</div>
				</div>
				<hr style="size: 2px;">
			</s:iterator>
		</div>
	</div>
</body>
</html>
