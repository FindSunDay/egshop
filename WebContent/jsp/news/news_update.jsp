<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
		<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="css/uploadify.css" type="text/css"></link>
		<!-- 
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		 -->
		<script type="text/javascript" src="js/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="js/kindeditor/lang/zh_CN.js"></script>
		<script type="text/javascript"
			src="js/kindeditor/plugins/code/prettify.js"></script>
			
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.uploadify.v2.0.3.js"></script>
			
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
			
			function upload(imgName, ind) {
				try {
					console.log(new FormData($('#edui_form_upload')[0]));
					$.ajax({
						cache: false,
		                type: "POST",
		                url:"utf8-jsp/jsp/controller.jsp?action=uploadimage",
		                processData: false,
		                contentType: false,
		                data: new FormData($('#edui_form_upload')[ind]),
		                async: false,
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                    var obj = JSON.parse(data);
		                    $('#'+imgName).attr('src', obj.url); 
		                    $("#image").attr('value', obj.url); 
		                }
		            });

				} catch (e) {
					alert(e);
				}
			}
		
			function addNews(){
				var newsId=$("#newsId").val();
				var title=$("#title").val();
				//var content=editor.html();
				var image=$("#image").val();
				var type=$("#newsType").val();
				if($.trim(title)==''||$.trim(title)=='null'){
					alert("名称不能为空！");
					return;
				}
				if($.trim(image)==''||$.trim(image)=='null'){
					alert("图片不能为空！");
					return;
				}
				/*
				if($.trim(content)==''||$.trim(content)=='null'){
					alert("内容不能为空！");
					return;
				}
				*/
				var param={"news.title":title,"news.image":image,"news.id":newsId,"news.type":type};
				$.post("updateNews.action",param,function(data){
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
						<img src="images/add.gif">
					</div>
					<div class="namediv">
						添加公告
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="newsform" style="margin: 0px;">
			<input id="newsId" type="hidden" value="${news.id}">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>标题：
					</td>
					<td align="left" >
						<input type='text' id="title"  class='AvidmW150'
							maxlength="50" style="width: 350px" value="${news.title}"/>
					</td>
				</tr>
				<!-- 
				<tr class="left_col">
					<td align="right">
						<span>*</span>内容：
					</td>
					<td align="left">
					<textarea name="content" id="content" style="width: 99%; height: 350px; visibility: hidden;">${news.content}</textarea>
					</td>
				</tr>
				 -->
				<tr class="left_col">
					<td align="right">
						<span>*</span>广告图片：
					</td>
					<td align="left">
						<input type="hidden" id="image" name='image' value="${news.image}"/>
						
						 <img  src="${news.image}" width="150" height="130" id="img"/><br/>
					  
					    <div id="div_progress"></div> 
					</td>
				</tr>				 
			</table>
		</form>
		<form id="edui_form_upload" enctype="multipart/form-data"  method="post">
		                        <table style="width: 100%; height: 100%; margin: 10px;font-size: 12px" cellpadding="0" cellspacing="0">
		                          <tr>
		                            <td width="100">选择图片：</td>
					                <td  > <input id="sdf1" type="file" accept="image/*" name="upfile" onchange="upload('img',0)"></td>
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