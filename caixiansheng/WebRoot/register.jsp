<%@ page language="java"  import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript" src="js/jquery-1.8.0.js" ></script>
	<script type="text/javascript">
	  var InterValObj; //timer变量，控制时间
	  var count = 60; //间隔函数，1秒执行
	  var curCount;//当前剩余秒数
	function sendMessage(){
		
		  var xmlhttp;
		  var  ctel=document.getElementById("register.ctel").value;

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
		   
		    }
		  }
		  
		xmlhttp.open("post","register_Check.action" ,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("ctel="+ctel);
		   
		
		 		curCount = count;
			//设置button效果，开始计时
			     $("#btnSendCode").attr("disabled", "true");
			     $("#btnSendCode").val(  curCount + "后重新获取");
			     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
		  
	}
	
	function SetRemainTime() {
        if (curCount == 0) {                
            window.clearInterval(InterValObj);//停止计时器
            $("#btnSendCode").removeAttr("disabled");//启用按钮
            $("#btnSendCode").val("重新发送验证码");
        }
        else {
            curCount--;
            $("#btnSendCode").val( curCount + "后重新获取");
        }
    }
	function isPhoneNum(){
		var phonenum=document.getElementById("register.ctel").value;
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
		if(!myreg.test(phonenum)){ 
		document.getElementById("checkcontent").innerHTML="请输入有效的手机号码";
		return false; 
		}else{
		document.getElementById("checkcontent").innerHTML="";
			}
		} 
	</script>
</head>
<body>

	<div class="login-header">
    <span class="logo"><img src="images/cartlogo.png" /></span>
      <a href="index.jsp">返回首页</a>
    <a href="login.jsp">登录</a>
    </div>
	<div class="login-content">
		<div class="pic"><img alt="" src="./images/66667.jpg" width="85%"></div>
		<div class="login-div">
			<div class="login-box">
				
				<form class="login-form" action="<%=path %>/register_Register.action"  method="post">
                <h2>欢迎注册</h2>
					<input type="text" class="login-input" name="register.ctel" id ="register.ctel" placeholder="请输入手机号" onblur="isPhoneNum()">
					<div id="checkcontent"></div><br><br>
					
					<input type="password" class="login-input" name="register.cpsd" id="register.cpsd" placeholder="设置密码"><br><br><br>
					<div class="judge"></div>
                    
                    <input type="text" class="checkword" name="register.checkword" id="register.checkword" placeholder="验证码">
                    <input type="button" class="checkbtn" id="btnSendCode" name="btnSendCode" value="获取验证码" onclick="sendMessage()" ><br><br><br>
                    
					
					<input   type="submit" class="login-btn" id="login-btn" value="立即注册">
                    
                    
                    
				</form>
                
			</div>
		</div>
	</div>
	<div class="login-footer"></div>
</body>
</html>