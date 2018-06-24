<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>余额提现</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			function saveUser(){
				var initPrice=$("#initPrice").val();
				 var reg=/^([0-9]+[0-9]*)$/;
				if(!reg.test(initPrice)){
					alert("提现金额不合法！");
					return;
				}
					$("#saveButton").attr("disabled","disabled");
					$.post("advanceMyMoney.action",$("form").serialize(),function(data){
						if(data=='success'){
							alert("提现成功！");
							window.close();
							window.opener.location.reload();
						}else{
							alert("提现失败："+data);
							$("#saveButton").attr("disabled","");
						}
					});	
			}
			
			function checkValue(val){
				var reg=/^([0-9]+[0-9]*)$/;
				if(!reg.test(val.value)){
					val.value="";
				}
			}
		</script>
	</head>

	<body class="openWinPage">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="AvidmTitleName">
					<div class="imgdiv">
						<img src="images/add.gif">
					</div>
					<div class="namediv">
						提现金额
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="form" style="margin: 0px;">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>提现金额：
					</td>
					<td align="left">
						<input type="text" id="initPrice" name="user.money" maxlength="15"
							class='AvidmW150' onkeydown="checkValue(this)" />
					</td>
					</tr>
			</table>
		</form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;">
			<tr>
				<td class="exegesis" style="width: 220px;">
					<span>*</span> 为必选/必填项
				</td>
				<td>
					<input class="button_02" onclick="saveUser()" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>