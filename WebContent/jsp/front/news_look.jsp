<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购网站</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<link href="style/search.css" rel="stylesheet" type="text/css" />
<link href="style/detailed.css" rel="stylesheet" type="text/css" />
<link href="style/dp.css" rel="stylesheet" type="text/css" />
<link href="style/scheduled.css" rel="stylesheet" type="text/css" />

</head>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

<body>
<!--网站顶部-->
<input type="hidden" id="totalScore" value="${score}">
<div class="webtop">
	<jsp:include page="../../top.jsp"></jsp:include>
</div>

<!--搜索和导航-->
<div class="sounav">
	<jsp:include page="../../search.jsp"></jsp:include>
</div>


<div class="xdhlr">首页 &gt;公告详细</div>
<div style="width:960px; height:auto; margin:0 auto 10px auto;  ">
<div class="base">
<div class="dpxx">
<div class="float_left webleft">
 <jsp:include page="../../news.jsp"></jsp:include>
</div>

</div>
<!--商品名称-->
<div class="float_left" style="width:738px; height:auto;">
<div class="spbtmc">${news.title}</div>
<div class="spgm">
	${news.content}
</div>
</div>
</div>
</div>
&nbsp;&nbsp;
<!-- top5-->
<div style="width:960px; height:auto; margin:10px auto 0 auto;">
	<jsp:include page="../../foot.jsp"></jsp:include>
</div>
</body>
</html>
