<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加留言</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
		<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="js/kindeditor/lang/zh_CN.js"></script>
		<script type="text/javascript"
			src="js/kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript">
			var editor;
			KindEditor.ready(function (K) {
				editor = K.create('textarea[name="content"]', {cssPath:"js/kindeditor/plugins/code/prettify.css", uploadJson:"js/kindeditor/jsp/upload_json.jsp", fileManagerJson:"js/kindeditor/jsp/file_manager_json.jsp", allowFileManager:true, afterCreate:function () {
					var self = this;
					K.ctrl(document, 13, function () {
						self.sync();
						document.forms["newsform"].submit();
					});
					K.ctrl(self.edit.doc, 13, function () {
						self.sync();
						document.forms["newsform"].submit();
					});
				}});
				prettyPrint();
			});
		
			function addMessage(){
				var content=editor.html();
				var receiverId=$("#receiverId").val();
				if($.trim(content)==''||$.trim(content)=='null'){
					alert("内容不能为空！");
					return;
				}
				var param={"id":receiverId,"message.content":content};
				$.post("addMessage.action",param,function(data){
					if(data == 'success'){
						alert("留言成功！");
						window.close();
					}else{
						alert("留言失败！");
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
						添加留言
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="newsform" style="margin: 0px;">
		<input type="hidden" id="receiverId" value="${id}">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>内容：
					</td>
					<td align="left">
					<textarea name="content" id="content" style="width: 99%; height: 250px; visibility: hidden;"></textarea>
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
					<input class="button_02" onclick="addMessage()" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>