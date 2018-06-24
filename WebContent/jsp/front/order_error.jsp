<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购网站</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<link href="style/landed.css" rel="stylesheet" type="text/css" />
<link href="style/gwc.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--网站顶部-->
<div class="webtop">
	<jsp:include page="../../top.jsp"></jsp:include>
</div>

<!--搜索和导航-->
<div class="sounav">
	<jsp:include page="../../search.jsp"></jsp:include>
</div>

<!-- top5-->
<div class="log">
<div class="hkuang">
  <div class="gwc_2">
  
    <div class="gwc_4">
    	<div class=" float_left" style="margin-right:20px;"><img src="images/fkydwt.jpg"></div>
    </div>
    
    <div class="gwc_4">
    	<div class="gwc_4_1"><img src="images/xx.gif" width="35" height="30">&nbsp;&nbsp;<span style=" font-size:20px; font-family:'微软雅黑'">付款失败！</span></div>
    </div>
    <div class="cgfk">
    	<div class="cgfk_1">付款详情</div>
        <div class="cgfk_2">付款金额：<span class="zff33">${totalPrice}</span>金币</div>
        <div class="cgfk_2">状态：付款失败，金币不足</div>
    </div>
    <div class="gwc_4">
      <div class="bank2">
				<div class="bank2_1">支持以下支付：</div>
                <div class="bank2_2"><input type="button" onclick="window.location='userInfoInit.action?menu=4'" value="立即充值"></div>
       	</div>
        
</div>
    
  </div>
</div>
</div>

<div style="width:960px; height:auto; margin:10px auto 0 auto;">
	<jsp:include page="../../foot.jsp"></jsp:include>
</div>

</body>
</html>

