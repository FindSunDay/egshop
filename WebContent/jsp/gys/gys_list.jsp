<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/struts-tags" prefix="s"%>	
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
</head>
<body>
<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;客户反馈统计&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;客户反馈统计&nbsp;
	</div>
</div>
<div id="tips">
	<div id="buttonGroup">
		<form action="getPaperByTeahcer.action" name="search" method="post">
		<div class="search">
		  申请时间：<input type="text" class="Wdate" name="startTime" value="${startTime}" readonly="readonly" onclick="WdatePicker()"/>至
		  		  <input type="text" class="Wdate" name="endTime" value="${endTime}" readonly="readonly" onclick="WdatePicker()"/>
		  类型： <s:select list="#{'0':'服务问题','1':'买卖问题','2':'金额问题','3':'商品问题','4':'其他问题'}" headerKey="" headerValue="--全部--" name="state" value="state" theme="simple"></s:select>
		 </div>
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="javascript:search()">立即查找</a>
		</div>
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="javascript:deleteRow('deletePart.action')">删除</a>
		</div>
		</form>
	</div>
</div>
<div id="mainContainer">
<table class="default" width="100%">
	<col width="3%">
	<col width="10%">
	<col width="10%">
	<col width="8%">
	<col>
	<col width="10%">
	<col width="12%">
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
		<td>状态</td>
		<td>创建时间</td>
		<td>证件类型</td>
		<td>客户反馈内容</td>
		
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
		
		
		<td><c:if test="${gys.state==0}">业余爱好</c:if>
			<c:if test="${gys.state==1}">博思广学</c:if>
			<c:if test="${gys.state==2}">小说文学</c:if>
			<c:if test="${gys.state==3}">理财励志</c:if>
			<c:if test="${gys.state==4}">科学道理</c:if>
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
		
		
	</tr>
	</c:forEach>
</table>
<form action="getGyss.action" method="post" name="pageForm">
	
	<input type="hidden" name="state" value="${state}">
	<input type="hidden" id="pageId" name="currentPage">
	<%@include file="../../jsp/page.jsp"%>
</form>
</div>
</body>
</html>