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
		<link href="style/search.css" rel="stylesheet" type="text/css" />
		<link href="style/detailed.css" rel="stylesheet" type="text/css" />
		<link href="style/dp.css" rel="stylesheet" type="text/css" />
		<link href="style/scheduled.css" rel="stylesheet" type="text/css" />
<link href="style/sppd.css" rel="stylesheet" type="text/css" />
	</head>
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/openwindow.js"></script>
	<script type="text/javascript">
window.onload=function fangDa(){
	magnifier.init({
		cont : document.getElementById('magnifier'),
		img : document.getElementById('magnifierImg'),
		mag : document.getElementById('mag'),
		scale : 3
	});
}
function addProduct(id){
	var amount=$("#amount").val();
	var size=$("#selectSize").val();
	var gg=$("#selectGg").val();
	var total=$("#totalAmount").val();
	var reg=/^([1-9][0-9]*)$/;
	/*
	if(size==""){
		alert("请选择规格！");
		return;
	}
	
	if(gg==""){
		alert("请选择周期！");
		return;
	}
	*/
	
	if(!reg.test(amount)){
		alert("数量不正确！");
		return;
	}
	if(parseInt(amount)>parseInt(total)){
		alert("购买数量不能大于库存！");
		return;
	}
	window.location.href="addProductCar.action?id="+id+"&amount="+amount+"&size="+size+"&gg="+gg;
}

function page(currentPage){
		$("#page").val(currentPage);
		document.pageForm.submit();
	}
	$(function(){
		var score=$("#totalScore").val();
		var values="";
		for(var i=0;i<score;i++){
		  values+="<img src='images/star1.gif'/>";
		}
		$("#star").html(values);
	});
	
	function online(id){
		var url="online.action?userId="+id;
		openWindow(url,600,600);
	}
	
	$(function(){
	var size=$("#size").val();
	var array=size.split(",");
	var values="";
	for(var i=0;i<array.length;i++){
		values+="<span id=\"select"+i+"\" onclick=\"selectSize("+i+")\" style=\"cursor: pointer;\">"+array[i]+"</span>&nbsp;&nbsp;";
	}
	$("#sizeSelect").html(values);
	});
	var old;
	function selectSize(id){
		if(old!=id){
		$("#select"+id).attr("style","cursor: pointer;background: green;");
		$("#select"+old).attr("style","cursor: pointer;");
		var size=$("#select"+id).html();
		$("#selectSize").val(size);
		}
		old=id;
	}
var oldId;	
function getGg(id,price){
	if(oldId!=id){
		$("#gg"+id).attr("style","cursor: pointer;background: green;");
		$("#gg"+oldId).attr("style","cursor: pointer;");
		$("#selectGg").val(id);
		}
		$("#nowPrice").html(price);
		oldId=id;
}	
</script>
	<body>
		<!--网站顶部-->
		<input type="hidden" value="${product.stock}" id="totalAmount">
		<input type="hidden" id="totalScore" value="${score}">
		<div class="webtop">
			<jsp:include page="../../top.jsp"></jsp:include>
		</div>

		<!--搜索和导航-->
		<div class="sounav">
			<jsp:include page="../../search.jsp"></jsp:include>
		</div>


		<div class="xdhlr">
			首页 &gt;商品商城 &gt;商品详细
		</div>
		<div style="width: 960px; height: auto; margin: 0 auto 10px auto;">
			<div class="base">
				<div class="dpxx">
					<div class="float_left webleft">
						<jsp:include page="../../news.jsp"></jsp:include>
					</div>

				</div>
				<!--商品名称-->
				<div class="float_left" style="width: 738px; height: auto;">
					<div class="spbtmc">
						${product.title}
					</div>
					<div class="spgm">
						<div class="spgm_left">
							<%@include file="img.jsp"%>
							 <div style="margin-left: 10px; margin-top:10px; ">
							   <c:if test="${!empty sessionScope.loginUser}">
							     <a href="saveCollect.action?id=${product.id}" >收藏宝贝</a>
							   </c:if>
							 </div>
						</div>
						<div class="spgm_right">
							<div class="spxxfl">
								商品编号：${product.id}
							</div>
							<div class="spxxfl">
								原价：
								<del>
									￥${product.oldPrice}
								</del>
							</div>
							<div class="spxxfl">
								折后价：
								<span class="hou16">￥<span id="nowPrice">${product.newPrice}</span></span>
							</div>
							<div class="spxxfl">
								促销信息：
								<%-- <span class="hou12">已优惠￥${product.oldPrice-product.newPrice}</span> --%>
								<span class="hou12">已优惠￥<fmt:formatNumber type="number" value="${product.oldPrice-product.newPrice} " maxFractionDigits="2"/></span>
							</div>
							<div class="spxxfl">
								<div class="float_left">
									商品评分：
								</div>
								<div class="float_left" id="star"
									style="padding: 0px 3px 0 3px;">

								</div>
								<div class="float_left">
									<a href="#" class="lan">(已有${totalCount}人评价)</a>
								</div>
							</div>
							<!-- 
							<div class="spxxfl">
								最低团购数量：
								<span class="hou16"><span id="groupNum">${product.groupNum}</span></span>
							</div>
							<div class="spxxfl">
								目前已拼团购数量：
								<span class="hou16"><span id="doneGroupNum">${donedGroupNum}</span></span>
							</div>
							 -->
							 <div class="spxxfl">
								可使用优惠券：是
							</div>
							<div class="spxxfl">
								优惠活动时间：持续
							</div>
							<input type="hidden" id="size" value="${product.size}" />
							<input type="hidden" id="selectSize" />
							<input type="hidden" id="selectGg" />
				
							<div class="spxxfl">
								购买数量：
								<input type="text" id="amount" value="1" size="2"
									class="z999 bk" />
								（库存${product.stock}件）
							</div>
							<div class="spxxfl">
								<a href="#" class="lan" onclick="alert('入驻商家联系email : ${product.businessMail}');">查看商家</a>
							
							</div>
							<div class="spdg">
								<div class="float_left" style="padding: 5px;">
									<a href="javascript:addProduct('${product.id}')"><img
											src="images/ljgm2.jpg">
									</a>
								</div>
										
			
					
							</div>
						</div>
					</div>

					<div class="spjs">
						<div class="navbg">
							<a href="#">商品介绍 </a>
						</div>
					</div>
					<div class="spjslr">
						${product.content}
					</div>
					<div class="float_left"
						style="height: auto; width: 738px; padding: 15px 0 0 0;">
						<div class="spjs">
							<div class="navbg">
								<a href="#">评价详情</a>
							</div>
							<div class="pjsm">
								(${totalCount})
							</div>
						</div>
						<c:forEach items="${reviewsList}" var="reviews">
							<div class="pj">
								<div class="pj_lr">
									<div class="pj_lr_left">
										${reviews.content}
										<br />
										<span class="z666"><fmt:formatDate
												value="${reviews.createTime}" type="both"></fmt:formatDate>
										</span>
									</div>
									<div class="pj_lr_right">
										${reviews.userName}
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="sxfy">
							<form action="productLook.action" name="pageForm" method="post">
								<input type="hidden" name="id" value="${id}">
								<input type="hidden" name="menu" value="${menu}">
								<input id="page" type="hidden" name="currentPage">
								<%@include file="frontPage.jsp"%>
							</form>
						</div>
					</div>
				</div>
			</div>
				<div class="ff_1">
					<div class="wzbt">
						猜你喜欢
					</div>
				</div>
				<c:forEach items="${productList}" var="product">
					<div class="shangpin_2">
						<a href="productLook.action?id=${product.id}"><img
								src="${product.image}" width='160px'
								height='160px' />
						</a>
						<br />
						<a href="productLook.action?id=${product.id}">${product.title}</a>
						<br />
						<del>
							原价￥${product.oldPrice}
						</del>
						<br />
						<span>折后价￥${product.newPrice}</span>
					</div>
					</c:forEach>
			</div>
		&nbsp;&nbsp;
		<!-- top5-->
		<div style="width: 960px; height: auto; margin: 10px auto 0 auto;">
			<jsp:include page="../../foot.jsp"></jsp:include>
		</div>
	</body>
</html>
