<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>ajax文件上传</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#upbutton").click(function() {
			$.ajaxFileUpload(
				{
					url : 'fileAction.action',
					secureuri : false,
					fileElementId : 'file',
					dataType : 'json',
					success : function(data,status) {
						alert(data.message);
						//alert(data.message);
						//$("#yulanimg").attr("src",data.message);
						$("#sc").after("<img id='yulanimg' src='upload/"+data.message+"' style='width: 100px;height: 100px;'>");
					},
					error : function(data, status, e) {
						//var D=JSON.parse(data);
						alert(e);
					}
				}
			)
			return false;
		});
	});
	
	function stopload(){
		return false; 
	}
</script>
<!-- 
	$.ajax(
				{
					url : 'fileAction.action', //用于文件上传的服务器端请求地址
					fileElementId : 'file', //文件上传空间的id属性  <input type="file" id="file" name="file" />
					dataType : 'json', //返回值类型 一般设置为json
					success : function(data, status) //服务器成功响应处理函数
					{
						//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
						alert(data.message);
					},
					error : function(data, status, e) //服务器响应失败处理函数
					{
						alert(e);
					}
				}
			)


	$(document).ready(function(){
		$("#upbutton").click(function() {
			alert("点击成功");
			$.ajaxFileUpload(
				{
					url : 'fileAction.action', //用于文件上传的服务器端请求地址
					secureuri : false, //一般设置为false
					fileElementId : 'file', //文件上传空间的id属性  <input type="file" id="file" name="file" />
					dataType : 'json', //返回值类型 一般设置为json
					success : function(data, status) //服务器成功响应处理函数
					{
						//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
						alert(data.message);
					},
					error : function(data, status, e) //服务器响应失败处理函数
					{
						alert(e);
					}
				}
			)
		});
	});
 -->
</head>

<body>
	<div id="sc" style="width: 100%; float: left;">
	<form id="uploadform" action="fileAction.action" onsubmit="stopload()">
		<input type="text">
		<input id="file" type="file" name="file" />
		<button id="upbutton" class="upload" onclick="return false;">上传</button>
	</form>
	</div>
		
</body>
</html>
