<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>团购商品管理</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/openwindow.js"></script>
		<script type="text/javascript" src="js/table.js"></script>
		<script type="text/javascript">
			function page(currentPage){
				$("#pageId").val(currentPage);
				document.pageForm.submit();
			}
			
			function clearInfo(){
				$("#title").val("");
				$("#typeName").val("");
				$("#minPrice").val("");
				$("#maxPrice").val("");
				document.searchForm.submit();
			}	

			function initadd(){
				var url="initProduct.action";
				openWindow(url,600,600);
			}
			
			function ggList(id){
				var url="getGgsList.action?id="+id;
				openWindow(url,700,400);
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
			}

			function deleteProduct(){
				var arry="";
				var count=0;
				var checks=$("input[name='ids']");
				for(var i=0;i<checks.length;i++){
					if(checks[i].checked){
						if(arry==''){
						arry+="ids="+checks[i].value;
						}else{
						arry+="&ids="+checks[i].value;
						}
						count++;
					}
				}
				if(count==0){
					alert("请选择要删除的数据！");
					return;
				}
				if(confirm("确定要删除？")){
					$.post("deleteProduct.action",arry,function(data){
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
			
			function productHot(id){
				var arry="isHot="+id;
				var count=0;
				var checks=$("input[name='ids']");
				for(var i=0;i<checks.length;i++){
					if(checks[i].checked){
						arry+="&ids="+checks[i].value;
						count++;
					}
				}
				if(count==0){
					alert("请选择要操作的数据！");
					return;
				}
					$.post("hotProduct.action",arry,function(data){
						if(data=="success"){
							alert("操作成功！");
							var currentPage=$("#currentPage").val();
							page(currentPage);
						}else{
							alert("操作失败！");
						}
					});
			}

			
			function updateProduct(id){
				var currentPage=$("#currentPage").val();
			 	var url="getProductObj.action?id="+id+"&currentPage="+currentPage;
			 	openWindow(url,600,600);
			}
			
			
		</script>
	</head>

	<body>
		<form action="getProductManage.action" method="post" name="searchForm" onsubmit="return checkvalue()">
			<div id="search" class="search" style="height: 30px;">
				商品名称：
				<input type="text" id="title" name="title" value="${title}"/>
				&nbsp;
				商品分类：
				<input type="text" id="typeName" name="typeName" value="${typeName}"/>
				&nbsp;
				商品价格：
				<input type="text" style="width: 60px;" id="minPrice" name="minPrice" value="${minPrice}"/>至
				<input type="text" id="maxPrice" style="width: 60px;"  name="maxPrice" value="${maxPrice}"/>
				<input type="submit" value="立即查找" class="button_04" />
				&nbsp;
				<input type="button" onclick="clearInfo();" value="清除"
					class="button_02" />
			</div>
		</form>
		<table id="table" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30" class="table_box_1">
							</td>
							<td class="table_box_2">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="46%" valign="middle">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src="images/tb.gif" width="16" height="16" />
														</div>
													</td>
													<td width="95%" style="font-size: 12px;">
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：团购商品管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
											<input type="button" onclick="initadd()" value="添加"
												class="button_02" />
											<input type="button" onclick="deleteProduct()" value="删除"
												class="button_02" />
										<input type="button" onclick="productHot('1')" value="设置热卖"
										class="button_04" />
										<input type="button" onclick="productHot('0')" value="取消热卖"
										class="button_04" />
										</td>
									</tr>
								</table>
							</td>
							<td width="16" class="table_box_3">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="8" class="table_box_4">
								&nbsp;
							</td>
							<td>
								<table class="table_list" width="100%" cellpadding="0"
									cellspacing="1">
									<tr id="rows_title">
										<td width="5%">
											<input type="checkbox" id="all" name="all"
												onclick="checkAll()" />
										</td>
										<td >
											商品名称
										</td>
										<td width="15%">
											商品规格
										</td>
										<td width="7%">
											原价
										</td>
										<td width="7%">
											折后价
										</td>
										<td width="7%">
											最低团购数量
										</td>
										<td width="7%">
											商品库存
										</td>
										<td width="10%">
											所属分类
										</td>
										<td width="6%">
											是否热卖
										</td>
										<td width="13%">
											上架时间
										</td>
										<td width="16%">
											操作
										</td>
									</tr>
									<c:if test="${empty productList}">
										<tr id="rows">
											<td colspan="10">
												没有相关记录！
											</td>
										</tr>
									</c:if>
									<c:forEach items="${productList}" var="product">
										<tr id="rows" onmouseover="overStyle(this)"
											onmouseout="outStyle(this)">
											<td align="center">
												<input type="checkbox" name="ids" value="${product.id}"
													onclick="checkodd()">
											</td>
											<td>
												${product.title}
											</td>
											<td>
												${product.size}
											</td>
											<td>
												${product.oldPrice}
											</td>
											<td>
												${product.newPrice}
											</td>
											<td>
												${product.groupNum}
											</td>
											<td>
												${product.stock}
											</td>
											<td>
												${product.proType.name}
											</td>
											<td>
											<c:if test="${product.hot=='0'}">
												否
											</c:if>
											<c:if test="${product.hot=='1'}">
												是
											</c:if>
											</td>
											<td>
											<fmt:formatDate value="${product.createTime}" type="both"/>	
											</td>
											<td align="center">
											<input type="button" value="设置规格" onclick="ggList('${product.id}')">
											<input type="button" value="修改" onclick="updateProduct('${product.id}')">
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
							<td width="8" class="table_box_5">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="48">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="48" class="table_box_6">
							</td>
							<td class="table_box_7" valign="middle">
								<form action="getProductManage.action" method="post" name="pageForm">
									<input type="hidden" name="title" value="${title}">
									<input type="hidden" name="typeName" value="${typeName}">
									<input type="hidden" name="minPrice" value="${minPrice}">
									<input type="hidden" name="maxPrice" value="${maxPrice}">
									<input type="hidden" id="pageId" name="currentPage">
									<%@include file="../page.jsp"%>
								</form>
							</td>
							<td width="16" class="table_box_8">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>


