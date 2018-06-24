<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加人员</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			function saveUser(){
				var name=$("#name").val();
				var account=$("#account").val();
				if($.trim(name)==''||$.trim(name)=='null'){
					alert("姓名不能为空！");
					return;
				}
				if($.trim(account)==''||$.trim(account)=='null'){
					alert("账户不能为空！");
					return;
				}else{
					var flag=true;
					var param={"account":account};
					$.post("valiadeAccount.action",param,function(data){
						if(data=='false'){
							alert("账户已存在！");
							return;
						}else{
							$("#saveButton").attr("disabled","disabled");
							$.post("addUser.action",$("form").serialize(),function(data){
								if(data=='success'){
									alert("保存人员成功！");
									window.close();
									window.opener.location.href="getUserManage.action";
								}else{
									alert("保存人员失败！");
									$("#saveButton").attr("disabled","");
								}
							});	
						}
					});
				}
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
						添加人员
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="form" style="margin: 0px;">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>账&nbsp;&nbsp;户：
					</td>
					<td align="left">
						<input type="text" id="account" name="user.account" maxlength="15"
							class='AvidmW150' />
					</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>姓&nbsp;&nbsp;名：
					</td>
					<td align="left">
						<input type="text" id="name" name="user.name" maxlength="20"
							class='AvidmW150' />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						密&nbsp;&nbsp;码：
					</td>
					<td align="left">
						<input value="888888" type="text" readonly="readonly"
							name="user.psw" id="password" class='AvidmW150' />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						邮&nbsp;&nbsp;箱：
					</td>
					<td align="left">
						<input   type="text"  
							name="user.email" id="email" class='AvidmW150' />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						角&nbsp;&nbsp;色：
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