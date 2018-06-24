<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/openwindow.js"></script>
		<script type="text/javascript" src="js/table.js"></script>
		<script type="text/javascript">
function page(currentPage){
	$("#page").val(currentPage);
	document.pageForm.submit();
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

function deleteReviews(){
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
		$.post("deleteNews.action",arry,function(data){
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
</script>
	</head>
	<body>

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
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：评价反馈管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
												<input type="button" class="button_02" value="删除"
													onclick="deleteReviews()" />
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
														<input type="checkbox" id="all" onclick="checkAll()" />
													</td>
													<td>
														评价
													</td>
													<td width="15%">
														发布人
													</td>
													<td width="20%">
														发布时间
													</td>
													<td width="20%">
														等级
													</td>
							
												</tr>
												<c:if test="${empty reviewsList}">
													<tr id="rows">
														<td colspan="6">
															没有相关记录！
														</td>
													</tr>
												</c:if>
												<c:forEach items="${reviewsList}" var="reviews">
													<tr id="rows" onmouseover="overStyle(this)"
														onmouseout="outStyle(this)">
														<td align="center">
															<input type="checkbox" name="ids" value="${reviews.id}" />
														</td>
														<td>
															${reviews.content}
														</td>
														<td>
															${reviews.userName}
														</td>
														<td>
															${reviews.createTime}
														</td>
														<td>
															${reviews.level}
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
											<form action="getReviewsManage.action" name="pageForm"
												method="post">
												<input type="hidden" name="title" value="${title}">
												<input type="hidden" id="page" name="currentPage" />
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