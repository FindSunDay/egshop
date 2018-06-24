<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>规格管理</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/table.js"></script>
		<script type="text/javascript" src="js/openwindow.js"></script>
		<script type="text/javascript">
 

function initadd(id){
	var url="initGg.action?id="+id;
	window.location.href=url;
}	
 
 function updateGg(id){
	var url="getGgObj.action?id="+id;
	window.location.href=url;
}	

function deleteGg(){
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
		$.post("deleteGg.action",arry,function(data){
			if(data=="success"){
				alert("删除数据成功！");
				window.location.reload();
			}else{
				alert("删除数据失败！");
			}
		});
	}
}

</script>
	</head>
	<body>
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
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：商品规格管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
											<input type="button" onclick="initadd('${id}')" value="添加"
												class="button_02" />
													<input type="button" onclick="deleteGg()" value="删除"
												class="button_02" />
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
										<td width="5%">
											<input type="checkbox" id="all" name="all"
												onclick="checkAll()" />
										</td>
										<td >
											规格名称
										</td>
										<td width="10%">
											价格
										</td>
										<td width="12%">操作</td>
									</tr>

									<c:if test="${empty ggList}">
										<tr id="rows">
											<td colspan="4">
												没有相关记录！
											</td>
										</tr>
									</c:if>
									<c:forEach items="${ggList}" var="gg">
										<tr id="rows" onmouseover="overStyle(this)"
											onmouseout="outStyle(this)">
											 <td align="center">
												<input type="checkbox" name="ids" value="${gg.id}"
													onclick="checkodd()">
											</td>
											<td>
												${gg.name}
											</td>
											<td>
												${gg.price}	
											</td>
											<td>
											<input type="button" value="修改" onclick="updateGg('${gg.id}')">
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
		</table>
	</body>
</html>