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

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#addform").validate({
			rules:{
				'product.pname':{
					required:true,
				},
				'product.pintro':{
					required:true,
				},
				'product.pcount':{
					required:true,
				},
				'product.price':{
					required:true,
				},
				'product.fid':{
					required:true,
				}
			},
			messages:{
				'product.pname':{
					required:"请输入商品名称",
				},
				'product.pintro':{
					required:"请输入商品介绍",
				},
				'product.pcount':{
					required:"请输入库存数量",
				},
				'product.price':{
					required:"请输入商品单价",
				},
				'product.fid':{
					required:"请输入农户编号",
				}
			}
		});
	});
</script>

<style type="text/css">
	.error{
		color: red;
	}
	.contain{
		width: 400px;
		margin:0 auto;
	}
</style>
</head>

<body>
	<div class="contain">
		<form id="addform" action="${pageContext.request.contextPath}/product_docreat.action" method="POST" enctype="multipart/form-data">
		<p>
			<label>商品名称</label>
			<input type="text" id="proname" name="product.pname">
		</p>
		<p>
			<label>商品介绍</label>
			<input type="text" id="proinstro" name="product.pintro">
		</p>
		<p>
			<label>库存数量</label>
			<input type="text" id="procount" name="product.pcount">
		</p>
		<p>
			<label>商品价格</label>
			<input type="text" id="proprice" name="product.price">
		</p>
		<p>
			<label>商品图片</label>
			<input type="file" id="proimg" name="file">
		</p>
		<p>
			<label>产品类型</label>
			<select id="prokind" name="typeid">
				<option value="1">水果</option>
				<option value="2">蔬菜</option>
				<option value="3">家禽</option>
				<option value="4">特产</option>
			</select>
		</p>
		<p>
			<label>农户编号</label>
			<input type="text" id="farmerid" name="product.fid">
		</p>
		<p>
			<input type="submit" value="提交">
		</p>
		</form>
	</div>
</body>
</html>
