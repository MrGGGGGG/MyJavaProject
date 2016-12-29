<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cxs.entity.Product"%>
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
	<style type="text/css">
#productdetail {
	margin-top: 100px;
	width: 600px;
	height: 550px;
	margin: auto;
	border: 1px solid #ff0000;
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
</style>
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
  	<a href="index.jsp">返回主页</a>
  	<a href="fruit.jsp">上一页</a>
    <div id="productdetail">
    	<p><%=pct.getPname() %></p>
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
    				<p>商品介绍：<%=pct.getPintro() %></p>
    			</tr>
    			<tr>
    				
    			</tr>
    		</table>
    		<div style="width:100px;height:10px;margin:100px;display: inline;">
    			<form action="AddOrder.jsp?proid=<%=pct.getPid()%>" method="post">
              		 <font>数量:</font><input id="num1"type="number" name="num2" min="1" max="<%=pct.getPcount()%>"/>
              		 <br><br>
                    <input class="buybtn" type="submit" value="立即购买">
                </form>
                
    		</div>
    	</div>
    </div>
     <%session.setAttribute("epid", proid) ;%>
    <a href= "eva_selecteva?epid=<%=pct.getPid()%>">发表评论</a>
    
  </body>
</html>
