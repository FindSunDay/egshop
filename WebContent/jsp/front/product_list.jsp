<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购网站</title>
</head>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<link href="style/search.css" rel="stylesheet" type="text/css" />
<body>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	function page(currentPage){
		$("#page").val(currentPage);
		document.pageForm.submit();
	}
	
	function checkvalue(){
		var minPrice=$("#minPrice").val();
		var maxPrice=$("#maxPrice").val();
		var reg=/^[1-9]d*.d*|0.d*[1-9]d*$/;
		if(minPrice!=''){
		if(!reg.test(minPrice)){
			alert("价格不规范！");
			return false;
		}
		}
		if(maxPrice!=''){
		if(!reg.test(maxPrice)){
			alert("价格不规范！");
			return false;
		}
		}
		$("#oldminPrice").val(minPrice);
		$("#oldmaxPrice").val(maxPrice);
		page('${currentPage}');
		}
</script>

<!--网站顶部-->
<div class="webtop">
	<jsp:include page="../../top.jsp"></jsp:include>
</div>

<!--搜索和导航-->
<div class="sounav">
	<jsp:include page="../../search.jsp"></jsp:include>
</div>
<div class="xdhlr">首页 > 购物商城</div>
<div style="width:960px; height:auto; margin:0 auto 10px auto;  ">
<div class="base">
<div class="float_left webleft">
<div class="qbspfl_1">
	<jsp:include page="../../news.jsp"></jsp:include>
</div>
</div>
<div class="syfl">
	<div class="sywz"><a href="#">所有分类</a></div>
    <div class="xfsp">相关商品 <span>${totalCount} </span>件</div>
</div>

<div class="splb">
    <div class="spps">
    	商品价格：<input type="text" style="width: 60px" id="minPrice" name="minPrice" value="${minPrice}">至<input type="text" id="maxPrice"  style="width: 60px"  name="maxPrice" value="${maxPrice}">&nbsp;&nbsp;<input type="button" onclick="checkvalue()" value="确定">
     </div>
     <div class="sppsbg"></div>
  	<c:forEach items="${productList}" var="product">
    <div class="shangpin_2"> 
    	<a href="productLook.action?id=${product.id}"><img src="${product.image}" width="160px" height="160px"/></a><br/>
       <a href="productLook.action?id=${product.id}">${product.title}</a><br />
       <del>原价￥${product.oldPrice}</del> <br/>
    	<span>折后价￥${product.newPrice}</span> 
    </div>
    </c:forEach>
    <div class="sxfy" >
    	<form action="productListByFront.action" name="pageForm" method="post">
    	<input type="hidden" name="menu" value="${menu}">
    	<input type="hidden" name="title" value="${title}">
    	<input type="hidden" id="oldminPrice" name="minPrice" value="${minPrice}">
    	<input type="hidden" id="oldmaxPrice" name="maxPrice" value="${maxPrice}">
    	<input type="hidden" name="typeName" value="${typeName}">
    	<input id="page" type="hidden" name="currentPage">
         <%@include file="frontPage.jsp" %> 
         </form>
    </div>
  </div>
</div>
</div>

<!-- top5-->
<div style="width:960px; height:auto; margin:10px auto 0 auto;">
<jsp:include page="../../foot.jsp"></jsp:include>
</div>
</body>
</html>
