<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加规格</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			function addType(){
				var name=$("#name").val();
				var price=$("#price").val();
				if($.trim(name)==''||$.trim(name)=='null'){
					alert("名称不能为空！");
					return;
				}
				if($.trim(price)==''||$.trim(price)=='null'){
					alert("价格不能为空！");
					return;
				}
				$.post("saveGg.action",$("form").serialize(),function(data){
					if(data == 'success'){
						alert("添加成功！");
						window.location.href="getGgsList.action?id=${id}";
					}else{
						alert("添加失败！");
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
						<img src="images/add.gif">
					</div>
					<div class="namediv">
						添加规格
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="form" style="margin: 0px;">
		<input type="hidden" name="gg.goodsId" value="${id}">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>名称：
					</td>
					<td align="left">
						<input type='text' id="name" name='gg.name' class='AvidmW150'
							maxlength="50" />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						<span>*</span>价格：
					</td>
					<td align="left">
						<input type='text' id="price" name='gg.price' class='AvidmW150'
							maxlength="50" />
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