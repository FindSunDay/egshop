<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>订单管理</title>
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
				document.searchForm.submit();
			}	


			function updateOrder(id,strTemp,strUser,strTime){
					var array={"receiverId":id,"orderPost":"fh"};
					$.post("updateOrder.action",array,function(data){
						if(data=="success"){
							alert("操作成功！\n订单状态    订单编号     发货人   发货时间  \n已发货 "+strTemp +strUser +strTime);
							var currentPage=$("#currentPage").val();
							page(currentPage);
						}else{
							alert("操作失败！");
						}
					});
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
		function deleteOrderAll(){
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
					$.post("deleteOrder.action",arry,function(data){
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
			
function orderSh(id){
	var url="orderSh.action?receiverId="+id;
	openWindow(url,400,300);
}	
		</script>
	</head>

	<body>
		<form action="getOrderManage.action" method="post" name="searchForm">
			<div id="search" class="search" style="height: 30px;">
				商品名称：
				<input type="text" id="title" name="title" value="${title}"/>
				&nbsp;
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
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：订单管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
										</td>
									</tr>
								</table>
							</td>
							<td width="16" class="table_box_3">
								<input type="button" value="删除订单" onclick="deleteOrderAll()">
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
										<td width="3%">
											<input type="checkbox" id="all" name="all"
												onclick="checkAll()" />
										</td>
										<td width="10%">
											订单编号
										</td>
										<td >
											商品名称
										</td>
										<td width="10%">
											 价格
										</td>
										<td width="5%">
											 数量
										</td>
										<td width="5%">
											 规格
										</td>
										<td width="5%">
											 押金
										</td>
										<td width="15%">
											 快递信息
										</td>
										<td width="5%">
											使用时间
										</td>
										<td width="10%">
											订单状态
										</td>
										<td width="12%">
											订单时间
										</td>
										<td width="6%">
											操作
										</td>
									</tr>
									<c:if test="${empty orderList}">
										<tr id="rows">
											<td colspan="12">
												没有相关记录！
											</td>
										</tr>
									</c:if>
									<c:forEach items="${orderList}" var="order">
										<tr id="rows" onmouseover="overStyle(this)"
											onmouseout="outStyle(this)">
											<td align="center">
												<input type="checkbox" name="ids" value="${order.id}" >
											</td>
											<td>
												${order.orderPost}
											</td>
											<td>
												${order.product.title}
											</td>
											<td>
												${order.price}
											</td>
											<td>
												${order.amount}
											</td>
											<td>
												${order.size}
											</td>
											<td>
												${order.yj}
											</td>
											<td>
												${order.expNo}/${order.expNm}
											</td>
											<td>
												${order.gg}
											</td>
											<td>
												${order.status}
											</td>
											<td>
											<fmt:formatDate value="${order.createTime}" type="both"/>	
											</td>
											<td align="center">
												<c:if test="${order.status=='未付款'}">
													<input type="button" onclick="deleteOrder('${order.id}')" value="删除">
												</c:if>
										     	<c:if test="${order.status=='已付款未发货'}">
												<input type="button" onclick="updateOrder('${order.id}','${order.orderPost}','${sessionScope.loginUser.name}','${order.createTime}' )" value="发货">
												</c:if>
												<c:if test="${order.status=='已寄回'}">
												<input type="button" onclick="orderSh('${order.id}')" value="确认收货">
												</c:if>
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
								<form action="getOrderManage.action" method="post" name="pageForm">
									<input type="hidden" name="title" value="${title}">
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


