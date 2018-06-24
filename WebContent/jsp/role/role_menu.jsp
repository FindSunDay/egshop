<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>角色授权</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var param={"id":'${id}'};
			$.post("selectRoleMenu.action",param,function(data){
				var datas="";
				var select=data.selectMenu;
				var noSelect=data.noSelectMenu;
				for(var i=0;i<noSelect.length;i++){
					datas+="<br><span><input type=\"checkbox\" value="+noSelect[i].id+">"+noSelect[i].name+"</span>"
				}
				for(var j=0;j<select.length;j++){
					datas+="<br><span><input type=\"checkbox\" value="+select[j].id+" checked=\"checked\">"+select[j].name+"<span>"
				}
				$("#loading").hide();
				$("#tree").html(datas);
			},"json");
		});
		
		
	function selecMenu(){
		var roleId=$("#roleId").val();
	   var array="id="+roleId;
		var checkbox=$("#tree").find("input[type=\"checkbox\"]");
		for(var i=0;i<checkbox.length;i++){
			if(checkbox[i].checked){
				array+="&ids="+checkbox[i].value;
			}
		}
		$.post("addRoleMenu.action",array,function(data){
			if(data=='success'){
				alert("授权成功！");
				window.close();
			}else{
				alert("授权失败！");
			}
		});
	}	
</script>
	</head>

	<body class="openWinPage">
	<input type="hidden" id="roleId" value="${id}">
		<div class="AvidmDivLoading" id="loading">
			<span>请稍待，载入中……</span>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="AvidmTitleName">
					<div class="imgdiv">
					</div>
					<div class="namediv">
						角色授权
					</div>
				</td>
			</tr>
		</table>
		<table class="avidmTable" width="100%">
			<tr>
				<td valign="top" align="center" width="100%" height="300px">
					<div id="tree"  style="height: 300px;overflow: auto; ">
					</div>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;">
			<tr>
				<td align="center">
					<input class="button_02" onclick="selecMenu()" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>
