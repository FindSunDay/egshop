<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
$(function(){
	if('${receiver}'==''||'${receiver}'=='null'){
		 $("#receiverUpdate").attr("style","background:#EFF5F8;display:block");
	}else{
			$("#receiverLook").attr("style","background:#EFF5F8;display:block");
	}
	
});
function  lookOrUpdate(val){
	if(val=='look'){
		$("#receiverUpdate").attr("style","background:#EFF5F8;display:none");
	 	$("#receiverLook").attr("style","background:#EFF5F8;display:block");
	 	
	}else{
		$("#receiverLook").attr("style","background:#EFF5F8;display:none");
		$("#receiverUpdate").attr("style","background:#EFF5F8;display:block");
	}
}

	function saveReceiver(){
		var name=$("#name").val();
		var address=$("#address").val();
		var phone=$("#phone").val();
		var post=$("#post").val();
		if($.trim(name)==''||$.trim(name)=='null'){
			alert("请输入收货人姓名！");
			return;
		}
		if($.trim(address)==''||$.trim(address)=='null'){
			alert("请输入收货人地址！");
			return;
		}
		if($.trim(phone)==''||$.trim(phone)=='null'){
			alert("请输入收货人电话！");
			return;
		}
		if($.trim(post)==''||$.trim(post)=='null'){
			alert("请输入邮编！");
			return;
		}
		document.reForm.submit();
	}
	
	function saveOrder(id){
		if(id==''){
			alert("请填写收货人信息！");
			return;
		}
		if('${sessionScope.car.items}'==null){
			alert("商品信息为空！");
			return;
		}
		window.location.href="saveOrder.action?receiverId="+id;
	}
</script>
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
    <div class="gwc_4" id="receiverLook" style="display: none;">
    	<div class="gwc_4_1">收货人信息&nbsp;&nbsp;<a href="javascript:lookOrUpdate('update')" class="link1">[修改]</a></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">收货人姓名：</div><div class=" float_left">${receiver.name}</div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">地　　址：</div><div class=" float_left">${receiver.address}</div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">手机号码：</div><div class=" float_left">${receiver.phone}</div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">邮　　编：</div><div class=" float_left">${receiver.post}</div></div>
    </div>
    <form action="saveReceiver.action" name="reForm" method="post">
	<input  name="receiver.id" type="hidden"  value="${receiver.id}">
    <div class="gwc_4" id="receiverUpdate" style="background:#EFF5F8;display: none;">
    	<div class="gwc_4_1">收货人信息&nbsp;&nbsp;<a href="javascript:lookOrUpdate('look')" class="link1">[关闭]</a></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">收货人姓名：</div><div class=" float_left"><input id="name" name="receiver.name" type="text"  value="${receiver.name}" size="20" class="z666"/>
        </div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">地　　址：</div><div class=" float_left"><input id="address" name="receiver.address" type="text"   value="${receiver.address }" size="60" class="z666"/>
        </div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">手机号码：</div><div class=" float_left"><input id="phone" name="receiver.phone" type="text" class="z666"   value="${receiver.phone}" size="10"/>
       </div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">邮　　编：</div><div class=" float_left"><input id="post" name="receiver.post" type="text" class="z666" value="${receiver.post}" size="10"/></div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">&nbsp;&nbsp;</div><div class=" float_left"><input type="button" onclick="saveReceiver();" value="保存收货人信息" /></div></div>
    </div>
	</form>

    <div class="gwc_4">
    	<div class="gwc_4_1">商品清单&nbsp;&nbsp;<a href="shopCar.action" class="link1">[返回修改购物车]</a></div>
        <table width="910" border="0" cellpadding="0" cellspacing="1" bgcolor="#E3E3E3">
      <tr>
        <td width="100" height="25" align="center" bgcolor="#FFFFFF">商品编号</td>
        <td width="508" align="center" bgcolor="#FFFFFF">商品名称</td>
        <td width="100" align="center" bgcolor="#FFFFFF">价格 </td>
        <td width="95" align="center" bgcolor="#FFFFFF">商品数量</td>
        <td width="95" align="center" bgcolor="#FFFFFF">使用周期</td>
      </tr>
      <c:forEach items="${sessionScope.car.items}" var="car">
      <tr>
        <td height="55" align="center" bgcolor="#FFFFFF">${car.id}</td>
        <td align="center" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="16%" align="center">
            <img src="${car.image}" width="50" height="50" />
            </td>
            <td width="84%" align="left"><a href="#" class="link1">${car.title }</a> <br />
          </tr>
        </table></td>
        <td align="center" bgcolor="#FFFFFF"><span class="zffoo">￥${car.gg.price }</span></td>
		
        
       
        <td align="center" bgcolor="#FFFFFF"> ${car.amount } </td>
        <td align="center" bgcolor="#FFFFFF"> ${car.gg.name } </td>
      </tr>
      </c:forEach>
    </table>
    </div>
    
    
    <div class="gwc_4">
    	<div class="gwc_4_1">结算信息</div>
		<%-- <div class="gwc_4_2"><div class="gwc_4_2_1">商品金额：</div><div class=" float_left zff33">￥${sessionScope.car.totalPrice}金币</div></div> --%>
		<div class="gwc_4_2"><div class="gwc_4_2_1">商品金额：</div><div class=" float_left zff33">￥<fmt:formatNumber type="number" value="${sessionScope.car.totalPrice}" maxFractionDigits="2"/>金币</div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">邮        费：</div><div class=" float_left">${sessionScope.car.shippingJe}金币${sessionScope.car.freeShipping} </div></div>
        <div class="gwc_4_2"><div class="gwc_4_2_1">优惠券(98折)：</div><div class=" float_left">${sessionScope.car.usecoupon}${sessionScope.car.couponJe} </div></div>
        <%-- <div class="gwc_4_1">应付总额：<span class="zff33">￥${sessionScope.car.totalPrice+sessionScope.car.shippingJe-sessionScope.car.couponJe}</span> 金币</div> --%>
        <div class="gwc_4_1">应付总额：<span class="zff33">￥<fmt:formatNumber type="number" value="${sessionScope.car.totalPrice+sessionScope.car.shippingJe-sessionScope.car.couponJe}" maxFractionDigits="2"/></span> 金币</div>
        <div class="gwc_4_1"><a href="javascript:saveOrder('${receiver.id}')"><img src="images/tjbd.jpg"></a></div>
    </div>
    
  </div>
</div>
</div>

<div style="width:960px; height:auto; margin:10px auto 0 auto;">
<jsp:include page="../../foot.jsp"></jsp:include>
</div>

</body>
</html>
