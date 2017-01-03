<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<title>服务中心</title>

<link rel="stylesheet" href="css/ss-standard.css" />
<link rel="stylesheet" href="css/head.css" />
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/common(1).css">
<link rel="stylesheet" href="css/shopping-cart.css">
<link rel="stylesheet" href="css/base.min.css">

<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">

<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vue1oix.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
<script src="js/modernizr.js"></script>
<link rel="stylesheet" href="css/style.css" />
<script src="js/javascript.js"></script>

<script>

$(document).ready(function() {
	
	$('#block-slide').blockSlide({
		
		'imgurl':	'images/background.jpg',
		'animation':'slide'
		
	}, 
	
	{
		'images/goinkefu.jpg' :    "<h1>联系客服</h1>"
						+"<h2>你即将进入人工客服</h2>"
						+"<p></p>"
						+"<div class='button' id='button1'>确认进入!</div>"
					+"</div>",
					
		'images/shouhoufuwu.jpg' :    "<h1>售后服务</h1>"
						
						+"<p></p>"
						+"<div class='button' id='button2'>确认进入</div>"
					+"</div>",
					
		'images/tousuchuli.jpg' :    "<h1>投诉处罚</h1>"
						
						+"<p></p>"
						+"<div class='button' id='button3'>确认进入</div>"
					+"</div>",
					
		'images/shequwenda.jpg' :    "<h1>社区问答</h1>"
						+"<h2>你即将进入社区问答的多人聊天室</h2>"
						+"<p></p>"
						+"<div class='button' id='button4' >确认进入</div>"
					+"</div>",
					
		
	});
	
});

$(document).ready(function(){
  $("#button4").click(function(){
	  $.ajax({
          type:"POST",
          url:"DealData.jsp",
          data:"action=login&d="+new Date(),
          success:function(data){
              if(data.indexOf("True")>0){
                  window.location="ChatMain.html";
              }else{
                  alert("你尚未登录，请先登录")
                  window.location="login.jsp"; 
                  return false;
              }
          }
      });
  });
});
$(document).ready(function(){
	$("#button1").click(function(){
		
		window.open('http://wpa.qq.com/msgrd?v=3&uin=2517781703&site=qq&menu=yes');
	});
});

</script>


<style >
	.head{
		height: 30px;
	}
	.topbar{
		height: 30px;
	}
	#search{
	margin-top:120px;
	text-align:center;
	}
	#search h1{
	font-family: Microsoft Yahei;
    font-size: 14px;
	text-align:center;
	margin-bottom:12px;
	}
	.search-bar-input {
	
    font-family: Microsoft Yahei;
    font-size: 14px;
    border-radius: 15px 0 0 0;
    outline: none;
    height: 32px;
    line-height: 30px;
    vertical-align: middle;
    border: 1px solid #dcdcdc;
    border-right: none;
    padding-left: 23px;
    padding-right: 30px;
    width: 462px;
}
	 .search-bar-btn {
    width: 70px;
    height: 41px;
    line-height: 44px;
    border-radius: 0 40px 40px 0;
    border-top: 1px solid #57a4ff;
    background: rgb(87, 164, 255);
    vertical-align: middle;
    color: #fff;
    font-size: 16px;
    outline: none;
    cursor: pointer;
    position:relative;
    left:-5px;
}
#block-slide{
	background-image: url("images/background.jpg");
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

<div id="block-slide">
</div>

<div id="search">
<h1>--问题搜索--</h1>
<input type="text" class="search-bar-input" value="" maxlength="100" autocapitalize="none" autocomplete="off" autocorrect="off" placeholder="请用一句话描述您的问题，比如：“商品不满意如何退货？”">
<button class="search-bar-btn">搜索</button>
</div>

</body>
</html>