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
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <script type="text/javascript" src="js/thickbox_plus.js"></script>
<script type="text/javascript">
function modify(id,val){
		var amount=$("#car"+id).val();
		var total=$("#total"+id).val();
		var reg=/^([1-9][0-9]*)$/;
	   if(!reg.test(amount)){
		alert("数量不正确！");
		return;
	  }
		if(val=='+'){
			var m=parseInt(amount)+1;
		if(parseInt(m)>parseInt(total)){
			alert("购买数量不能大于库存！");
			return;
		}
			window.location.href="modifyProduct.action?id="+id+"&amount="+m;
		}else if(val=='-'){
			if(parseInt(amount)>1){
			  var m=parseInt(amount)-1;
			}else{
				alert("购买数量至少一件！");
				return;
			}
			window.location.href="modifyProduct.action?id="+id+"&amount="+m;
		}else{
		if(parseInt(m)>parseInt(total)){
			alert("购买数量不能大于库存！");
			return;
		}
			window.location.href="modifyProduct.action?id="+id+"&amount="+amount;
		}
	}
	
function ddzt_check(){
       if('${sessionScope.car.countTotal}'==0){
           alert("购物车中没有商品，请继续购物");
       }else{
           window.location.href="carOrder.action";
       }
}
function deleteProduct(id){
	if(confirm("确定删除商品？")){
		window.location.href="removeProduct.action?id="+id;
	}
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
  	<div class="float_left">购物流程</div>
    <div class="gwc_1">
        
    </div>
  </div>
  <div class="gwc_2">
    <table width="910" border="0" cellpadding="0" cellspacing="1" bgcolor="#E3E3E3">
      <tr>
        <td width="100" height="25" align="center" bgcolor="#FFFFFF">商品编号</td>
        <td width="508" align="center" bgcolor="#FFFFFF">商品名称</td>
        <td width="100" align="center" bgcolor="#FFFFFF">价格 </td>
        <td width="95" align="center" bgcolor="#FFFFFF">商品数量</td>
        <td width="65" align="center" bgcolor="#FFFFFF">商品规格</td>
         <td width="65" align="center" bgcolor="#FFFFFF">使用时间</td>
        <td width="100" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
      <c:forEach items="${sessionScope.car.items}" var="car">
      <tr>
        <td height="55" align="center" bgcolor="#FFFFFF">${car.id}</td>
        <td align="center" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="16%" align="center">
            <img src="${car.image}" width="50" height="50" />
            </td>
            <td width="84%" align="left"><a href="#" class="link1">${car.title }(${car.size})</a> <br />
          </tr>
        </table></td>
        <td align="center" bgcolor="#FFFFFF"><span class="zffoo">￥${car.gg.price }</span></td>
       
        <td align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><img src="images/jan.jpg" onclick="modify('${car.id}','-')"></td>
            <td align="center"><input type="text" value="${car.amount }" id="car${car.id}"  onKeyDown="if(event.keyCode == 13) modify('${car.id}','all')"   size="3" onblur="modify('${car.id}','all')"/>
            		<input type="hidden" id="total${car.id}" value="${car.stock}">
            </td>
            <td align="center"><img src="images/jia.jpg" onclick="modify('${car.id}','+')"></td>
          </tr>
        </table></td>
        <td align="center" bgcolor="#FFFFFF">${car.size}</td>
          <td align="center" bgcolor="#FFFFFF">${car.gg.name}</td>
        <td align="center" bgcolor="#FFFFFF"><a href="javascript:deleteProduct('${car.id}')" class="link1">删除</a></td>
      </tr>
      </c:forEach>
      <tr>
        <td height="35" colspan="7" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
          
            <%-- <td align="right" style="font-size:14px; font-weight:bold;">商品总金额：<span class="zffoo"  id="gwcPrice">￥${sessionScope.car.totalPrice}</span>金币,送积分${sessionScope.car.totalPrice} ${sessionScope.car.freeShipping}</td> --%>
            <td align="right" style="font-size:14px; font-weight:bold;">商品总金额：<span class="zffoo"  id="gwcPrice">￥<fmt:formatNumber type="number" value="${sessionScope.car.totalPrice}" maxFractionDigits="2"/></span>金币,送积分<fmt:formatNumber type="number" value="${sessionScope.car.totalPrice}" maxFractionDigits="2"/> ${sessionScope.car.freeShipping}</td>
          </tr>
        </table></td>
        </tr>
    </table>
    
    <div class="gwc_3">
        <c:if test="${sessionScope.loginUser==null}">
    	<div class="gwc_3_1"><a href="ShowLogin.html?height=160;width=400" class="thickbox"><img src="images/qjs.jpg"></a></div>
    	</c:if>
    	<c:if test="${sessionScope.loginUser!=null}">
    	<div class="gwc_3_1"><a href="#" onclick="ddzt_check()"><img src="images/qjs.jpg"></a></div>
    	</c:if>
        <div class="gwc_3_1"><a href="productListByFront.action?menu=1"><img src="images/jxgw.jpg"></a></div>
    </div>
  </div>
</div>
</div>

<div style="width:960px; height:auto; margin:10px auto 0 auto;">
	<jsp:include page="../../foot.jsp"></jsp:include>
</div>

</body>
</html>
