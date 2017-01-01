$(document).ready(function(){
	var count=0;
	$("#upbutton").click(function() {
		if(count<3){
		$.ajaxFileUpload(
			{
				url : 'fileAction.action',
				secureuri : false,
				fileElementId : 'file',
				dataType : 'json',
				success : function(data,status) {
					$(".under-above-below").after("<img id='yulanimg' src='images/"+data.message+"' style='width: 100px;height: 100px;'>");
					$("#pic"+count.toString()).val(data.message);
				},
				error : function(data, status, e) {
					alert(e);
				}
			}
		)
		count++;
		}else{
			alert("最多只能上传三张图片！");
		}
		return false;
	});
});