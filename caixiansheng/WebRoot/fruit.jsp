<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cxs.entity.Product"%>
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

<title>fruit</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.productcontain {
	width: 200px;
	height: 200px;
}

.img-responsive {
	width: 100%;
	height: 100%;
	display: block;
	margin: 0 auto;
}

.productcontain {
	display: block;
	margin: auto;
}

td {
	border: 1px solid #ddd;
}

.plink {
	text-decoration: none;
}

.productinfo {
	text-align: center;
}
</style>
</head>
<!-- 
  		List list = (List)session.getAttribute("list");
    	for(int i=0;i<list.size();i++){
    		Product pct = (Product)list.get(i);
   -->
<body>
	<a href="index.jsp">返回主页</a>
	<table class="col-xs-12 col-md-6 column" border="0"
		style="width: 60%;margin: 0 auto;">
		<%
			List list = (List) session.getAttribute("list");
			for (int i = 0; i < list.size(); i++) {
				Product pct = (Product) list.get(i);
				if (i % 3 == 0) {
		%>
		<tr id="tr1">
			<%
				}
			%>
			<td>
				<div class="productinfo" border="0">
					<div class="productcontain">
						<a href="detail.jsp?proid=<%=pct.getPid()%>"> <img
							class="img-responsive" alt="Responsive image"
							src="images/<%=pct.getPicture()%>">
						</a> 单价
						<%=pct.getPrice()%>元/斤 <br> 库存：<%=pct.getPcount()%>件
					</div>
					<br>
					<br> <a class="plink"
						href="detail.jsp?proid=<%=pct.getPid()%>"> <%=pct.getPname()%></a><br>
				</div>
			</td>
			<%
				if (i % 3 == 3) {
			%>
		</tr>
		<%
			}
		%>
		<%
			}
		%>
	</table>
</body>
</html>
