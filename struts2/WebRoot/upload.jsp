<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
.fileupload {
	width:180px;
}

.uploadimg {
	width: 30px;
	height: 30px;
}

.uploadbtn {
	background-color: white;
	border: none;
}
</style>

<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#yulan").click(function(){
			//var filename = $(".fileupload").val().split('\\');
			//alert(filename[2]);
			//var dizhi = "E:/Myeclipse/files/struts2/WebRoot/upload/"+filename[2];
			var dizhi = $(".fileupload").val();
			alert(dizhi);
			$("#yulanimg").attr("src",dizhi);
		});
	});
</script>
  </head>
  
  <body>
    <form action="FileUploadAction" method="POST" enctype="multipart/form-data">
    		
       		 <input class="fileupload" type="file" name="myfile" size="50"/>
       		<button class="uploadbtn"><img class="uploadimg" src="images/camera.png"></button><div><img id="yulanimg" src="" style="width: 100px;height: 100px;"></div>       
    </form>
    <button id="yulan">预览</button>
  </body>
</html>
