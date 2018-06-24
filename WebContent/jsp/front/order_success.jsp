<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <div class="land" style="height:80px;">
  	<div class="float_left">填写订单信息</div>
    <div class="gwc_1">
        
    </div>
  </div>
  <div class="gwc_2">
  
    <div class="gwc_4">
    	<div class="gwc_4_1"><img src="images/vv.gif" width="35" height="30">&nbsp;&nbsp;订单已提交！</div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">你的订单号：</div><div class=" float_left zbold zffoo" style=" font-size:14px;">${orderPost}</div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">应付金额：</div><div class=" float_left zbold zffoo" style=" font-size:14px;">${totalPrice}金币</div></div>
    	<div class="gwc_4_2"><div class="gwc_4_2_1">支付方式：</div><div class=" float_left">在线支付</div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">配送方式：</div><div class=" float_left">圆通快递</div></div>
    </div>
     <div class="gwc_4">
      <div class="bank2">
				<div class="bank2_1">支持以下支付：</div>
                <div class="bank2_2"><a href="ordeZhif.action?totalPrice=${totalPrice}&orderPost=${orderPost}"><img src="images/bank1.jpg"></a></div>
                <div class="bank2_2"><a href="ordeZhif.action?totalPrice=${totalPrice}&orderPost=${orderPost}"><img src="images/bank2.jpg"></a></div>
                <div class="bank2_2"><a href="ordeZhif.action?totalPrice=${totalPrice}&orderPost=${orderPost}"><img src="images/bank3.jpg"></a></div>
                <div class="bank2_2"><a href="ordeZhif.action?totalPrice=${totalPrice}&orderPost=${orderPost}"><img src="images/bank4.jpg"></a></div>
       	</div>
        
        <div class="bank3">
        	<span class="zbold">如何进行大额支付：</span><br>
			1、如您订单金额较大，可以使用快钱支付中的招行、工行、建行、农行、广发进行一次性大额支付（一万元以下）；<br>
			2、如果您没有网银，可以使用银联在线支付，银联有支持无需开通网银的快捷支付和储值卡支付； <br>
			3、如果您有财付通或快钱、手机支付账户，可将款项先充入相应账户内，然后使用账户余额进行一次性大额支付；<br>
			4、直接进入“我的京东”-“在线支付”页面进行分次支付，支付时请输入相应订单号及支付金额。<br>
        </div>
  </div>
</div>
</div>

<div style="width:960px; height:auto; margin:10px auto 0 auto;">
<jsp:include page="../../foot.jsp"></jsp:include>
</div>

</body>
</html>

