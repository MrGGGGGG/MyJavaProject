<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>菜鲜生</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-transform">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta name="mobile-agent" content="format=html5;url=http://m.cnhnb.com/">
<title>菜鲜生</title>
<script charset="utf-8" src="./source/v.js"></script>
<script type="text/javascript" src="./source/mobileRedirect.js"></script>
<script type="text/javascript">
	uaredirect("http://m.cnhnb.com");
</script>
<link rel="stylesheet" href="./source/base.min.css">
<link rel="stylesheet" href="./source/common.min.css">
<link rel="stylesheet" href="./source/bottomanimate.min.css">
<link rel="stylesheet" href="./source/index.min.css">
<link rel="stylesheet" href="./source/slider.min.css">
<script type="text/javascript" charset="utf-8"
	src="./source/app.js"></script>
</head>

<body>
	<div class="topbar">
		<div class="container clearfix">
			<ul class="top-login fl">
				<!--所在地-->
				<li class="dropdown">
					<div class="dropdown-label dl-city">
						<i>&nbsp;</i><span class="tit">所在地：</span><span
							id="topbar_address">江西</span>
					</div>
					<div class="dropdown-layer dd-city-list">
						<div class="list">
							<a data-id="45081" href="javascript:void(0)" rel="nofollow">北京</a><a
								data-id="45083" href="javascript:void(0)" rel="nofollow">上海</a><a
								data-id="45082" href="javascript:void(0)" rel="nofollow">天津</a><a
								data-id="45084" href="javascript:void(0)" rel="nofollow">重庆</a><a
								data-id="3" href="javascript:void(0)" rel="nofollow">河北</a><a
								data-id="4" href="javascript:void(0)" rel="nofollow">山西</a><a
								data-id="16" href="javascript:void(0)" rel="nofollow">河南</a><a
								data-id="6" href="javascript:void(0)" rel="nofollow">辽宁</a><a
								data-id="7" href="javascript:void(0)" rel="nofollow">吉林</a><a
								data-id="8" href="javascript:void(0)" rel="nofollow">黑龙江</a><a
								data-id="5" href="javascript:void(0)" rel="nofollow">内蒙古</a><a
								data-id="10" href="javascript:void(0)" rel="nofollow">江苏</a><a
								data-id="15" href="javascript:void(0)" rel="nofollow">山东</a><a
								data-id="12" href="javascript:void(0)" rel="nofollow">安徽</a><a
								data-id="11" href="javascript:void(0)" rel="nofollow">浙江</a><a
								data-id="13" href="javascript:void(0)" rel="nofollow">福建</a><a
								data-id="17" href="javascript:void(0)" rel="nofollow">湖北</a><a
								data-id="18" href="javascript:void(0)" class="" rel="nofollow">湖南</a><a
								data-id="19" href="javascript:void(0)" rel="nofollow">广东</a><a
								data-id="20" href="javascript:void(0)" rel="nofollow">广西</a><a
								data-id="14" href="javascript:void(0)" rel="nofollow"
								class="selected">江西</a><a data-id="23" href="javascript:void(0)"
								rel="nofollow">四川</a><a data-id="21" href="javascript:void(0)"
								rel="nofollow">海南</a><a data-id="24" href="javascript:void(0)"
								rel="nofollow">贵州</a><a data-id="25" href="javascript:void(0)"
								rel="nofollow">云南</a><a data-id="26" href="javascript:void(0)"
								rel="nofollow">西藏</a><a data-id="27" href="javascript:void(0)"
								rel="nofollow">陕西</a><a data-id="28" href="javascript:void(0)"
								rel="nofollow">甘肃</a><a data-id="29" href="javascript:void(0)"
								rel="nofollow">青海</a><a data-id="30" href="javascript:void(0)"
								rel="nofollow">宁夏</a><a data-id="31" href="javascript:void(0)"
								rel="nofollow">新疆</a><a data-id="32" href="javascript:void(0)"
								rel="nofollow">台湾</a><a data-id="33" href="javascript:void(0)"
								rel="nofollow">香港</a><a data-id="34" href="javascript:void(0)"
								rel="nofollow">澳门</a>
						</div>
					</div>
				</li>
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
							<a href="">常见问题</a> <a href="">联系客服</a>
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
			<div class="shopcart pngfix">
				<a href="<%=path %>/cart_selectcart.action" title="我的购物车"><i class="cart pngfix"></i>我的购物车<span
					id="myCartId" class="pngfix"></span></a>
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

	<!--3层-->
	<div class="container">
		<!--左-->
		<div class="category">
			<!--下拉框-->
			<div class="label">
				<dl data-target="0" class="follow" id="categoryMyAttention">
					<dt>
						<a href="">我的关注</a>
					</dt>
				</dl>
				<dl data-target="1" class="cate-01">
					<dt>
						<a href="${pageContext.request.contextPath}/product_showAllProduct.action">水果蔬菜</a>
					</dt>
				</dl>
				<dl data-target="2" class="cate-02">
					<dt>
						<a href="">畜牧水产</a>
					</dt>
				</dl>
				<dl data-target="3" class="cate-03">
					<dt>
						<a href="">农副加工</a>
					</dt>
				</dl>
			</div>

			<div class="panel" style="display: none;">
				<div data-index="0" class="item" style="display: none;">
					<div class="follow-none" id="noAttention">
						<p>暂时没有关注</p>
					</div>
					<p class="follow-btns">
						<a href="javascript:void(0)" id="layerAttentionBut"
							data-layer="#layerAttention" class="setting">设置关注</a>
					</p>
				</div>

				<!--水果蔬菜-->
				<div data-index="1" class="item" style="display: none;">
					<div class="sub-cate">
						<dl>
							<dt>
								<h3>
									<a href="">蔬菜<i>&gt;</i></a>
								</h3>
							</dt>
							<dd>
								<h3>
									<a>白菜</a>
								</h3>
								<h3>
									<a>生菜</a>
								</h3>
								<h3>
									<a>包菜</a>
								</h3>
								<h3>
									<a>韭菜</a>
								</h3>
								<h3>
									<a>香菜</a>
								</h3>
								<h3>
									<a>油麦菜</a>
								</h3>
								<h3>
									<a class="red">莴笋</a>
								</h3>
								<h3>
									<a>芹菜</a>
								</h3>
								<h3>
									<a class="red">花椰菜</a>
								</h3>
								<h3>
									<a>黄花菜</a>
								</h3>
								<h3>
									<a>西兰花</a>
								</h3>
								<h3>
									<a>萝卜</a>
								</h3>
								<h3>
									<a>胡萝卜</a>
								</h3>
								<h3>
									<a>南瓜</a>
								</h3>
								<h3>
									<a>丝瓜</a>
								</h3>
								<
								<h3>
									<a class="red">冬瓜</a>
								</h3>
								<h3>
									<a class="red">黄瓜</a>
								</h3>
								<h3>
									<a>辣椒</a>
								</h3>
								<h3>
									<a class="red">西红柿</a>
								</h3>
								<h3>
									<a>秋葵</a>
								</h3>
								<h3>
									<a>红薯</a>
								</h3>
								<h3>
									<a class="red">土豆</a>
								</h3>
								<h3>
									<a>山药</a>
								</h3>
								<h3>
									<a>香菇</a>
								</h3>
								<h3>
									<a>木耳</a>
								</h3>
								<h3>
									<a class="red">蘑菇</a>
								</h3>
								<h3>
									<a>洋葱</a>
								</h3>
								<h3>
									<a>茄子</a>
								</h3>
							</dd>
						</dl>
						<dl>
							<dt>
								<h3>
									<a href="">水果<i>&gt;</i></a>
								</h3>
							</dt>
							<dd>
								<h3>
									<a>苹果</a>
								</h3>
								<h3>
									<a class="red">梨</a>
								</h3>
								<h3>
									<a>西瓜</a>
								</h3>
								<h3>
									<a>哈密瓜</a>
								</h3>
								<h3>
									<a class="red">猕猴桃</a>
								</h3>
								<h3>
									<a>蜜桃</a>
								</h3>
								<h3>
									<a class="red">橙子</a>
								</h3>
								<h3>
									<a class="red">柚子</a>
								</h3>
								<h3>
									<a>柠檬</a>
								</h3>
								<h3>
									<a>金桔</a>
								</h3>
								<h3>
									<a>香蕉</a>
								</h3>
								<h3>
									<a class="red">葡萄</a>
								</h3>
								<h3>
									<a>芒果</a>
								</h3>
								<h3>
									<a>荔枝</a>
								</h3>
								<h3>
									<a>草莓</a>
								</h3>
								<h3>
									<a>山竹</a>
								</h3>
								<h3>
									<a>杨桃</a>
								</h3>
								<h3>
									<a>杨梅</a>
								</h3>
								<h3>
									<a>黄桃</a>
								</h3>
								<h3>
									<a>榴莲</a>
								</h3>
								<h3>
									<a class="red">山楂</a>
								</h3>
								<h3>
									<a>番石榴</a>
								</h3>
								<h3>
									<a>百香果</a>
								</h3>
								<h3>
									<a>橄榄</a>
								</h3>
								<h3>
									<a>桑葚</a>
								</h3>
								<h3>
									<a class="red">蓝莓</a>
								</h3>
								<h3>
									<a class="red">牛油果</a>
								</h3>
							</dd>
						</dl>
					</div>
					<div class="sub-rcmd">
						<!--166*134-->
						<a title="胡萝卜"> <img src="./img/胡萝卜.jpg" alt="胡萝卜" width=166px
							height=134px;></a> <a title="西兰花"> <img src="./img/西兰花.jpg"
							alt="西兰花" width=166px height=134px;></a> <a title="柠檬"> <img
							src="./img/柠檬.JPG" alt="柠檬" width=166px height=134px;></a>
					</div>
				</div>

				<!--畜牧水产-->
				<div data-index="2" class="item" style="display: block;">
					<div class="sub-cate">
						<dl>
							<dt>
								<h3>
									<a href="">禽畜类<i>&gt;</i></a>
								</h3>
							</dt>
							<dd>
								<h3>
									<a class="red">鸡</a>
								</h3>
								<h3>
									<a>鸭</a>
								</h3>
								<h3>
									<a>鹅</a>
								</h3>
								<h3>
									<a class="red">牛</a>
								</h3>
								<h3>
									<a>羊</a>
								</h3>
								<h3>
									<a class="red">猪</a>
								</h3>
								<h3>
									<a>兔子</a>
								</h3>
								<h3>
									<a>乌骨鸡</a>
								</h3>
								<h3>
									<a class="red">贵妃鸡</a>
								</h3>
								<h3>
									<a>野猪</a>
								</h3>
								<h3>
									<a>香猪</a>
								</h3>
								<h3>
									<a>豪猪</a>
								</h3>
							</dd>
						</dl>
						<dl>
							<dt>
								<h3>
									<a href="">水产类<i>&gt;</i></a>
								</h3>
							</dt>
							<dd>
								<h3>
									<a>鲈鱼</a>
								</h3>
								<h3>
									<a>鲤鱼</a>
								</h3>
								<h3>
									<a class="red">泥鳅</a>
								</h3>
								<h3>
									<a class="red">草鱼</a>
								</h3>
								<h3>
									<a class="red">鲫鱼</a>
								</h3>
								<h3>
									<a>鲢鱼</a>
								</h3>
								<h3>
									<a>鳜鱼</a>
								</h3>
								<h3>
									<a>鲳鱼</a>
								</h3>
								<h3>
									<a>带鱼</a>
								</h3>
								<h3>
									<a>黄花鱼</a>
								</h3>
								<h3>
									<a class="red">小龙虾</a>
								</h3>
								<h3>
									<a class="red">大闸蟹</a>
								</h3>
								<h3>
									<a>鲍鱼</a>
								</h3>
								<h3>
									<a>淡水螺</a>
								</h3>
								<h3>
									<a class="red">海带</a>
								</h3>
							</dd>
						</dl>
					</div>
					<div class="sub-rcmd">
						<a title="乌骨鸡"> <img src="./img/乌骨鸡.jpg" alt="乌骨鸡" width=166px
							height=134px;></a> <a title="鲤鱼"> <img src="./img/鲤鱼.jpg"
							alt="鲤鱼" width=166px height=134px;></a> <a title="大闸蟹"> <img
							src="./img/大闸蟹.jpg" alt="大闸蟹" width=166px height=134px;></a>
					</div>
				</div>

				<!--农副加工-->
				<div data-index="3" class="item" style="display: none;">
					<div class="sub-cate">
						<dl>
							<dt>
								<h3>
									<a href="">肉类加工<i>&gt;</i></a>
								</h3>
							</dt>
							<dd>
								<h3>
									<a>香肠</a>
								</h3>
								<h3>
									<a>腊制品</a>
								</h3>
								<h3>
									<a>丸子制品</a>
								</h3>
								<h3>
									<a>水产加工</a>
								</h3>
								<h3>
									<a class="red">腊肉</a>
								</h3>
								<h3>
									<a class="red">卤制品</a>
								</h3>
								<h3>
									<a>禽畜副产品</a>
								</h3>
								<h3>
									<a>肉类罐头</a>
								</h3>
							</dd>
						</dl>
						<dl>
							<dt>
								<h3>
									<a href="">蔬果加工<i>&gt;</i></a>
								</h3>
							</dt>
							<dd>
								<h3>
									<a>干香菇</a>
								</h3>
								<h3>
									<a>干菌子</a>
								</h3>
								<h3>
									<a class="red">百合干</a>
								</h3>
								<h3>
									<a>脱水蔬菜</a>
								</h3>
								<h3>
									<a class="red">干笋</a>
								</h3>
								<h3>
									<a>葡萄干</a>
								</h3>
								<h3>
									<a>地瓜干</a>
								</h3>
								<h3>
									<a>黑加仑果干</a>
								</h3>
								<h3>
									<a>桂圆干</a>
								</h3>
								<h3>
									<a>莲子</a>
								</h3>
								<h3>
									<a>干木耳</a>
								</h3>
							</dd>
						</dl>
						<dl>
							<dt>
								<h3>
									<a href="">零食特产<i>&gt;</i></a>
								</h3>
							</dt>
							<dd>
								<h3>
									<a>蜂蜜</a>
								</h3>
								<h3>
									<a class="red">红枣</a>
								</h3>
								<h3>
									<a class="red">枸杞</a>
								</h3>
								<h3>
									<a>饼干糕点</a>
								</h3>
								<h3>
									<a>麻辣食品</a>
								</h3>
								<h3>
									<a>核桃</a>
								</h3>
								<h3>
									<a>咖啡豆</a>
								</h3>
								<h3>
									<a class="red">坚果干果</a>
								</h3>
								<h3>
									<a>休闲食品</a>
								</h3>
								<h3>
									<a>干果蜜饯</a>
								</h3>
								<h3>
									<a> 滋补品</a>
								</h3>
							</dd>
						</dl>
					</div>
					<div class="sub-rcmd">
						<a title="香肠"> <img src="./img/香肠.jpg" alt="香肠" width=166px
							height=134px;></a> <a title="干木耳"> <img src="./img/干木耳.jpg"
							alt="干木耳" width=166px height=134px;></a> <a title="核桃"> <img
							src="./img/核桃.jpg" alt="核桃" width=166px height=134px;></a>
					</div>
				</div>
			</div>
		</div>
		<!--中-->
		<div class="main-slider">
			<!--图片轮播-->
			<div
				class="anythingSlider anythingSlider-default anythingSlider-hovered"
				style="width: 750px; height: 440px;">
				<div class="anythingWindow">
					<ul id="J-main-slider" class="slider anythingBase fade"
						style="width: 750px; left: 0px;">
						<li class="panel" style="width: 750px; height: 440px;"><a
							href="" title="图一" rel="nofollow" phptag="A01"
							style="width: 100%; height: 100%;"> <img src="./img/橙子宣传.jpg"
								alt="图一"></a></li>
						<li class="panel" style="width: 750px; height: 440px;"><a
							href="" title="图二" rel="nofollow" phptag="A02"
							style="width: 100%; height: 100%;"> <img
								src="./img/藜蒿宣传图.jpg" alt="图二"></a></li>
						<li class="panel activePage" style="width: 750px; height: 440px;">
							<a href="" title="图三" rel="nofollow" phptag="A03"
							style="width: 100%; height: 100%;"> <img
								src="./img/莲藕宣传图.jpg" alt="图三"></a>
						</li>
						<li class="panel" style="width: 750px; height: 440px;"><a
							href="" title="图四" rel="nofollow" phptag="A04"
							style="width: 100%; height: 100%;"> <img
								src="./img/金桔宣传图.jpg" alt="图四"></a></li>
						<li class="panel" style="width: 750px; height: 440px;"><a
							href="" title="图五" rel="nofollow" phptag="A05"
							style="width: 100%; height: 100%;"> <img
								src="./img/二维码宣传图.jpg" alt="图五"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--右-->
		<div class="side-info">
			<div class="side-cal mb10">
				<div class="title">
					<span>2016年12月09日 星期五</span>
				</div>
				<div class="inner">
					<img src="./img/天气背景图.jpg"
						data-original="http://img.cnhnb.com/group1/M00/4D/70/8BA32AB800ChRkRlhHtBWAHdVlAACO74fQTsE192.jpg"
						alt="十一月十一" width="210" height="140" class="lazy"
						style="display: block;">
					<div class="date clearfix">
						<div class="mask">&nbsp;</div>
						<span class="month">十一月</span><span class="day">十一</span>
					</div>
				</div>
			</div>
			<div class="side-log">
				<div class="btns clearfix">
					<a href="">登 录</a> <a href="" class="last">免费注册</a>
				</div>
			</div>
		</div>

		<div class="clear"></div>
		<!--广告图-->
		<div class="pic-banner mtb15">
			<ul class="clearfix">
				<li class="first"><a title="广告一"> <img
						src="./img/石榴宣传图.jpg" alt="广告一" width="195" height="120"></a></li>
				<li><a title="广告二"> <img src="./img/生鲜果蔬.png" alt="广告二"
						width="195" height="120"></a></li>
				<li><a title="广告三"> <img src="./img/果蔬圆环.jpg" alt="广告三"
						width="195" height="120"></a></li>
				<li><a title="广告四"> <img src="./img/芒果.jpg" alt="广告四"
						width="195" height="120"></a></li>
				<li><a title="广告五"> <img src="./img/云南好货.jpg" alt="广告五"
						width="195" height="120"></a></li>
				<li><a title="广告六"> <img src="./img/猕猴桃.jpg" alt="广告六"
						width="195" height="120"></a></li>
			</ul>
		</div>

		<!--水果蔬菜专栏-->
		<div id="floor3" class="wrapper com-wrap floor-01 mb15">
			<!-- <div class="wrap-tit clearfix">
				<h3 class="wrap-tit-l pngfix">水果蔬菜</h3>
			</div>
			 -->
			<div class="wrap-inner clearfix">
				<!--水果专栏-->
				<div class="fl w595">
					<div style="background-color:#FFDFEF" class="title">
						<a href="" title="" phptag="SG"> <img src="./img/水果频道.jpg"
							alt="水果频道" width="214" height="155" style="display: block;">
						</a>
						<h4 class="t">
							<a href="" title="水果">水果来了</a>
						</h4>
						<p class="clearfix">
							<a title="苹果">苹果</a> <a title="橘子">橘子</a> <a title="柚子">柚子</a> <a
								title="葡萄">葡萄</a>

						</p>
					</div>
					<div class="imgs">
						<a href="" title="牛油果专题"> <img src="./img/牛油果.jpg" alt="牛油果专题"
							width="224" height="378" style="display: inline;">
						</a> <a href="" title="榴莲专题"> <img src="./img/榴莲.jpg" alt="榴莲专题"
							width="154" height="188" style="display: inline;">
						</a> <a href="" title="香蕉专题"> <img src="./img/香蕉.jpg" alt="香蕉专题"
							width="154" height="188" style="display: inline;">
						</a>
					</div>
				</div>
				<!--蔬菜专栏-->
				<div class="fl w595">
					<div style="background-color:#e0ffe7" class="title">
						<a href="" title="" phptag="SC"> <img src="./img/蔬菜频道.jpg"
							alt="蔬菜图" width="214" height="155" style="display: block;">
						</a>
						<h4 class="t">
							<a href="" title="蔬菜">蔬菜来了</a>
						</h4>
						<p class="clearfix">
							<a title="辣椒">辣椒</a> <a title="白菜">白菜</a> <a title="南瓜">南瓜</a> <a
								title="山药">山药</a>
						</p>
					</div>
					<div class="imgs">
						<a href="" title="有机蔬菜专题"> <img src="./img/有机蔬菜.jpg"
							alt="有机蔬菜专题" width="224" height="378" style="display: inline;">
						</a> <a href="" title="土豆专题"> <img src="./img/土豆.jpg" alt="土豆专题"
							width="154" height="188" style="display: inline;">
						</a> <a href="" title="山药专题"> <img src="./img/山药.jpg" alt="山药专题"
							width="154" height="188" style="display: inline;">
						</a>
					</div>
				</div>
			</div>
		</div>

		<!--畜牧水产专栏-->
		<div id="floor4" class="wrapper com-wrap floor-02 mb15">
			<!-- <div class="wrap-tit clearfix">
				<h3 class="wrap-tit-l pngfix">畜牧水产</h3>
			</div>
			 -->
			<div class="wrap-inner clearfix">
				<div class="img">
					<a href="" title="鸭子专场"> <img src="./img/鸭子专场.jpg" alt="鸭子专题"
						width="215" height="380" style="display: inline;">
					</a>
				</div>
				<div class="titles">
					<div class="item">
						<h4 class="t">
							<a href="" title="禽畜类">禽畜类</a>
						</h4>
						<div class="pic clearfix">
							<a href="" title="牛"> <img src="./img/牛.jpg" alt="牛"
								width="152" height="188" class="lazy fl" style="display: block;">
							</a> <a href="" title="羊"> <img src="./img/羊.jpg" alt="羊"
								width="152" height="188" class="lazy fl" style="display: block;">
							</a>
						</div>
						<p class="clearfix">
							<a href="" title="鸡">鸡</a> <a href="" title="鸭">鸭</a> <a href=""
								title="鹅">鹅</a> <a href="" title="猪">猪</a> <a href="" title="牛">牛</a>
							<a href="" title="羊">羊</a> <a href="" title="狗">狗</a> <a href=""
								title="驴">驴</a>
					</div>
					<div class="item">
						<h4 class="t">
							<a href="" title="水产类">水产类</a>
						</h4>
						<div class="pic clearfix">
							<a href="" title="龙虾"> <img src="./img/龙虾.jpg" alt="龙虾"
								width="152" height="188" class="lazy fl" style="display: block;">
							</a> <a href="" title="海带"> <img src="./img/海带.jpg" alt="海带"
								width="152" height="188" class="lazy fl" style="display: block;">
							</a>
						</div>
						<p class="clearfix">
							<a title="龙虾">龙虾</a> <a title="海带">海带</a> <a title="大闸蟹">大闸蟹</a>
							<a title="干贝">干贝</a> <a title="鲤鱼">鲤鱼</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<!--农副加工-->
		<div id="floor6" class="wrapper com-wrap floor-04 mb15">
			<!-- 
			<div class="wrap-tit clearfix">
				<h3 class="wrap-tit-l pngfix">农副加工</h3>
			</div>
			 -->
			<div class="wrap-inner clearfix">
				<div class="title">
					<h4 class="t">
						<a href="" title="肉类加工">肉类加工</a>
					</h4>
					<p class="clearfix">
						<a title="香肠">香肠</a> <a title="腊肉">腊肉</a> <a title="墨鱼干">墨鱼干</a> <a
							title="紫菜干">紫菜干</a>
					</p>
					<h4 class="t">
						<a href="" title="蔬果加工">蔬果加工</a>
					</h4>
					<p class="clearfix">
						<a href="" title="干香菇">干香菇</a> <a href="" title="干笋">干笋</a> <a
							href="" title="百合干">百合干</a>
					</p>
				</div>
				<div class="imgs">
					<a title="坚果专场"> <img src="./img/坚果.jpg" alt="坚果专场" width="285"
						height="378" class="lazy" style="display: inline;">
					</a> <a title="蜂蜜专题"> <img src="./img/蜂蜜.jpg" alt="蜂蜜专题"
						width="264" height="378" class="lazy" style="display: inline;">
					</a> <a title="菌类专场"> <img src="./img/菌类.jpg" alt="“菌类专题"
						width="211" height="188" class="lazy" style="display: inline;">
					</a> <a title="葡萄干专场"> <img src="./img/葡萄干.jpg" alt="葡萄干专场"
						width="211" height="188" class="lazy" style="display: inline;">
					</a> <a title="巧克力专场"> <img src="./img/巧克力.jpg" alt="巧克力专场"
						width="423" height="188" class="lazy" style="display: inline;">
					</a>
				</div>
			</div>
		</div>
	</div>

	<!--4层-->
	<div class="footer">
		<div class="container">
			<div class="quick-nav">
				<ul class="icon clearfix">
					<li class="i1"><img src="./img/图一.gif" alt="资源多">
						<p>
							<span>资源多</span><span>海量信息免费发</span>
						</p></li>
					<li class="i2"><img src="./img/图二.gif" alt="优惠大">
						<p>
							<span>优惠大</span><span>挑战市场超低价</span>
						</p></li>
					<li class="i3"><img src="./img/图三.gif" alt="销售广">
						<p>
							<span>销售广</span><span>采购便捷一站式</span>
						</p></li>
					<li class="i4"><img src="./img/图四.gif" alt="更安全">
						<p>
							<span>更安全</span><span>实名认证更安心</span>
						</p></li>
				</ul>
				<div class="list clearfix">
					<dl class="clearfix">
						<dt>新手指南</dt>
						<dd>
							<a href="" rel="nofollow">注册新用户</a>
						</dd>
						<dd>
							<a href="" rel="nofollow">实名认证</a>
						</dd>
						<dd>
							<a href="" rel="nofollow">找回密码</a>
						</dd>
						<dd>
							<a href="" rel="nofollow">帮助中心</a>
						</dd>
					</dl>
					<dl class="clearfix">
						<dt>采购商服务</dt>
						<dd>
							<a href="" rel="nofollow">找供应</a>
						</dd>
						<dd>
							<a href="" rel="nofollow">发布采购</a>
						</dd>
					</dl>
					<dl class="clearfix">
						<dt>供应商服务</dt>
						<dd>
							<a href="" rel="nofollow">找采购</a>
						</dd>
						<dd>
							<a href="" rel="nofollow">发布供应</a>
						</dd>
					</dl>
					<dl class="clearfix">
						<dt>交易安全</dt>
						<dd>
							<a href="" rel="nofollow">卖家防骗</a>
						</dd>
						<dd>
							<a href="" rel="nofollow">绑定银行卡</a>
						</dd>
						<dd>
							<a href="" rel="nofollow">买家防骗</a>
						</dd>
					</dl>
				</div>
			</div>
			<div class="ptb20 clearfix">
				<div class="foot-qr clearfix">
					<div class="qrcode">
						<img src="./img/二维码.png" alt="手机惠农网">
						<p>
							<span>扫一扫下载</span><span>手机菜鲜生</span>
						</p>
					</div>
				</div>
				<ul class="foot-nav clearfix">
					<li><a href="" rel="nofollow">关于我们</a></li>
					<li><a href="" rel="nofollow">法律声明</a></li>
					<li><a href="" rel="nofollow">使用协议</a></li>
					<li><a href="" rel="nofollow">版权隐私</a></li>
					<li><a href="" rel="nofollow">友情链接</a></li>
					<li><a href="" rel="nofollow">成功案例</a></li>
					<li><a href="" rel="nofollow">网站地图</a></li>
				</ul>
				<div class="copyright">
					<p>服务热线：000-000-0000</p>
					<p>©2016-2030</p>
					<p class="imgs">
						<a href="" rel="nofollow"> <img alt="45" src="./img/图1.png"></a>
						<a href="" rel="nofollow"> <img alt="47" src="./img/图2.png"></a>
						<a href="" rel="nofollow"> <img alt="55" src="./img/图3.png"></a>
						<a href="" rel="nofollow"></a>
						<script src="./source/aq_auth.js"></script>
						<b id="aqLogoBFQSX" style="display: none;"></b>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!--侧栏-->
	<div id="J-global-toolbar">
		<div class="hn-toolbar-wrap" style="height: 573px;">
			<div class="hn-toolbar">
				<div class="hn-toolbar-tabs">
					<div class="hn-toolbar-tab hn-tbar-tab-cart">
						<a target="_blank" href="" rel="nofollow">
							<div class="tab-ico"></div> <em class="tab-text"> 购物车</em> <span
							id="myCarRightId" class="tab-sub hidden"></span>
						</a>
					</div>
					<div class="hn-toolbar-tab hn-tbar-tab-mine">
						<a target="_blank" href="" rel="nofollow">
							<div class="tab-ico"></div> <em class="tab-text"> 我的惠农</em>
						</a>
					</div>
					<div class="hn-toolbar-tab hn-tbar-tab-service">
						<a target="_blank" href="">
							<div class="tab-ico"></div> <em class="tab-text"> 在线客服</em>
						</a>
					</div>
					<div class="hn-toolbar-tab hn-tbar-tab-im">
						<div class="tab-ico"></div>
						<em class="tab-text">我的消息</em>
					</div>
				</div>
				<div class="hn-toolbar-footer">
					<div class="hn-toolbar-tab hn-tbar-tab-top">
						<a href="">
							<div class="tab-ico"></div> <em class="tab-text">顶部</em>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script src="./source/jquery.min.js"></script>
	<script src="./source/jquery.cookie.js"></script>
	<script src="./source/jquery.easing.min.js"></script>
	<script src="./source/jquery.lazyload.min.js"></script>
	<script src="./source/jquery.anythingslider.min.js"></script>
	<script src="./source/jqtabs.min.js"></script>
	<script src="./source/jquery-jvectormap.min.js"></script>
	<script src="./source/jquery-jvectormap-cn-merc.js"></script>
	<script src="./source/jquery.hnroller.min.js"></script>
	<script src="./source/jquery.fixedpos.min.js"></script>
	<script src="./source/common.min.js"></script>
	<script src="./source/searchTips4.0.js"></script>
	<script src="./source/index.min.js"></script>
	<script src="./source/lunar.js"></script>
	<script type="text/javascript" src="./source/top_foot.js"></script>
	<script src="./source/index.js" type="text/javascript"></script>
	<link href="./source/newim.css" rel="stylesheet" type="text/css">
	<script language="javascript" src="./source/lhgdialog.min.js"></script>
	<script language="javascript" src="./source/require.js"
		data-main="http://im.cnhnb.com/scripts/pcim/app.js?v=1481278699250"></script>
	<script type="text/javascript" src="./source/store.js"></script>
	<iframe src="./source/crossd_iframe.html"
		style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe>
	<script type="text/javascript" src="./source/attention.js"></script>
	<script type="text/javascript" src="./source/buttomAnimate.min.js"></script>
	<script src="./source/home.js"></script>
	<script src="./source/index(1).js"></script>
	<link href="./source/newim.css" rel="stylesheet" type="text/css">
	<script language="javascript" src="./source/require.js"
		data-main="http://im.cnhnb.com/scripts/pcim/app.js?v=1481278699595"></script>
</body>
</html>
