<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags"%>
<%@page import="com.cxs.entity.Product"%>
<%@page import="com.cxs.entity.Order"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认下单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
.orderdetail {
	margin: auto; width : 800px;
	height: 400px;
	border: 1px solid #ddd;
	width: 800px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	border: 1px solid #ddd;
}

.buybtn {
	margin-left: 150px;
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
</style>
  </head>
  <%
  		String proid = request.getParameter("proid");
  		List list = (List) session.getAttribute("list");
  		int cid = (Integer)session.getAttribute("userid");
  		Product pct = null;
  		for (int i = 0; i < list.size(); i++) {
  			pct = (Product) list.get(i);
  			if (pct.getPid() == Integer.parseInt(proid)) {
  				session.setAttribute("readytoorder", pct);
  				break;
  			}
  		}
  	%>
  	<%
  		//生成一个随机的订单号
  		int r1=(int)(Math.random()*(10));//产生2个0-9的随机数
		int r2=(int)(Math.random()*(10));
		long now = System.currentTimeMillis();//一个13位的时间戳
		String paymentID =String.valueOf(r1)+String.valueOf(r2)+String.valueOf(now);// 订单ID
  	 %>
  <body>
  	<a href=”#” onclick="javascript :history.back(-1);">返回上一页</a>
    <div class="orderdetail">
    	<table>
    		<tr style="height:50px;">商品属性</tr>
    		<tr>
    			<td>商品名称</td>
    			<td>售价</td>
    			<td>购买数量</td>
    			<td>小计</td>
    		</tr>
    		<tr>
    			<td><%=pct.getPname() %></td>
    			<td><%=pct.getPrice() %></td>
    			<td><%=request.getParameter("num2") %></td>
    			<td><%= Double.parseDouble(request.getParameter("num2"))*pct.getPrice()%></td>
    		</tr>
    	</table>
    	<table>
    		<tr>订单信息</tr>
    		<tr>
    			<td>卖家ID</td><td><%=pct.getFid() %></td>
    			<td>买家ID</td><td>${userid}</td>
    			<td>订单号</td><td><%=paymentID%></td>
    		</tr>
    	</table>
    	<div>
    		<form action="<%=path %>/order_makeOrder.action" method="post">
    			<label>收货地址：</label><input type="text" name="address">
    			<br><br>
                <input class="buybtn" type="submit" value="确认下单">
                <%
                	Order order = new Order(paymentID,pct.getPname(),Integer.parseInt(request.getParameter("num2")),Double.parseDouble(request.getParameter("num2"))*pct.getPrice(),"未付款",sdf.format(new Date()),"","",1,cid,pct.getPid());
                	session.setAttribute("neworder", order);
                 %>
            </form>
    	</div>
    </div>
  </body>
</html>
