var _inx =(function(p){
	var obj = {
			keyword : {},
		    homeUrl : '',
		  staticUrl : '',
		    userUrl : ''
	};
	obj.initParam = function(args){
		   this.keyword['value'] = args[0];
		   this.homeUrl = args[1];
		   this.staticUrl = args[2];
		   this.userUrl = args[3];
	}
	obj.initVal = function(){
		//删除 top 惠农首页
		$("#hn_home_id").remove();
		//日期初始化
		var _d = getHomeDate();
		$(".side-cal .title span").html(_d.ymd);
		$(".side-cal .title em").html(_d.weekday);
		$(".side-cal .inner img").attr("alt",_d.lmonth+""+_d.lday);
		$(".side-cal .inner .month").html(_d.lmonth);
		$(".side-cal .inner .day").html(_d.lday);
	};
	
	obj.initLogonUserPanel = function (){
		var basepath=obj.homeUrl;
		//首页才存在该面板
		var userInfoPanel = $(".side-log .user");
		if(!userInfoPanel　|| userInfoPanel.length == 0) return ;
		//请求用户信息
		$.ajax({    
	        url: basepath+"initLogonUserPanel",  // 跨域URL   
	        type: 'POST',    
	        dataType: 'jsonp',  
	        jsonp : "callback",
	        jsonpCallback:"getPanelInfo",
	        success: function (data) {
	          var hnUserId = data.hnUserId;
	        	if(hnUserId){
	        		if(data.linkMan !=undefined && $.trim(data.linkMan)!=""){
	        			$(".side-log .user .name em").text(data.linkMan);
	        		}
	        		var logoes = data.logoes || [];
	        		if(logoes){
	        			//var _iconsStr = '<img src="'+(data.ico || '')+'" onclick="turnMyhnPoint();" style="cursor:pointer"  title="'+(data.icoDescription || '')+'" alt="'+(data.icoDescription || '')+'" width="48" height="18">';//积分
	        			var _iconsStr = '' ;
	        			for(var i = 0 ; i <  logoes.length ; i++){
	        				var logo = logoes[i] || {};
	        				_iconsStr +='<img src="'+(logo.logoUrl || '')+'" onclick="turnMyhn();" style="cursor:pointer"  title="'+(logo.description || '')+'" alt="'+(logo.description || '')+'" width="18" height="18">';
	        			}
	        			$(".side-log .btns").hide();
	        			$(".side-log .user").show();
	        			$(".side-log .user .icons").html(_iconsStr);
	        		}
	        	}
	        	
	        } 
	    });
	};
	//初始化参数
    obj.initParam(p);
    obj.initVal();
    obj.initLogonUserPanel();
    //获取供应数据，并设置列表值
  //  obj.getSupplyList();
    
	
})(param);


function turnMyhnPoint(){
	var userWeb=param[3];
	window.open(userWeb+"sellers/userlevel");
}

function turnMyhn(){
	/*
	var userWeb=param[3];
	window.open(userWeb+"buyers/goCertification");
	*/
	return false;
}
