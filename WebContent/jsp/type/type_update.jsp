<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改分类</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			function addType(){
				var name=$("#name").val();
				if($.trim(name)==''||$.trim(name)=='null'){
					alert("名称不能为空！");
					return;
				}
				$.post("updateProType.action",$("form").serialize(),function(data){
					if(data == 'success'){
						alert("修改成功！");
						window.close();
						window.opener.page('${currentPage}');
					}else{
						alert("修改失败！");
					}
				});
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
						修改商品分类
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="form" style="margin: 0px;">
		<input type="hidden" name="proType.id" value="${proType.id}">
		 <input type="hidden" name="proType.userName" value="${proType.userName}">
	     <input type="hidden" name="proType.createTime" value="${proType.createTime}">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>名称：
					</td>
					<td align="left">
						<input type='text' id="name" name='proType.name' class='AvidmW150'
							maxlength="50"  value="${proType.name}"/>
					</td>
				</tr>
			</table>
		</form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;">
			<tr>
				<td class="exegesis" style="width: 200px;">
					<span>*</span> 为必选/必填项
				</td>
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