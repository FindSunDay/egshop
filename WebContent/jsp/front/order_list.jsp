<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购网站</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<link href="style/landed.css" rel="stylesheet" type="text/css" />
<link href="style/gwc.css" rel="stylesheet" type="text/css" />
<link href="style/search.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	function page(currentPage){
		$("#page").val(currentPage);
		document.pageForm.submit();
	}
	
	function deleteOrder(id){
			var param={"ids":id};
				if(confirm("确定要删除？")){
					$.post("deleteOrder.action",param,function(data){
						if(data=="success"){
							alert("删除数据成功！");
							var currentPage=$("#currentPage").val();
							page(currentPage);
						}else{
							alert("删除数据失败！");
						}
					});
				}
			}
		function updateOrder(id,st){
				var array={"receiverId":id,"orderPost":st};
				$.post("updateOrder.action",array,function(data){
					if(data=="success"){
						alert("操作成功！");
						var currentPage=$("#currentPage").val();
						page(currentPage);
					}else{
						alert("操作失败！");
					}
				});
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
  <div class="gwc_2">
    <div class="gwc_4">
        <table width="910" border="0" cellpadding="0" cellspacing="1" bgcolor="#E3E3E3">
      <tr>
        <td width="69" height="25" align="center" bgcolor="#FFFFFF">商品编号</td>
        <td width="442" align="center" bgcolor="#FFFFFF">商品名称</td>
        <td width="94" align="center" bgcolor="#FFFFFF">价格 </td>
        <td width="87" align="center" bgcolor="#FFFFFF">商品数量</td>
        <td width="67" align="center" bgcolor="#FFFFFF">商品规格</td>
        <td width="119" align="center" bgcolor="#FFFFFF">状态</td>
           <td width="107" align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
      <c:forEach items="${orderList}" var="order">
      <tr>
        <td height="55" align="center" bgcolor="#FFFFFF">${order.orderPost}</td>
        <td align="center" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="16%" align="center"><img src="${order.product.image}" width="50" height="50" /></td>
            <td width="84%" align="left"><a href="productLook.action?id=${order.product.id}" class="link1">${order.product.title}</a></td>
          </tr>
        </table></td>
        <td align="center" bgcolor="#FFFFFF"><span class="zffoo">￥${order.price}</span></td>
        <td align="center" bgcolor="#FFFFFF">${order.amount}</td>
         <td align="center" bgcolor="#FFFFFF">${order.size}</td>
        <td align="center" bgcolor="#FFFFFF">${order.status}</td>
         <td align="center" bgcolor="#FFFFFF">
         <c:if test="${order.status=='未付款'}">
         	 <input type="button" onclick="window.location='orderSuccess.action?totalPrice=${order.amount*order.price}&orderPost=${order.orderPost}'" value="付款">
         	  <input type="button" onclick="deleteOrder('${order.id}')" value="删除">
         </c:if>
         <c:if test="${order.status=='已付款未发货'}">
        
         </c:if>
          <c:if test="${order.status=='已发货'}">
         
         <input type="button" onclick="updateOrder('${order.id}','sh')" value="确认收货">
         </c:if>
         <c:if test="${order.status=='已收货'}">
          <input type="button" onclick="window.location='productReview.action?id=${order.product.id}'" value="评价">
          <input type="button" onclick="window.location='orderJhInit.action?id=${order.id}'" value="寄回">
          </c:if>
          <c:if test="${order.status=='交易完成'}">
          <input type="button" onclick="window.location='productReview.action?id=${order.product.id}'" value="评价">
          </c:if>
         </td>
      </tr>
      </c:forEach>
    </table>
     <div class="sxfy" >
    	<form action="myOrderList.action" name="pageForm" method="post">
    	<input type="hidden" name="menu" value="${menu}">
    	<input id="page" type="hidden" name="currentPage">
         <%@include file="frontPage.jsp" %> 
         </form>
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
