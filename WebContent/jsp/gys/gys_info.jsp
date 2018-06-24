<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/default.css" />
 	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/openwindow.js"></script>
	<script type="text/javascript" src="js/table.js"></script>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
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

function addNews(){
	var url="gys_add.action";
	openWindow(url,600,500);
}	

function updateNews(id){
var currentPage=$("#currentPage").val();
	var url="getJGysObj.action?id="+id+"&currentPage="+currentPage;
	openWindow(url,600,500);
}	


function deleteNews(){
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
		$.post("deleteJGys.action",arry,function(data){
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
function clearInfo(){
	$("#createTime").val("");
	document.searchForm.submit();
}	
</script>
</head>
<body>
<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;客户反馈管理&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;客户反馈列表&nbsp;
	</div>
</div>
<div id="tips">
	<div id="buttonGroup">
		<form action="getPaperByStudent.action" name="search" method="post">
		<div class="search">
		  申请时间：<input type="text" class="Wdate" name="startTime" value="${gys.createTime}" readonly="readonly" onclick="WdatePicker()"/>
		  			 </div>
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="javascript:search()">立即查找</a>
		</div>
	
		</form>
	</div>
</div>
<div id="mainContainer">
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
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：客户反馈管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
											<input type="button" class="button_02" value="添加"
													onclick="addNews()" />
												<input type="button" class="button_02" value="删除"
													onclick="deleteNews()" />
										</td>
									</tr>
								</table>
<table class="default" width="100%">
	<col width="3%">
	<col width="10%">
	<col width="10%">
	<col width="8%">
	<col>
	<col width="12%">
	<col width="7%">
	<tr class="title">
		<td>
			<input type="checkbox" onclick="checkAll()" name="all" id="all">
		 </td>
	  <td>序号</td>
		<td>用户名</td>
		<td>性别</td>
		<td>电话</td>
		<td>身份证号</td>
		<td>邮箱</td>
		<td>年限</td>
		<td>读者类型</td>
		<td>创建时间</td>
		<td>证件类型</td>
		<td>客户反馈内容</td>
		
		<td>操作</td>
	</tr>
	<c:if test="${empty JGysList}">
		<tr  class="list">
			<td colspan="7">
				没有相关记录！
			</td>
		</tr>
	</c:if>
	<c:forEach items="${JGysList}" var="gys">
	<tr>
		<td>
			<input type="checkbox" name="ids" value="${gys.id}">
		</td>
		<td>${gys.id}</td>
		<td>${gys.name}</td>
		<td>${gys.sex}</td>
		<td>${gys.phone}</td>
		<td>${gys.cardNum}</td>
		<td>${gys.email}</td>
		<td>${gys.yearId}</td>
		
		
		<td><c:if test="${gys.state==0}">商品</c:if>
			<c:if test="${gys.state==1}">服务</c:if>
			<c:if test="${gys.state==2}">礼品</c:if>
			<c:if test="${gys.state==3}">商品属性</c:if>
			<c:if test="${gys.state==4}">文学</c:if>
			<c:if test="${gys.state==5}">其他</c:if>
		</td>
		
		<td><fmt:formatDate value="${gys.createTime}" pattern="yyyy-MM-dd"/></td>
		
		<td><c:if test="${gys.zjlx==0}">身份证号</c:if>
			<c:if test="${gys.zjlx==1}">护照</c:if>
			<c:if test="${gys.zjlx==2}">驾照</c:if>
			<c:if test="${gys.zjlx==3}">户口薄</c:if>
			
			<c:if test="${gys.zjlx==4}">其他</c:if>
		</td>
		<td>${gys.txm}</td>
		
		
		
		<td><input type="button" value="修改" onclick="updateNews('${gys.id}')"></td>
	</tr>
	</c:forEach>
</table>
<form action="getGyss.action" method="post" name="pageForm">
	
	
	<input type="hidden" id="pageId" name="currentPage">
	<%@include file="../../jsp/page.jsp"%>
</form>
</div>
</body>
</html>