(function($){
		Date.prototype.Format = function (fmt) { 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	 }
	 
	 Array.prototype.unique=function(){
	    var newArr=[],obj={};
	    for(var i=0,len=this.length;i<len;i++){
	        if(!obj[this[i].cateId]){ 
	            newArr.push(this[i]);
	            obj[this[i].cateId]=true;
	        }
	    }
	    return newArr;
	}
	
}(jQuery));


function formatBigDecimal(count){
	if(count){		
		if(count>=10000){
			return  (count/10000).toFixed(1).toString()+"万";
		}else if(count>1000){
			return  (count/1000).toFixed(1).toString()+"千";
		}else{
			return count;
		}
	}else{
		return count;
	}
}

 

/**
*Customize
*
*/

/*搜索下拉框*/
var _fillProductSelectorTimeout = null ;
var _keyword = null ;
var _search_input = null;
var _lastkeyword = null;
var _search_url =init.searchDef;
var purchaseurl=init.purchaseurl;
var supplyurl=init.supplyurl;
var basepathurl=init.basePath;
var staticurl=init.staticurl;
var newsurl=init.newsurl;

var _initProductsData_url = "company/focusAuto";
var categoryUrl=init.basePath+"k/s?keyword=&cateId3=";
var _selected_focus = null;
var _selected_input = null;
var _error_tip = null;
var _cate3_split_value_name = "|";
var maxSupply=5;
var maxPurchase=5;
var maxCommonCategories=10;
var supplyType=1;
var purchaseType=2;
var commonType=3;
var maxTitleLength=9;
var hnUserId;
var localAttentionKey="myattention";
var clientSyncd="client_synchronized";
var lastTimeKey="lastTimeCache";
//毫秒值
var lastTime;
//10分钟
var cacheInternal=10*60*1000;
var category={};

category.supplies=[];
category.purchases=[];
category.commonCategories=[];
category.analysisSupplies=[];
category.analysisPuchases=[];
category.fullSupplies=[];
category.fullPurchases=[];
category.recommends=[];
category.isSyncd=false;
var needSync=false;
var iphoneCookie="show";


function loginCallback(data){
		//设置cookie
		hnLocalStore.getInstance(function(val){
			var date=new Date();
			//30 day
			date.setTime(date.getTime()+30*24*3600*1000); 
			document.cookie="_analysis_client_id="+val+";expires="+date.toGMTString()+";path=/;domain="+getDomain();
		});
		
		if(data){
			hnUserId=data.userId;
			hnLocalStore.getObject(clientSyncd,function(val){
				//未同步, 如果已经同步，登录用户直接从服务器拿到正常数据
				if(!val){
					needSync=true;
					if(needSync){
						hnLocalStore.getObject(localAttentionKey,function(valCategory){
							if(valCategory){
								//TO confirm
								category=valCategory;
								var syncd=true;
								//将本地保存的关注类目同步到服务器
								var json={};
								json.hnUserId=hnUserId;
								json.supplies=category.supplies;
								json.purchases=category.purchases;
								json.commonCategories=category.commonCategories;
								//将本地保存的类目(我的关注，供应，采购)一起同步到服务器
								$.ajax({
									type:'post',
									url: basepathurl+"syncattention",
									data: {data:JSON.stringify(json)},
									dataType:'jsonp',
									jsonp:'callback',
									jsonpCallback:'attentionJsonpCallback',
									async : false,
									cache:false  ,
									success:function(data){
										var flag=data.flag;
										if(flag=="success"){
											 category.supplies=data.categories.supplies;
											 category.purchases=data.categories.purchases;
											 category.commonCategories=data.categories.commonCategories;
											 category.recommends=data.categories.recommends;
											 category.analysisSupplies=data.analysisCategories.supplies;
											 category.analysisPurchases=data.analysisCategories.purchases;
										}else{
											 syncd=false;
										}
									}
								});
								
								if(syncd){
									//覆盖本地clientId
									hnLocalStore.setObject(clientSyncd,true);
									category.isSyncd=true;
									hnLocalStore.setObject(localAttentionKey,category);
									//同步到本地用户ID下???
									hnLocalStore.setObject(localAttentionKey,category,hnUserId);
								}
								//同步完后需要刷类目TAB
								refreshCategories(category);
							}else{
								$.ajax({
									type:'post',
									url: basepathurl+"fullattention",
									data: {hnUserId:hnUserId},
									dataType:'jsonp',
									jsonp:'callback',
									jsonpCallback:'attentionJsonpCallback',
									async : false,
									cache:false  ,
									success:function(data){
											 category.supplies=data.categories.supplies;
											 category.purchases=data.categories.purchases;
											 category.commonCategories=data.categories.commonCategories;
											 category.recommends=data.categories.recommends;
											 category.analysisSupplies=data.analysisCategories.supplies;
											 category.analysisPurchases=data.analysisCategories.purchases;
									}
							  });
							  refreshCategories(category);
							}
						});
					}
				}else{
						$.ajax({
							type:'post',
							url: basepathurl+"fullattention",
							data: {hnUserId:hnUserId},
							dataType:'jsonp',
							jsonp:'callback',
							jsonpCallback:'attentionJsonpCallback',
							async : false,
							cache:false  ,
							success:function(data){
									 category.supplies=data.categories.supplies;
									 category.purchases=data.categories.purchases;
									 category.commonCategories=data.categories.commonCategories;
									 category.recommends=data.categories.recommends;
									 category.analysisSupplies=data.analysisCategories.supplies;
									 category.analysisPurchases=data.analysisCategories.purchases;
							}
						});
						refreshCategories(category);
					
				}
			});
		}else{//未登录用户如果本地有类目
				hnLocalStore.getObject(localAttentionKey,function(val){
					if(val){//本地有数据						
						category=val;
						$.ajax({
							type:'post',
							url: basepathurl+"anonymousattention",
							data: {},
							dataType:'jsonp',
							jsonp:'callback',
							jsonpCallback:'attentionJsonpCallback',
							async : false,
							cache:false  ,
							success:function(data){
				 				category.analysisSupplies=data.supplies;
				 				category.analysisPurchases=data.purchases;
				 				category.recommends=data.recommends;
				 				refreshCategories(category);
							} 
				 		});
						
					}else{//本地无数据
						$.ajax({
							type:'post',
							url: basepathurl+"anonymousattention",
							data: {},
							dataType:'jsonp',
							jsonp:'callback',
							jsonpCallback:'attentionJsonpCallback',
							async : false,
							cache:false  ,
							success:function(data){
				 				category.analysisSupplies=data.supplies;
				 				category.analysisPurchases=data.purchases;
				 				category.recommends=data.recommends;
				 				refreshCategories(category);
							} 
				 		});
					}
				});
		}
		
}

$(document).ready(function(){
		setTimeout(function(){
			loadData("supply-tab1","0",1);
			loadData("purchase-tab1","0",2);
			displayIphoneIco();
			
			updateMarket();	
		},100);
});

function displayIphoneIco(){
	if($(".hn-tbar-tab-iphone").length>0){
			if(getCookie(iphoneCookie)){
					$(".hn-tbar-tab-iphone").show();
			}else{
					$(".hn-tbar-tab-iphone").hide();
			}
	}
}

function getMarketDetailUrl(marketDetail){
	var newsDetailUrl=newsurl+"market/"+marketDetail.areaId+"_"+marketDetail.categoryId+"_"+marketDetail.collectPoint+"_"+marketDetail.keyWorld+"_0";
	return newsDetailUrl;
}

//更新行情
function updateMarket(){
	if($(".market-latest").length==0){
		return ;
	}
	if(init.staticurl){
		staticurl=init.staticurl;
	}
	if(init.newsurl){
		newsurl=init.newsurl;
	}
	$.ajax({
							type:'post',
							url: basepathurl+"getMarket",
							data: {},
							dataType:'jsonp',
							jsonp:'callback',
							jsonpCallback:'attentionJsonpCallback',
							async : false,
							cache:false  ,
							success:function(data){
				 				if(data&&data.length>0){
				 					$(".market-latest .hn-roller").empty();
				 					$(".market-latest .hn-roller").append("<div class='list'></div>");
				 					
				 					$(data).each(function(index, marketDetail){
				 						var markethtml="";
				 						markethtml="<a href='"+getMarketDetailUrl(marketDetail)+"' target='_blank'>";
				 						markethtml=markethtml+"<dl class='clearfix'>";
				 						markethtml=markethtml+"<dt>"+marketDetail.keyWorld+"</dt>";
				 						markethtml=markethtml+"<dd class='place'>"+marketDetail.collectName+"</dd>";
				 						markethtml=markethtml+"<dd class='time'>"+new Date(marketDetail.collectTime).Format('MM-dd')+"</dd>";
				 						markethtml=markethtml+"<dd class='hl'>"+marketDetail.minPrice+"元/公斤</dd>";
				 						if(marketDetail.upInfo==0){
				 								markethtml=markethtml+"<dd class='arr arr-right'>&rarr;</dd>";
				 						}else if(marketDetail.upInfo==1){
				 								markethtml=markethtml+"<dd class='arr arr-up'>&uarr;</dd>";
				 						}else{
				 								markethtml=markethtml+"<dd class='arr arr-down'>&darr;</dd>";
				 						}
				 						markethtml=markethtml+"</dl></a>";
				 						$(".market-latest .hn-roller .list").append(markethtml);
				 					});
				 					if($.IndexView){
				 						$.IndexView.prototype.listRoller();
				 					}
				 					
				 				}else{
				 					$(".market-latest .hn-roller").empty();
				 					$(".market-latest .hn-roller").append("<div class='tips'><img src='"+staticurl+"4.0/images/index/market-latest-empty.gif' alt='暂无信息'><p>暂无最新行情信息</p></div>");
				 				}
				 				
							} 
	});
}

	//请求服务器类目详情
	function loadData(target,cateId,type){
		if($("#"+target).length==0){
			return ;
		}
		$.ajax({
				type:'post',
				url: basepathurl+"attentioncontent",
				data: {type:type,cateId:cateId},
				dataType:'jsonp',
				jsonp:'callback',
				jsonpCallback:'attentionJsonpCallback',
				cache:false,
				async : false,
				success:function(data){
					//清空原有数据
					if(data&&data.flag=="success"){
						$("#"+target+" ul").empty();
						fillAttentionContent(target,type,data.contents);
					}
				}
		});
 	}
 	
 	
    //服务器返回类目详情后更新页面
	function fillAttentionContent (target, type, data) {
		var contentUl=$("#"+target+" ul");
		var liArray=[];
		var _li="";
		if(data&&data.length>0){
			contentUl.parent().find(".tips").hide();
			$(data).each(function(index,val){
				var qtyContent="大量";
				var qtyVar=val.qty;
				var unitName="";
				if(val.unitName){
					unitName=val.unitName;
				}
				if(qtyVar>0){
					qtyContent=val.qty+val.measureUnit;
				}else{
					qtyContent="大量";
				}
				if(type==1){
					
					var price = val.startPrice || 0;
					var content = "";
					if(price && price != null && Number(price) != 0 ){
						content="<li><a href='"+supplyurl+val.supplyId+"' target='_blank'><span class='fr hl'>"+formatBigDecimal(val.startPrice)+"元/"+unitName+"</span><span class='time'>"+new Date(val.createTime).Format('yyyy-MM-dd')+"</span><span>";
					}else{
					    content ="<li><a href='"+supplyurl+val.supplyId+"' target='_blank'><span class='fr hl'>面议</span><span class='time'>"+new Date(val.createTime).Format('yyyy-MM-dd')+"</span><span>";
					}
					var title= val.title;
					if(title == null || title == ""){
						title=val.cateName;
					}
					
					if(title){
						title=title.substring(0, Math.min(title.length,maxTitleLength));
					}else{
						title="";
					}
					
					if(val.breedName!=null&&val.breedName!=""){
//						content=content+title+"<i>/"+val.breedName.substring(0,Math.min(val.breedName.length,maxTitleLength-title.length-1))+"</i>";
						content=content+title ;
					}else{
						content=content+title;
					}
					content=content+"</span></a></li>";
					liArray.push(content);
				}
				if(type==2){
					var content="<li><a href='"+purchaseurl+val.id+"' target='_blank'><span class='fr hl'>"+qtyContent+"</span><span class='time'>"+new Date(val.startTime).Format('yyyy-MM-dd')+"</span><span>";
					var title="";
					if(val.cateName!=null&&val.cateName!=""){
						title=val.cateName;
					}else{
						title=val.buyTitle;
					}
					if(title){
						title=title.substring(0, Math.min(title.length,maxTitleLength));
					}else{
						title="";
					}
					if(val.breedName!=null&&val.breedName!=""){
						content=content+title+"<i>/"+val.breedName.substring(0,Math.min(val.breedName.length,maxTitleLength-title.length-1))+"</i>";
					}else{
						content=content+title;
					}
					content=content+"</span></a></li>";
					liArray.push(content);	
				}
			});
			contentUl.append(liArray.join(""));
		}else{
				contentUl.hide();
				contentUl.parent().find(".tips").show();
		}
	}

	//从服务器取完分类之后的回调
	function fillHeaderAttention(data){
		if(data){
			var supplies=data.supplies;
			var purchases=data.purchases;
			var commonCategories=data.commonCategories;
			var recommends=data.recommends;
			var resultUIArray=[];
			var resultArray=[];
			var supplyArray=[];
			var purchaseArray=[];
			var commonArray=[];
			var hasSupply=false;
			var hasPurchase=false;
			var hasCommon=false;
			var $followAttention=$(".panel").find("div[data-index='0']");
			if(supplies&&supplies.length>0){
				hasSupply=true;
			}
			if(purchases&&purchases.length>0){
				hasPurchase=true;
			}
			if(commonCategories&&commonCategories.length>0){
					hasCommon=true;
			}
			if(hasSupply||hasPurchase||hasCommon){
				$("#noAttention").hide();
				$followAttention.find(".follow-cate").empty();
				if(hasSupply){
					resultArray=resultArray.concat(supplies);
				}
				if(hasPurchase){
					resultArray=resultArray.concat(purchases);
				}
				if(hasCommon){
					resultArray=resultArray.concat(commonCategories);
				}
				resultArray=resultArray.unique();
				$(resultArray).each(function(index,val){
					resultUIArray.push("<a href='"+categoryUrl+val.cateId+"' target='_blank'>"+val.cateName+"</a>");
				});
				$followAttention.find(".follow-cate").append(resultUIArray.join(""));
			}else{
				$followAttention.find(".follow-cate").empty();
				$("#noAttention").show();
			}
		}
	}

	//更新 我的关注 可关注类目数
	function updateAttentionNum(){
		var myAttentionNum=10;
		var $attentionLi=$("#layerAttention .tag2.clearfix a");
		if($attentionLi){
			myAttentionNum=maxCommonCategories-$attentionLi.length;
		}
		if(!$attentionLi||$attentionLi.length==0){
				$("#attentionEmptyLi").show();
		}else{
				$("#attentionEmptyLi").hide();
		}
		$("#layerAttention .hl.ml5").text(myAttentionNum);
	}
	
	//更新 供应 可关注类目数
	function updateSupplyNum(){
		var mySupplyNum=5;
		var $supplyLi=$("#layerSupply .tag2.clearfix a");
		if($supplyLi){
			mySupplyNum=maxSupply-$supplyLi.length;
		}
		if(!$supplyLi||$supplyLi.length==0){
				$("#supplyEmptyLi").show();
		}else{
				$("#supplyEmptyLi").hide();
		}
		
		$("#layerSupply .hl.ml5").text(mySupplyNum);
	}
	//更新 采购 可关注类目数
	function updatePurchaseNum(){
		var myPurchaseNum=5;
		var $purchaseLi=$("#layerPurchase .tag2.clearfix a");
		if($purchaseLi){
			myPurchaseNum=maxPurchase-$purchaseLi.length;
		}
		if(!$purchaseLi||$purchaseLi.length==0){
				$("#purchaseEmptyLi").show();
		}else{
				$("#purchaseEmptyLi").hide();
		}
		$("#layerPurchase .hl.ml5").text(myPurchaseNum);
	}

function addCookie(key, value, expireDays){
 		var date=new Date();
		//30 day
		date.setTime(date.getTime()+expireDays*24*3600*1000); 
		document.cookie=key+"="+value+";expires="+date.toGMTString()+";path=/;domain="+getDomain();
}
function getCookie(key){
	var strCookie=document.cookie;
	var arrCookie=strCookie.split(";");
	var result;
	for(var i=0;i<arrCookie.length;i++){
		var arr=arrCookie[i].split("=");
		if(key==$.trim(arr[0])){
			result=arr[1];
			break;
		}
	}
	return result;
}
 	
function deleteCookie(key){
	if (getCookie(key)){
		document.cookie = key + '=;path=/;domain=' + getDomain()+';expires=Thu, 01-Jan-1970 00:00:01 GMT';
	}
}


$(function(){
	
	
	
	//切换H5
	$(".hn-tbar-tab-iphone").find(".tab-text").on("click",function(){
			deleteCookie(iphoneCookie);
	});
	
	//惠农市场我的关注
	$(".category").on("mouseenter","#categoryMyAttention", function(e){
		
		//直接用本地数据填充
		fillHeaderAttention(category);
		return false;
	});
	
	
	//X 删除供应类目
	$("#layerSupply").on("click", ".icon-del",function(){
		$(this).parent().parent().remove();
		updateSupplyNum();
		return false;
	});
	//X 删除采购类目
	$("#layerPurchase").on("click",".icon-del",function(){
		$(this).parent().parent().remove();
		updatePurchaseNum();
		return false;
	});
	//X 删除我的关注类目
	$("#layerAttention").on("click",".icon-del",function(){
		$(this).parent().parent().remove();
		updateAttentionNum();
		return false;
	});
		
	//取消设置供应
	$(".btn-cancel").click(function(){
		$.IndexView.closePopLayer();
		$(this).parents('.pop-layer-follow').hide();
		if($(this).parents('#layerAttention')){
			$("#layerAttentionBut").show();
		}
	});
	
	//保存我的关注
	$("#layerAttention .btn-submit").click(function(){
		var idArray=[];
		var commonCategoryArray=[];
		
		$("#layerAttention .box").each(function(){
			var categoryObj={};
			categoryObj.cateId=$(this).attr("fid");
			categoryObj.cateName=$(this).attr("fname");
			commonCategoryArray.push(categoryObj);
			idArray.push($(this).attr("fid"));
		});
		//如果有HNUSERID 设置到服务器，
		if(hnUserId){
				category.isSyncd=true;
				$.ajax({
						type:'post',
						url: basepathurl+"saveattention",
						data: {hnUserId:hnUserId,type:3,ids:idArray.join(",")},
						dataType:'jsonp',
						jsonp :'callback',
						jsonpCallback :'attentionJsonpCallback',
						cache:false  ,
						async : false,
						success:function(data){
							var flag=data.flag;
							if(flag=="success"){
								category.analysisSupplies=data.analysiscategories.supplies;
								category.analysisPurchases=data.analysiscategories.purchases;
								category.reommends=data.categories.recommends;
								category.commonCategories=data.categories.commonCategories;
							}
						}
			    });
		}else{//如果没有HNUSERID，直接保存到本地
				category.isSyncd=false;
				hnLocalStore.setObject(clientSyncd,false,hnUserId);
				
		}
		//保存到本地
		category.commonCategories=commonCategoryArray;
		//更新本地hnUserId的数据
		hnLocalStore.setObject(localAttentionKey,category,hnUserId);
		//覆盖本地clientId的数据
		hnLocalStore.setObject(localAttentionKey,category);
		//refreshCategories(category);
		//$.IndexView.closePopLayer();
		$(this).parents('.pop-layer-follow').hide();
		$("#layerAttentionBut").show();
		fillHeaderAttention(category);
	});
	
	//保存供应关注
	$("#layerSupply .btn-submit").click(function(){
		var idArray=[];
		var supplyCategoryArray=[];
		
		$("#layerSupply .box").each(function(){
			var categoryObj={};
			categoryObj.cateId=$(this).attr("fid");
			categoryObj.cateName=$(this).attr("fname");
			supplyCategoryArray.push(categoryObj);
			idArray.push($(this).attr("fid"));
		});
		//如果有HNUSERID 设置到服务器，
		
		
		//如果没有HNUSERID，直接保存到本地
		if(hnUserId){
				category.isSyncd=true;
				$.ajax({
						type:'post',
						url: basepathurl+"saveattention",
						data: {hnUserId:hnUserId,type:1,ids:idArray.join(",")},
						dataType:'json',
						async : false,
						cache:false  ,
						success:function(data){
							var flag=data.flag;
							if(flag=="success"){
								category.analysisSupplies=data.analysiscategories.supplies;
								category.analysisPurchases=data.analysiscategories.purchases;
								category.reommends=data.categories.recommends;
								category.supplies=data.categories.supplies;
							}
						}
			    });
		}else{
				category.isSyncd=false;
				hnLocalStore.setObject(clientSyncd,false,hnUserId);
				
		}
		//保存到本地
		category.supplies=supplyCategoryArray;
		//更新本地hnUserId的数据
		hnLocalStore.setObject(localAttentionKey,category,hnUserId);
		//覆盖本地clientId的数据
		hnLocalStore.setObject(localAttentionKey,category);
		refreshCategories(category);
		$.IndexView.closePopLayer();
	});
	
	//保存采购关注
	$("#layerPurchase .btn-submit").click(function(){
		var idArray=[];
		var purchaseCategoryArray=[];
		$("#layerPurchase .box").each(function(){
			var categoryObj={};
			categoryObj.cateId=$(this).attr("fid");
			categoryObj.cateName=$(this).attr("fname");
			purchaseCategoryArray.push(categoryObj);
			idArray.push($(this).attr("fid"));
		});
		
		if(hnUserId){
				category.isSyncd=true;
				$.ajax({
						type:'post',
						url: basepathurl+"saveattention",
						data: {hnUserId:hnUserId,type:2,ids:idArray.join(",")},
						dataType:'json',
						async : false,
						cache:false  ,
						success:function(data){
							var flag=data.flag;
							if(flag=="success"){
								category.analysisSupplies=data.analysiscategories.supplies;
								category.analysisPurchases=data.analysiscategories.purchases;
								category.reommends=data.categories.recommends;
								category.purchases=data.categories.purchases;
							}
						}
			    });
		}else{
			category.isSyncd=false;
			hnLocalStore.setObject(clientSyncd,false,hnUserId);
		}
		//保存到本地
		category.purchases=purchaseCategoryArray;
		hnLocalStore.setObject(localAttentionKey,category,hnUserId);
		hnLocalStore.setObject(localAttentionKey,category);
		refreshCategories(category);
		$.IndexView.closePopLayer();
	});
	
	//我的关注"设置"按钮
	$("#layerAttentionBut").click(function(){
			$(this).hide();
			$(this).parent().prev('.pop-layer-follow').show();
			if(hnUserId){
					$.ajax({
						type:'post',
						url: basepathurl+"myattention",
						data: {hnUserId:hnUserId,type:3},
						dataType:'json',
						async : false,
						cache:false,
						success:function(data){
							//清空原有数据
			 				fillCommonAttention(data);
			 				updateAttentionNum();
						}
				  });
			}else{
					//从本地拿数据
					fillCommonAttention(category);
					updateAttentionNum();
			}
	});
	
	//采购"设置"按钮
	$("#layerPurchaseBut").click(function(){
			if(hnUserId){
					$.ajax({
						type:'post',
						url: basepathurl+"myattention",
						data: {hnUserId:hnUserId,type:2},
						dataType:'json',
						async : false,
						cache:false,
						success:function(data){
							//清空原有数据
			 				fillPurchaseAttention(data);
			 				updatePurchaseNum();
						}
				  });
			}else{
					//从本地拿数据
					fillPurchaseAttention(category);
					updatePurchaseNum();
			}
	});
	//供应"设置"按钮
	$("#layerSupplyBut").click(function(){
		if(hnUserId){
				$.ajax({
					type:'post',
					url: basepathurl+"myattention",
					data: {hnUserId:hnUserId,type:1},
					dataType:'json',
					async : false,
					cache:false  ,
					success:function(data){
						//清空原有数据
		 				fillSupplyAttention(data);
		 				updateSupplyNum();
					}
				});
		}else{
				fillSupplyAttention(category);
				updateSupplyNum();
		}
	});
	
	//点"设置"后填充服务器返回的我的关注
	function fillCommonAttention(data){
		var recommends=data.recommends;
		var commonCategories=data.commonCategories;
		var $recommends=$("#attentionTag1");
		var $commonCategories=$("#attentionClearfix");
		$recommends.empty();
		$commonCategories.empty();
		
		if(recommends){
			$(recommends).each(function(index, val){
				$recommends.append("<li> <label> <input type='checkbox' class='check' fid='"+val.cateId+"' fname='"+val.cateName+"'>"+val.cateName+" </label> </li>");
			});
		}
		$commonCategories.append("<li id='attentionEmptyLi'>这个人太懒，什么也没有关注。</li>");
		if(!commonCategories||commonCategories.length==0){
				$("#attentionEmptyLi").show();
		}else{
				$("#attentionEmptyLi").hide();
		}
		if(commonCategories){
			$(commonCategories).each(function(index, val){
				$commonCategories.append("<li><a href='#' class='box' fname='"+val.cateName+"' fid='"+val.cateId+"'>"+val.cateName+"<span class='icon-del'>X</span></a></li>");
			});
		}
	}
	
	//点"设置"后填充服务器返回的供应关注
	function fillSupplyAttention(data){
		var recommends=data.recommends;
		var supplies=data.supplies;
		var $recommends=$("#supplyTag1");
		var $supplies=$("#supplyClearfix");
		$recommends.empty();
		$supplies.empty();
		
		if(recommends){
			$(recommends).each(function(index, val){
				$recommends.append("<li> <label> <input type='checkbox' class='check' fid='"+val.cateId+"' fname='"+val.cateName+"'>"+val.cateName+" </label> </li>");
			});
		}
		$supplies.append("<li id='supplyEmptyLi'>这个人太懒，什么也没有关注。</li>");
		if(!supplies||supplies.length==0){
				$("#supplyEmptyLi").show();
		}else{
				$("#supplyEmptyLi").hide();
		}
		if(supplies){
			$(supplies).each(function(index, val){
				$supplies.append("<li><a href='#' class='box' fname='"+val.cateName+"' fid='"+val.cateId+"'>"+val.cateName+"<span class='icon-del'>X</span></a></li>");
			});
		}
	}
	//点"设置"后填充服务器返回的采购关注
	function fillPurchaseAttention(data){
		var recommends=data.recommends;
		var purchases=data.purchases;
		var $recommends=$("#purchaseTag1");
		var $purchases=$("#purchaseClearfix");
		$recommends.empty();
		$purchases.empty();
		if(recommends){
			$(recommends).each(function(index, val){
				$recommends.append("<li> <label> <input type='checkbox' class='check' fid='"+val.cateId+"' fname='"+val.cateName+"'>"+val.cateName+" </label> </li>");
			});
		}
		
		$purchases.append("<li id='purchaseEmptyLi'>这个人太懒，什么也没有关注。</li>");
		if(!purchases||purchases.length==0){
				$("#purchaseEmptyLi").show();
		}else{
				$("#purchaseEmptyLi").hide();
		}
		if(purchases){
			$(purchases).each(function(index, val){
				$purchases.append("<li><a href='#' class='box' fname='"+val.cateName+"' fid='"+val.cateId+"'>"+val.cateName+"<span class='icon-del'>X</span></a></li>");
				
			});
		}
	}
	//类目下的数据
	$("#supplyTabUl li a").on("mouseenter", function(){
		var cateId=$(this).attr("fid");
		var target=$(this).attr("ulLink");
		loadData(target,cateId,supplyType);
	});
	
	$("#purchaseTabUl li a").on("mouseenter", function(){
		var cateId=$(this).attr("fid");
		var target=$(this).attr("ulLink");
		loadData(target,cateId,purchaseType);
	});
	
	$("#layerSupply,#layerPurchase,#layerAttention").each(function(index, element){
		var $tag = $(element).find('.tag1.clearfix');
		var $follow = $(element).find('.tag2.clearfix');
		var $org = $(element).find('.hl.ml5');
		var $biao = $(element).find('.keywords');
		var $searchItem = $(element).find('.fd-search ul li a');

		$searchItem.click(function(){
				var value = $(this).text();
				var name = $.trim(value.indexOf(">")>0?value.substring(value.lastIndexOf(">")+1,value.length):value);
				var fid = $(this).parent().attr("val").split(_cate3_split_value_name)[1];
				$biao.val(name);
				adjustFocus($follow,$org,fid,name);
				e.preventDefault();
		});
		
		if($(this).attr("id")=="layerAttention"){
				 //从热门推荐中关注
				$("#layerAttention").on("click", ".check", function(event){
					var obj = event.target || event.srcElement;
					var t = $(this);
					var fid = t.attr("fid");
					var val = t.attr("fname");
					$follow=$("#attentionClearfix");
					if(obj.checked){
						adjustFocus($follow,$org,fid,val);
					}
				});
		}
		if($(this).attr("id")=="layerSupply"){
				 //从热门推荐中关注供应
				$("#layerSupply").on("click", ".check", function(event){
					var obj = event.target || event.srcElement;
					var t = $(this);
					var fid = t.attr("fid");
					var val = t.attr("fname");
					$follow=$("#supplyClearfix");
					if(obj.checked){
						adjustFocus($follow,$org,fid,val);
					}
				});
		}
		
		if($(this).attr("id")=="layerPurchase"){
				//从热门推荐中关注采购
			$("#layerPurchase").on("click", ".check", function(event){
				var obj = event.target || event.srcElement;
				var t = $(this);
				var fid = t.attr("fid");
				var val = t.attr("fname");
				$follow=$("#purchaseClearfix");
				if(obj.checked){
					adjustFocus($follow,$org,fid,val);
				}
			});
		}
	});
	
	var select_name;
	var search_drop = 0;
	var key = 0;
	var dropNumber = 0;
	/*搜索框输入框事件*/
	$('.keywords').on('focus keyup input click',function(event){
		var keyword = $(this).val();
		var keyCode = event.keyCode || event.which;
		if($(this).attr("id").indexOf("f_supply")>-1){
				_selected_focus="#f_supply_cate";
				_selected_input="#f_supply";
		}
		if($(this).attr("id").indexOf("f_purchase")>-1){
				_selected_focus="#f_purchase_cate";
				_selected_input="#f_purchase";
		}
		if($(this).attr("id").indexOf("f_attention")>-1){
				_selected_focus="#f_attention_cate";
				_selected_input="#f_attention";
		}
		
		_error_tip = _selected_focus.indexOf("f_supply")!=-1?".layerSupply .errorWrapper" : ".layerPurchase .errorWrapper";
		if($.trim(keyword) == ''){
			$(_error_tip).show();
			search_drop_hideAttention();
		}else{
			$(_error_tip).hide();
			_search_input = keyword;
			//每次有输入的情况下则丢掉上次请求
			if(_fillProductSelectorTimeout != null) clearTimeout(_fillProductSelectorTimeout);
			//上下按键则不处理
			if(keyCode == 40 || keyCode == 38) return ;
			_fillProductsSelectorAttention();
		}
	});
	
	

	function _fillProductsSelectorAttention(){
		//输入信息
		_keyword = $.trim(_search_input);
		_fillProductSelectorTimeout = setTimeout(_fillProductsDataAttention,500)
	}
	
	
	function _fillProductsDataAttention(){
		if(_lastkeyword == _keyword && $(_selected_focus +' ul li').length > 0 ) return ;
		$.ajax({
			type:'post',
			url: _search_url + _initProductsData_url,
			data: {keyword: encodeURIComponent(_keyword) , t: Math.random()},
			dataType:'jsonp',
			jsonp :'callback',
			cache:false  ,
			jsonpCallback :'_fillProductsAttention',
			success:function(data){
				//清空原有数据
 				_fillProductsAttention(data);
				if(data && data.length > 0){
					search_drop = 1;
				}
			}
		});
		_lastkeyword = _keyword;
	}
	
	
	/*搜索下拉框隐藏*/
	function search_drop_hideAttention(){
		$(_selected_focus).hide();
		search_drop = 0;
		dropNumber = 0;
	}
	/*鼠标点击下拉框外 下拉框消失*/
	$(document).click(function() {
		$('.fd-search').hide();
	})
	$('.fd-search').click(function(event) {
		var obj = event.target || event.srcElement;
		if((obj['tagName'] || "").toLowerCase() == 'li'){
			$(obj).trigger("selected");
		}
		event.stopPropagation();
	})
	$('.keywords').click(function(event) {
		event.stopPropagation();
	})
	/*监测键盘事件*/
	$(document).keydown(function(event){
		var keyCode = event.keyCode || event.which;
		if(keyCode == 38 || keyCode == 40){
			dropMoveAttention(keyCode);
			event.preventDefault();
		}
		if(keyCode == 13) {
			dropSelectAttention();
			event.preventDefault();
		}
	}); 
	//上下箭头事件
	function dropMoveAttention(keyCode){
		if(keyCode == 38)dropNumber = dropNumber - 1;
		if(keyCode == 40)dropNumber = dropNumber + 1;
		var total = $(_selected_focus+' li').length;
		var height = $(_selected_focus+' li').height();
		if(dropNumber > total)dropNumber = 1;
		if(dropNumber < 1)dropNumber = total;
		if(search_drop == 1){
				$(_selected_focus+' li').removeClass('cur').find('a').blur();
				$(_selected_focus+' li').eq(dropNumber-1).addClass('cur').find('a').focus();
				$(_selected_focus).scrollTop((dropNumber-1)*height);
		
		}
	}
	function dropSelectAttention() {
				var curr_li=$(_selected_focus+' li').eq(dropNumber-1);
				select_name = curr_li.text();
				var s_keyword=select_name.indexOf(">")>0?select_name.substring(select_name.lastIndexOf(">")+1,select_name.length):select_name;
				var s_cate3Id=curr_li.attr("val");
				s_cate3Id=s_cate3Id.substring(s_cate3Id.indexOf("|")+1,s_cate3Id.length);
				
				$(_selected_input).val($.trim(s_keyword));
				
				subFilterAttention($(curr_li));
		}
});

function _fillProductsAttention(data){
	$(_selected_focus+' ul').empty();
	data = eval("("+data+")");
	if(data && data.length > 0){
		var productDropHtml  = "";
		$(data).each(function(){
			var p = $(this);
			productDropHtml += "<li val='"+(p.attr("value") || '')+"'>"+(p.attr("name") || '')+"</li>";
		});
		$(_selected_focus+' ul').append(productDropHtml);
		dropNumber = 0;
		search_drop_showAttention();
	}else{
		$(_selected_focus).hide();
	}
}

/*搜索下拉框显示*/
function search_drop_showAttention(){
	var top = $('.keywords').offset().top + $('.keywords').height() + 3;
	var left = $('.keywords').offset().left;
	$('.fd-search').css('top',top);
	$('.fd-search').css('left',left);
	$(_selected_focus).show();
	complete_focus_data();
}

function complete_focus_data(){
	$(_selected_focus+' ul li ').each(function(i,val){ 
		var focusNames = [];
		focusNames=$(val).text().split(">");
		var _name = '';
		var first = focusNames[0];
		var second = focusNames[1];
		var third = focusNames[2];
		if(first.indexOf(_keyword)!=-1){
			_name = "<span>"+focusNames[0]+" &gt; </span> ";
		}else{
			_name = first+" &gt; ";
		}
		if(second.indexOf(_keyword)!=-1){
			_name += "<span>"+focusNames[1]+" &gt;</span> ";
		}else{
			_name += second+" &gt; ";
		}
		if(third.indexOf(_keyword)!=-1){
			_name += "<span>"+focusNames[2]+"</span> ";
		}else{
			_name += third;
		}
		$(this).html("<a href='#'>"+_name+"</a>");
		var $searchItem = $(this).find('a');
		$searchItem.click(function(){
			if($(_selected_focus).attr("id").indexOf("f_supply")>-1){
				_selected_focus="#layerSupply";
			}
			if($(_selected_focus).attr("id").indexOf("f_purchase")>-1){
				_selected_focus="#layerPurchase";
			}
			if($(_selected_focus).attr("id").indexOf("f_attention")>-1){
				_selected_focus="#layerAttention";
			}
			var $follow=$(_selected_focus+' .tag2.clearfix');
			var $org = $(_selected_focus+' .hl.ml5');
			var $biao = $(_selected_focus+' .keywords');
			var fid = $(this).parent().attr("val").split(_cate3_split_value_name)[1];
			$biao.val("");
			adjustFocus($follow,$org,fid,third);
			
			return false;
		});
	}); 
}

/*
*@param follow 往哪个地方添加
*@param org 可关注多少个类目span
*@param fid 要添加的类目id
*@param val 添加的类目名称
*
*/
function adjustFocus($follow,$org,fid,val){
		
		var add = 0;
		var $selected = $follow.find("li a");
		var idArray;
		var val=$.trim(val);
		if(fid){
			if(fid.indexOf("-")>-1){
				fid=fid.split("-")[0];
			}
		}
		if($follow.attr("id").indexOf("attentionClearfix")>-1){
			if($selected.length==maxCommonCategories){
				add=1;
				alert("最多关注"+maxCommonCategories+"个类别!");return;
			}
		}else{
			if($selected.length==maxSupply){
				add=1;
				alert("最多关注"+maxSupply+"个类别!");return;
			}
		}
		
			$selected.each(function(i){
				var _t = $(this);
				var _fid = _t.attr("fid");
				if(fid==_fid){
					add = 1;
					alert("您已经关注过该类型!");
					return false;
				}
				
			});
			if(add==0){
				$follow.append("<li><a href='#' class='box' fname='"+val+"' fid="+fid+">"+val+"<span class='icon-del'>X</span></a></li>");
				if($follow.attr("id")=="supplyClearfix"){
					updateSupplyNum();
				}
				if($follow.attr("id")=="purchaseClearfix"){
					updatePurchaseNum();
				}
				if($follow.attr("id")=="attentionClearfix"){
					updateAttentionNum();
				}
			}
			$('.fd-search').hide();
}

function subFilterAttention(t){	
		var val = t.text();
		var s_keyword=val.indexOf(">")>0?val.substring(val.lastIndexOf(">")+1,val.length):val;
		var s_cate3Id=t.attr("val");
		var fid=s_cate3Id.substring(s_cate3Id.indexOf("|")+1,s_cate3Id.length);
		
		var add = 0;
		var _selected = t.parent().attr("id")!="category"?"#tag2-s div" : "#tag2-p div";
		var _pur = t.parent().attr("id")!="category"?".supplies .org-txt" : ".purchase .org-txt";
		
		if($(_selected).length==5){
			add=1;
			alert("关注最多5个类别!");return ;
		}
		
		$(_selected).each(function(i){
			var _t = $(this);
			var _fid = _t.find("i").attr("fid");
			var _val = _t.text();
			if(fid.indexOf(_fid)>-1&&s_keyword.indexOf(_val)>-1){
				add = 1;
				alert("您已经关注过该类型!");return false;
			}
			
		});
		if(add==0){
			$(_selected.split(" ")[0]).append("<div class='a'><i class='icon-del' fid='"+fid+"'></i>"+s_keyword+"</div>");
			$(_pur).html(parseInt($.trim($(_pur).text()))-1);	
		}
}

//重刷类目TAB
function refreshCategories(categories){
	var supplies=categories.supplies;
	var purchases=categories.purchases;
	var analysisSupplies=categories.analysisSupplies;
	var analysisPurchases=categories.analysisPurchases;
	var recommends=categories.recommends;
	var mergedSupplies=mergeCategories(supplies,analysisSupplies,recommends);
	var mergedPurchases=mergeCategories(purchases,analysisPurchases,recommends);
	
	if(mergedSupplies){
		$("#supplyTabUl li a[fid!=0]").each(function(index, val){
			var tabIndex=index+2;
			if(mergedSupplies[index]){
				$(this).attr("fid",mergedSupplies[index].cateId);
				$(this).attr("ulLink","supply-tab"+tabIndex);
				$(this).text(mergedSupplies[index].cateName);
			}
		});
	}
	if(mergedPurchases){
		$("#purchaseTabUl li a[fid!=0]").each(function(index, val){
			var tabIndex=index+2;
			if(mergedPurchases[index]){
				$(this).attr("fid",mergedPurchases[index].cateId);
				$(this).attr("ulLink","purchase-tab"+tabIndex);
				$(this).text(mergedPurchases[index].cateName);
			}
		});
	}
	
}

function getDomain(){
 	  var domain = window.document.domain; //http://www.cnhnb.com
 	  var domainchars = domain.split(".");
 	  domain = "";
 	  for(var i = 1 ; i < domainchars.length ; i ++){
 		 domain += (i == 1 ? "" : ".") + domainchars[i] ;
 	  }
 	  return domain ;
}

function mergeCategories(attentionArray, analysisArray, recommendsArray){
	var result=[];
	var max=5;
	if(attentionArray){
		result=result.concat(attentionArray);
	}
	var size=result.length;
	if(analysisArray){
		$.map(analysisArray,function(item){
			var contained=false;
			if(size<max){
				if(attentionArray){
					$.map(attentionArray, function(item1){
						if(item.cateId==item1.cateId){
							contained=true;
						}
					});
				}
				if(!contained){
					result.push(item);
					size=size+1;
				}
			}
		});
	}
	if(recommendsArray){
		size=result.length;
		$.map(recommendsArray, function(item){
			var contained=false;
			if(size<max){
				$.map(result, function(item1){
					if(item.cateId==item1.cateId){
						contained=true;
					}
				});
				if(!contained){
					result.push(item);
					size=size+1;
				}
			}
		});
	}
	return result;
}

function attentionJsonpCallback (data) {
	
}	 