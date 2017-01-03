<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import ="java.util.List" %>
    <%@ page import ="com.cxs.entity.Product" %>
    <%@ page import ="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="textml; charset=utf-8" />
<link rel="stylesheet" href="css/base.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/common(1).css">
<link rel="stylesheet" href="css/shopping-cart.css">
<title>购物车</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/out-alert.js"></script>
<script type="text/javascript" src="js/shoppingCart.js"></script>

<style>
.container a{
	position:relative;
	bottom:5px;
}
</style>
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
				<h2>购物车</h2>
				<span>Cart<span>
			</div>
		</div>
	</div>

	<div class="container">

		<div class="title">
			<strong>全部商品</strong>
			
	     		<span id="top_total_count1"></span>
	     	
	     	
		</div>
	<div id="cart_div">
	
		<div class="list-title">
			<ul>
				<li class="w-1"><input type="checkbox" id="all" name="allCheck" class="sel-all" checked="checked"></li>
				<li class="w-2"><label for="all">全选</label></li>
				<li class="w-3">商品</li>
				<li class="w-4">单价（元）/千克</li>
				<li class="w-5">数量</li>
				<li class="w-6">小计（元）</li>
				<li class="w-7">操作</li>
			</ul>
		</div>
		
		<% 
List<Product> result=null;
 result=(List<Product>)session.getAttribute("cartlist");

%>
	<%

if(result!=null){
	Product [] re = new Product[result.size()];
	%> 
	
	<% 
	for(int i=0;i<result.size();i++)
	{re[i]=result.get(i);
		
%>	
		
	<div class="oneshop">
		<div class="shop-info" id="607518_shopinfo">
			<ul>
				<li class="w-1">
					<input type="checkbox" class="sel-shop-all" name="checkShop" id="607518_shop" checked="checked">
				</li>
				
			</ul>
		</div>

		<div class="goods_info  clearfix" id="rows_<%=re[i].getPid() %>_">
			<ul class="clearfix">
					<li class="w-1">
							<input name="607518_checkProduct" id="<%=re[i].getPid() %>__product" productshopid="607518" type="checkbox" value="<%=re[i].getPid() %>_" class="cart_product" checked="">    
	                    	<input value="1" type="hidden" id="minBuyCount_<%=re[i].getPid() %>_">
							<input value="" type="hidden" id="<%=re[i].getPid() %>_sourceFrom">
							<input type="hidden" value="" id="price_<%=re[i].getPid() %>_">
						    <input type="hidden" startnumber="1.0" endnumber="10" value="<%=re[i].getPrice() %>" name="product_price_<%=re[i].getPid() %>_">	    
					   </li>
					   
					<li class="w-2">
							<a href=" "target="_blank">
								<img src="images/<%=re[i].getPicture() %>" width="80" height="80" title="">
							</a>		
					</li>
					
					<li class="w-3">
						<a href="" target="_blank">
						    <%=re[i].getPname()%>
						</a>
						<p><%=re[i].getPintro() %></p>
					</li>
					
					<li class="w-4">
						  <%=re[i].getPrice() %>
					</li>
					
					<li class="w-5">
						<button class="left" onclick="javascript:cart.process.minusQty(&#39;<%=re[i].getPid() %>_&#39;);">-</button>
						<input type="text" value="1" class="auto_input" name="<%=re[i].getPid() %>__qty" id="<%=re[i].getPid() %>__qty" style="width: 42px;">
						<button class="right" onclick="javascript:cart.process.addQty(&#39;<%=re[i].getPid() %>_&#39;);">+</button>
						<br><br><p id="c_min_<%=re[i].getPid() %>_" class="red"></p>
					</li>
					
					<li class="w-6">
						<em>
							<span id="amount_<%=re[i].getPid() %>_"></span>&nbsp;	
						</em>
					</li>
					
					<li class="w-7">
						<a href="javascript:cart.process.deleteCartPdt(<%=re[i].getPid() %>);" class="del">删 除</a>
						<a href="AddOrder.jsp?proid=<%=re[i].getPid() %>&num2=<%=re[i].getPid() %>" class="fav">支付</a>
						
						
					
					</li>
				</ul>
			</div>
		</div>
		<%
	}
  }
%>
		
	

<div class="list-bottom" style="position: static;">
			<ul>
				<li class="w-1"><input type="checkbox" class="sel-all" id="all_select" name="allCheck" checked="checked"></li>
				<li class="w-2"><label for="all_select">全选</label> <a href="javascript:void(0);" id="deletePdt_btn">删除</a> 
				<a href="javascript:cart.process.addAllToCollection();">加入收藏</a></li>
				<li class="w-4">&nbsp;</li>
				<li class="w-5">共<em><span class="total-number" id="total_count"></span></em>件商品
				</li>
				<li class="w-6">合计（不含运费)：<em><span class="total-price" id="totalAmount"></span>元</em></li>
				<li class="w-7"><a href="javascript:void(0);" id="submitOrder" style="background-color:#f47a11;border: 1px solid #f47a11;"> 结 算</a>
				
					<input type="hidden" id="productId" name="productId">
					<input type="hidden" id="sourceFrom" name="sourceFrom">
				</li>
			</ul>
		</div>
</body>
</html>