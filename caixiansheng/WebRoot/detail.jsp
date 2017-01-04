<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.List"%>
<%@page import="com.cxs.entity.Product"%>
<%@page import="com.cxs.entity.Evaluate"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情</title>
    
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
#productdetail {
	margin-top: 100px;
	width: 600px;
	height: 550px;
	margin: auto;
	/*border: 1px solid #ddd;*/
}

#imgcontain {
	width: 200px;
	height: 200px;
	display: block;
	margin: auto;
}

img {
	width: 100%;
	height: 100%;
}

table {
	width: 100%;
}

td {
	border: 1px solid;
}

#info {
	
}

.buybtn {
	margin-left:150px;
	width: 50%;
	height: 40px;
	font-size: 16px;
	font-family: "宋体";
	color: #fff;
	background: #ff9900;
	border: none;
	display: block;
	border-radius: 3px;
	cursor: pointer;
}
#num1{
	width: 70px;
	height: 40px;
}
font{
	margin-left:180px;
}
#biaodan{
	margin:0 auto;
	
	text-align:center;
}
#submit{
	margin-left: 420px;
}
#liuyan{
	padding:5px;
	border:  double #00ff00
}
#content{
	margin:0 auto;
	border:solid;
	border-color:#778899;
	width: 500px;
	height:100px;
	padding:10px;
	overflow: auto;
	background-color:#ADFF2F;
	color: red;
}
#content span{
	color:black;
	font-size: 15px;
	
}
#time{
	 postion:relative;
	 top:250px;
   
	float:right;
	
}
.op-link{
	font-size:25px;
	margin-left: 20px;
}
</style>
</style>
<script type="text/javascript">
function joincart(pid){
	  var xmlhttp;
	   if (window.XMLHttpRequest)
	    {// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	    }
	  else
	    {// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	  
	  xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	   		alert("添加成功！");
	    }
	  }
	  
	xmlhttp.open("post","cart_Cart.action" ,true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("pid="+pid);
}
function showeval(epid){
	
	 var xmlhttp;
	   if (window.XMLHttpRequest)
	    {// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	    }
	  else
	    {// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	  
	  xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
		  $("#content").val("666");
	    }
	  }
	  
    xmlhttp.open("post","eva_selecteva.action" ,true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("epid="+epid);
}
	
</script>
  </head>
  
  <body>
  	<%
  		String proid = request.getParameter("proid");
  		List list = (List) session.getAttribute("list");
  		Product pct = null;
  		for (int i = 0; i < list.size(); i++) {
  			pct = (Product) list.get(i);
  			if (pct.getPid() == Integer.parseInt(proid)) {
			session.setAttribute("readytobuy", pct);
  				break;
  			}
  		}
  	%>
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

  	<a class="op-link" href="fruit.jsp">返回上一页</a>
  	<a class="op-link" href="ChatMain.html">联系商家</a>
    <div id="productdetail">
    	<p style="font-size: 25px;"><%=pct.getPname() %></p>
    	<div id="imgcontain"><img src="images/<%=pct.getPicture()%>"></div>
    	<div id="info">
    		<table>
    			<tr>
    				<td>商品价格：<%=pct.getPrice() %>元/斤</td>
    				<td>上架日期：<%=pct.getPdate() %></td>
    			</tr>
    			<tr>
    				<td>库存量：<%=pct.getPcount() %></td>
    				<td>商品编号： <%=pct.getPid() %></td>
    			</tr>
    			<tr>
    				<p style="font-size: 15px;">商品介绍：<%=pct.getPintro() %></p>
    			</tr>
    			<tr>
    				
    			</tr>
    		</table>
    		
    		<div style="width:100px;height:10px;margin:100px;display: inline;">
    			<form action="AddOrder.jsp?proid=<%=pct.getPid()%>" method="post">
              		 <br><font>数量:</font><input id="num1"type="number" value="1" name="num2" min="1" max="<%=pct.getPcount()%>"/>
              		 <br><br>
                    <input class="buybtn" type="submit" value="立即购买"><br>
                	<input  class="buybtn" type="button" value="加入购物车" onclick="joincart(<%=pct.getPid()%>)">          
                </form>
    		</div>
    	</div>
    	 <%session.setAttribute("epid", proid) ;%>
    	 <br><br>
    	 <a class="op-link" href= "eva_selecteva?epid=<%=pct.getPid()%>">发表评论</a>
    </div>
    
    
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
					
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
