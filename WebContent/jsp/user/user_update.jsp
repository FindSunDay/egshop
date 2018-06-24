<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改人员</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			
	
			function saveUser(){
				var name=$("#name").val();
				var psw=$("#psw").val();
				if($.trim(name)==''||$.trim(name)=='null'){
					alert("人员名不能为空！");
					return;
				}
				if($.trim(psw)==''||$.trim(psw)=='null'){
					alert("密码不能为空！");
					return;
				}
				$.post("updateUser.action",$("form").serialize(),function(data){
					if(data=='success'){
						alert("修改人员成功！");
						window.close();
						window.opener.page('${currentPage}');
					}else{
						alert("修改人员失败！");
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
						<img src="images/edit.gif">
					</div>
					<div class="namediv">
						修改人员
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="form" style="margin: 0px;">
			<input type="hidden" name="user.id" value="${user.id}">
			<input type="hidden" name="user.createTime" value="${user.createTime}">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>账&nbsp;&nbsp;户：
					</td>
					<td align="left">
						<input type="text" id="account" name="user.account" readonly="readonly" maxlength="15"
							class='AvidmW150' value="${user.account}" />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>姓&nbsp;&nbsp;名：
					</td>
					<td align="left">
						<input type="text" id="name" name="user.name" maxlength="20"
							class='AvidmW150' value="${user.name}" />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>余额：
					</td>
					<td align="left">
						<input type="text" id="money" name="user.money" maxlength="20"
							class='AvidmW150' value="${user.money}" />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>积分：
					</td>
					<td align="left">
						<input type="text" id="integral" name="user.integral" maxlength="20"
							class='AvidmW150' value="${user.integral}" />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>优惠券数量：
					</td>
					<td align="left">
						<input type="text" id="coupon" name="user.coupon" maxlength="20"
							class='AvidmW150' value="${user.coupon}" />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span> 密&nbsp;&nbsp;码：
					</td>
					<td align="left">
						<input type="password" id="psw" name="user.psw" maxlength="20"
							class='AvidmW150' value="${user.psw}" />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						邮&nbsp;&nbsp;箱：
					</td>
					<td align="left">
						<input   type="text"  
							name="user.email" id="email" class='AvidmW150' value="${user.email}"/>
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						人员角色：
					</td>
					<td align="left">
					<s:select list="roleList" listKey="id" listValue="name" name="user.roleId" value="user.roleId" theme="simple"></s:select>
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