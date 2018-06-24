<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>操作信息</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/table.js"></script>
		<script type="text/javascript" src="js/openwindow.js"></script>
		<script type="text/javascript">
function page(currentPage){
	$("#pageId").val(currentPage);
	document.pageForm.submit();
}
function clearInfo(){
	$("#name").val("");
	document.searchForm.submit();
}	

function checkAll(){
	var all=$("#all");
	var checks=$("input[name='ids']");
	if(all.attr("checked")){
		checks.attr("checked","checked");
	}else{
		checks.attr("checked","");
	}
}



function messageLook(id){
	var url="getMessageObj.action?id="+id;
	openWindow(url,600,400);
}
</script>
	</head>

	<body>
		<form action="getMessageManage.action" method="post" name="searchForm">
			<div id="search" class="search" style="height: 30px;">
			 <!-- 
				留言人：
				<input type="text" id="name" name="name" value="${name}" />
				&nbsp;
				 -->
				<input type="submit" value="刷新" class="button_04" />
				<!-- 
				&nbsp;
				<input type="button" onclick="clearInfo();" value="清除"
					class="button_02" />
					 -->
			</div>
		</form>
		<table id="table" align="center" border="0" cellpadding="0"
			cellspacing="0" width="100%">
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
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：操作信息
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
										<!-- 
											<input type="button" onclick="deleteMessage()" value="删除"
												class="button_02" />
												 -->
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
								<table class="table_list" cellspacing="1" cellpadding="0"
									width="100%" border="0">
									<tr id="rows_title">
										<td width="3%">
											<input type="checkbox" onclick="checkAll()" name="all"
												id="all">
										</td>
									    <!-- 
										<td width="10%">
											状态
										</td>
										 -->
										<td>
											内容
										</td>
										
										<td width="15%">
											时间
										</td>
									</tr>

									<c:if test="${empty messageList}">
										<tr id="rows">
											<td colspan="4">
												没有相关记录！
											</td>
										</tr>
									</c:if>
									<c:forEach items="${messageList}" var="message">
										<tr id="rows" onmouseover="overStyle(this)"
											onmouseout="outStyle(this)">
											<td align="center">
												<input type="checkbox" name="ids" value="${message.id}">
											</td>
											<!-- 
											<td  align="center">
												<em class="m${message.isRead}"></em>
											</td>
											-->
											<td>
											    ${message.content}
											    <!-- 
												<a href="javascript:messageLook('${message.id}')">${message.content}</a>
												 -->
											</td>
											<td>
												<fmt:formatDate value="${message.createTime}" type="both"/>
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
							<td class="table_box_7">
								<form action="getMessageManage.action" method="post" name="pageForm">
									<input type="hidden" name="name" value="${name}">
									<input type="hidden" id="pageId" name="currentPage">
									<%@include file="../../jsp/page.jsp"%>
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