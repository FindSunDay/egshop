<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>客户反馈发展</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<SCRIPT type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></SCRIPT>
		<script type="text/javascript">
			function addType(){
				var sqTime=$("#kehuname").val();
				if($.trim(sqTime)==''||$.trim(sqTime)=='null'){
					alert("客户反馈名称不能为空！");
					return;
				}
				 $.post("updateJGys.action",$("form").serialize(),function(data){
					if(data == 'success'){
						alert("操作成功！");
						window.close();
						window.opener.page(1);
					}else{
						alert("操作失败！");
					}
				});
			}
		</script>
	</head>
	<body class="openWinPage">
		<form id='form' name="form" style="margin: 0px;" method="post">
			<input type="hidden" name="gys.id" value="${gys.id}">
			<input type="hidden" name="gys.createTime" value="${gys.createTime}">
			
			<table width="100%" class="avidmTable">
			<tr class="left_col">
					<td align="right">
						 客户反馈编号：
					</td>
					<td align="left">
						 <input type="text" id="id" name="gys.id"  value="${gys.id}">
					</td>
					</tr>
					</tr>
					<tr class="left_col">
					<td align="right">
						客户反馈全称：
					</td>
					<td align="left">
						 <input type="text" id="name" name="gys.name"  value="${gys.name}">
					</td>
					</tr>
					</tr>
					<tr class="left_col">
					<td align="right">
						 性别：
					</td>
				<td align="left">
							<input type="radio" id="sex" name='gys.sex' value="男" checked="checked" />男
							<input type="radio" id="sex" name='gys.sex' value="女"/>女
						</td>
					</tr>
					</tr>
					<tr class="left_col">
					<td align="right">
						 电话：
					</td>
					<td align="left">
						 <input type="text" id="phone" name="gys.phone"  value="${gys.phone}" >
					</td>
					</tr>
					</tr>
					<tr class="left_col">
					<td align="right">
						 身份证号：
					</td>
					<td align="left">
						 <input type="text" id="cardNum" name="gys.cardNum" value="${gys.cardNum}">
					</td>
					</tr>
					</tr>
					<tr class="left_col">
					<td align="right">
						 邮箱：
					</td>
					<td align="left">
						 <input type="text" id="email" name="gys.email"  value="${gys.email}">
					</td>
					</tr>
					
				<tr class="left_col">
				
					<td align="right">
						<span>*</span>合作时间：
					</td>
					<td align="left">
						 <input type="text" id="yearId" name="gys.yearId" class="Wdate" value="${gys.yearId}" readonly="readonly" onclick="WdatePicker()">
					</td>
					</tr>
					<tr class="left_col">
				
					<td align="right">
						<span>*</span>客户反馈内容：
					</td>
					<td align="left">
						 <input type="text" id="txm" name="gys.txm"  value="${gys.txm}">
					</td>
					</tr>
					
					<tr class="left_col">
				
				
					<td align="right">
						<span>*</span>证件类型：
					</td>
					<td align="left">
						  <s:select list="#{'0':'身份证号','1':'护照','2':'驾照','3':'户口薄','4':'其他'}" name="gys.zjlx" value="gys.zjlx" theme="simple"></s:select>
						</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						客户反馈 类型：
					</td>
					<td align="left">
				 		 <s:select list="#{'0':'商品','1':'服务','2':'礼品','3':'商品属性','4':'文学','5':'其他'}" name="gys.state" value="gys.state" theme="simple"></s:select>
					</td>
				</tr>
			
				 
			</table>
		</form>
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;">
			<tr>
				<td>
					<input class="button_02" onclick="addType()" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>