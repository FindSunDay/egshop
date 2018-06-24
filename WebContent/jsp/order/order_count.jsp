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
		<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript">
			function page(currentPage){
				$("#pageId").val(currentPage);
				document.pageForm.submit();
			}
			
			function clearInfo(){
				$("#title").val("");
				$("#startDate").val("");
				$("#endDate").val("");
				document.searchForm.submit();
			}	
			
			
		</script>
	</head>

	<body>
		<form action="getOrderTotalMange.action" method="post" name="searchForm" >
			<div id="search" class="search" style="height: 30px;">
				商品名称：
				<input type="text" id="title" name="title" value="${title}"/>
				&nbsp;
				&nbsp;
				订单时间：
				<input type="text" readonly="readonly"
						onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\',{d:-0});}'})" id="startDate" style="width: 120px;" class="Wdate" name="startDate" value="${startDate}"/>至
				<input type="text" readonly="readonly"
						onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\',{d:0});}'})" class="Wdate" id="endDate" style="width: 120px;"  name="endDate" value="${endDate}"/>
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
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：统计管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
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
											商品销量
										</td>
										<td width="15%">
											商品收入
										</td>
										<td width="13%">
											订单时间
										</td>
									</tr>
									<c:if test="${empty productList}">
										<tr id="rows">
											<td colspan="6">
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
												${product.amount}
												</td>
												<td>
												${product.newPrice}金币
											</td>
											<td>
											<fmt:formatDate value="${product.createTime}" type="both"/>	
											</td>
										</tr>
									</c:forEach>
									<tr id="rows">
											<td colspan="6">
												总计：${totalPrice}金币
											</td>
										</tr>
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
								<form action="getOrderTotalMange.action" method="post" name="pageForm">
									<input type="hidden" name="title" value="${title}">
									<input type="hidden" name="startDate" value="${startDate}">
									<input type="hidden" name="endDate" value="${endDate}">
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


