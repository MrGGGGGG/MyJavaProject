<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import ="com.cxs.entity.Evaluate" %>
<%@ page import ="com.cxs.entity.Product" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/base.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/common(1).css">
<title>商品评论</title>
<style>
#evaluate{
	margin:0 auto;
	margin-top:50px;
	text-align:center;
	position:relative;
	top:10%;
	
	
	
}
#button{
	margin:10px;
    width: 10%;
    height: 40px;
    font-size: 16px;
    font-family: "宋体";
    color: #fff;
    background: #3498db;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    position:relative;
    right:-12%;
	
}
#picture{
	margin:30px;
	width:10%;
	float:left;
	position:relative;
	left:20%;
	
	
}
#evaluateecont{
	margin:5px;
	margin-color:red;
	padding:10px 25px;
	border:  double #3498db;
	text-align:center;
	
	
	
}
#content{
	margin:0 auto;
	border-style:ridge  none none none;
	border-color:#778899;
	width: 50%;
	height:100px;
	padding:10px;
	overflow: auto;
	background-color:#FFFFFF;
	color: #3498db;
	
}
#content span{
	color:black;
	font-size: 15px;
	
}
#time{
	margin-top:55px;
	float:right;
}
.container a{
	position:relative;
	bottom:5px;
}
</style>
<script>
function showevaluate(){
	
	  var xmlhttp;
	  var  econt=document.getElementById("evaluateecont").value;

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
	   window.location.reload();
	    }
	  }
	  
	xmlhttp.open("post","eva_publisheva.action" ,true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("econt="+econt);
	  
}
</script>
</head>
<body>
<div class="topbar"><div class="container clearfix">
     
     <li>
      <ul class="fl" id="userNoLoginInfo">
	      <li class="label orange">您好，欢迎来到菜鲜生</li>
	      
			</ul>
	 </li>
      

    <ul class="top-nav fr">
      <li class="pngfix" id="hn_home_id">
        <div class="label"><a href="index.jsp" rel="nofollow">首页</a></div>
      </li>
      <li class="pngfix">
        <div class="label"><a href="order_showMyOrder" rel="nofollow">我的订单</a></div>
      </li>

    </ul>
  </div>
</div>

<div class="header" style="height:70px;">
		<div class="container">
			<a href="index.jsp" target="_blank" class="logo"><img src="images/cartlogo.png" class="pngfix"></a>
			<div class="webname">
				<h2>商品评论</h2>
				<span>Evaluate</span>
			</div>
		</div>
	</div>
<!--
<form action="<%=path %>/eva_publisheva.action" method="get" id="evaluate">
    <textarea name="evaluate.econt" id="evaluate.econt" cols="75" rows="15" ></textarea><br />
    <input type="submit" value="评论" id="submit"/>
</form>
-->
	<%
		String ppp=session.getAttribute("epid").toString();
		int epid =Integer.parseInt(ppp);
  		List list = (List) session.getAttribute("list");
  		Product pct = null;
  		for (int i = 0; i < list.size(); i++) {
  			pct = (Product) list.get(i);
  			if (pct.getPid() == epid) {
			
  				break;
  			}
  		}
  		
  		
  		
  	%>
<div id="picture">
	
	<a href="detail.jsp?proid=<%=pct.getPid()%>"><img src="images/<%=pct.getPicture() %>" width="180" height="180"></a>
	<div><%=pct.getPintro() %></div>
</div>

<div id="evaluate"> 
	<textarea name="evaluateecont" id="evaluateecont" cols="75" rows="7" ></textarea><br />
    <input type="button" value="发表评论" onclick="showevaluate()" id="button">
</div>
<br />

  <% 
List<Evaluate> message=null;
 message=(List<Evaluate>)session.getAttribute("evaluate");
 %>
 
 <%
if(message!=null){
	Evaluate [] res = new Evaluate[message.size()];
%>
 
 <%
 for(int i=0;i<message.size();i++)
 {res[i]=message.get(i); %>
<div id="content">
	
      用户<%=res[i].getEvid() %><br>
      <span>
      <%=res[i].getEcont() %>
      </span>
     <span id="time">
	<%=res[i].getEvdate() %>
	</span>
	
</div>
<%} }%>
</body>
</html>