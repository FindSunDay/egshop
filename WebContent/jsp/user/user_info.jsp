<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>人员管理</title>
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
				$("#account").val("");
				$("#name").val("");
				document.searchForm.submit();
			}	

			function initadd(){
				var url="initUser.action";
				openWindow(url,500,290);
			}

			function deleteUser(){
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
					$.post("deleteUser.action",arry,function(data){
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

			
			function updateUser(id){
				var currentPage=$("#currentPage").val();
			 	var url="getUserObj.action?id="+id+"&currentPage="+currentPage;
			 	openWindow(url,500,290);
			}
			
			function initPrice(){
				var url="user_money.action";
			 	openWindow(url,500,290);
			}
			
		</script>
	</head>

	<body>
		<form action="getUserManage.action" method="post" name="searchForm">
			<div id="search" class="search" style="height: 30px;">
				帐户：
				<input type="text" id="account" name="account" value="${account}"/>
				&nbsp; 姓名：
				<input type="text" id="name" name="name" value="${name}" />
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
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：人员管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">&nbsp; 
											<input type="button" onclick="initadd()" value="添加"
												class="button_02" />
											<input type="button" onclick="deleteUser()" value="删除"
												class="button_02" />
												<input type="button" onclick="initPrice()" value="设置初始金币"
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
										<td width="15%">
											账户
										</td>
										<td >
											姓名
										</td>
										<td >
											会员等级
										</td>
										<td >
											剩余优惠券数量
										</td>
										<td width="15%">
											邮箱
										</td>
										<td width="15%">
											创建时间
										</td>
										<td width="15%">
											操作
										</td>
									</tr>
									<c:if test="${empty userList}">
										<tr id="rows">
											<td colspan="6">
												没有相关记录！
											</td>
										</tr>
									</c:if>
									<c:forEach items="${userList}" var="user">
										<tr id="rows" onmouseover="overStyle(this)"
											onmouseout="outStyle(this)">
											<td align="center">
												<input type="checkbox" name="ids" value="${user.id}"
													onclick="checkodd()">
											</td>
											<td>
												${user.account}
											</td>
											<td>
												${user.name}
											</td>
											<td>
												${user.memberLevel}
											</td>
											<td>
												${user.coupon}
											</td>
											<td>
												${user.email}
											</td>
											<td>
											<fmt:formatDate value="${user.createTime}" type="both"/>	
											</td>
											<td align="center">
												<input type="button" value="修改" onclick="updateUser('${user.id}')">
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
								<form action="getUserManage.action" method="post" name="pageForm">
									<input type="hidden" name="account" value="${account}">
									<input type="hidden" name="name" value="${name}">
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


