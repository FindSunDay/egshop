

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加公告</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
		<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="js/kindeditor/lang/zh_CN.js"></script>
		<script type="text/javascript"
			src="js/kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript">
		
		
			function addNews(){
				var title=$("#yearId").val();
				var content=$("#cardNum").val();
			
				if($.trim(title)==''||$.trim(title)=='null'){
					alert("反馈不能为空！");
					return;
				}
				if($.trim(content)==''||$.trim(content)=='null'){
					alert("内容不能为空！");
					return;
				}
				
				$.post("saveJGys.action",$("form").serialize(),function(data){
					if(data == 'success'){
						alert("添加成功！");
						window.close();
						window.opener.location.href="getGyss.action";
					}else{
						alert("添加！");
						window.opener.location.href="getGyss.action";
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
						添加反馈建议
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="form" style="margin: 0px;">
			<table width="100%" class="avidmTable">
				
					<tr class="left_col">
					<td align="right">
						客户反馈：
					</td>
					<td align="left">
						 <input type="text" id="name" name="gys.name"  value="${gys.name}">
					</td>
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
						 <span>*</span>反馈人身份证号：
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
						<span>*</span>反馈信息：
					</td>
					<td align="left">
						 <input type="text" id="yearId" name="gys.yearId"  value="${gys.yearId}">
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
					<input type="text" id="zjlx" name="gys.zjlx"  value="${gys.zjlx}">
						 	</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>客户反馈类型：
					</td>
					<td align="left"><input type="text" id="state" name="gys.state"  value="${gys.state}">
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
					<input class="button_02" onclick="addNews()" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>