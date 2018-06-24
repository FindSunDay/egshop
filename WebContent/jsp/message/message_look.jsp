<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>查看留言</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		
	</head>

	<body class="openWinPage">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="AvidmTitleName">
					<div class="imgdiv">
						<img src="images/add.gif">
					</div>
					<div class="namediv">
						查看留言
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="newsform" style="margin: 0px;">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
						<td align="right" width="20%">
							留言人：
						</td>
						<td align="left">
							${message.userName}
						</td>
					</tr>
				<tr class="left_col">
					<td align="right">
						内容：
					</td>
					<td align="left" height="300px" style="overflow: auto;">
						${message.content}
					</td>
				</tr>
			</table>
		</form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;">
			<tr>
				<td align="center">
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>