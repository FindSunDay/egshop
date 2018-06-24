<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加商品</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<link rel="stylesheet" href="css/uploadify.css" type="text/css"></link>
		<link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
		<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.uploadify.v2.0.3.js"></script>
  		<script type="text/javascript" src="js/swfobject.js"></script>
  		<script type="text/javascript" src="js/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="js/kindeditor/lang/zh_CN.js"></script>
		<script type="text/javascript" src="js/kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript">
		
		var editor;
			KindEditor.ready(function (K) {
				editor = K.create('textarea[name="product.content"]', {cssPath:"js/kindeditor/plugins/code/prettify.css", uploadJson:"js/kindeditor/jsp/upload_json.jsp", fileManagerJson:"js/kindeditor/jsp/file_manager_json.jsp", allowFileManager:true, afterCreate:function () {
					var self = this;
					K.ctrl(document, 13, function () {
						self.sync();
						document.forms["form"].submit();
					});
					K.ctrl(self.edit.doc, 13, function () {
						self.sync();
						document.forms["form"].submit();
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
		
		
			function saveProduct(){
				try {
			
				var title=$("#title").val();
				var iamge=$("#image").val();
				var size=$("#size").val();
				var type=$("#type").val();
				var oldPrice=$("#oldPrice").val();
				var newPrice=$("#newPrice").val();
				var groupNum=$("#groupNum").val();
				var reg=/^[1-9]d*.d*|0.d*[1-9]d*$/;
				if($.trim(title)==''||$.trim(title)=='null'){
					alert("名称不能为空！");
					return;
				}

				

				
				if($.trim(type)==''||$.trim(type)=='null'){
					alert("商品分类不能为空！");
					return;
				}
				
				if($.trim(oldPrice)==''||$.trim(oldPrice)=='null'){
					alert("原价不能为空！");
					return;
				}else if(!reg.test(oldPrice)){
					alert("原价不合法！");
					return;
				}
				
				if($.trim(newPrice)==''||$.trim(newPrice)=='null'){
					alert("折后价不能为空！");
					return;
				}else if(!reg.test(newPrice)){
					alert("折后价不合法！");
					return;
				}
				
				
				$("#content").val(editor.html());
			
			   $.post("addProduct.action",$("form").serialize(),function(data){
				if(data=='success'){
					alert("保存成功！");
					window.close();
					window.opener.location.href="getProductManage.action";
				}else{
					alert("保存失败！");
				}
				
			});	
			
			}catch(e) {
				alert(e);
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
						添加商品
					</div>
				</td>
			</tr>
		</table>
		<form id="edui_form_upload" enctype="multipart/form-data"  method="post">
		                        <table style="width: 100%; height: 100%; margin: 10px;font-size: 12px" cellpadding="0" cellspacing="0">
		                          <tr>
		                            <td width="100">选择商品图片：</td>
					                <td  > <input id="sdf1" type="file" accept="image/*" name="upfile" onchange="upload('img',0)"></td>
						          </tr> 
				               </table>
	     </form>
		<form id='form' name="form" style="margin: 0px;">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>商品名称：
					</td>
					<td align="left">
						<input type="text" id="title" name="product.title" maxlength="15"
							class='AvidmW250' />
					</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>商品图片：
					</td>
					<td align="left">
						<input type="hidden" id="image" name='product.image' value="${product.image}"/>
						
						 <img  src="images/zwtp1.jpg" width="150" height="130" id="img"/><br/>
					  
					    <div id="div_progress"></div> 
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						商品规格：
					</td>
					<td align="left">
					<input type="text" id="size" name="product.size" maxlength="30"
							class='AvidmW250' /><font color="red" size="2">(* 多规格用,分割)</font>					
				</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						商品库存：
					</td>
					<td align="left">
					<input type="text" id="kucun" name="product.stock" maxlength="30"
							class='AvidmW150' />			
				</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						所属分类：
					</td>
					<td align="left">
						<s:select id="type" list="proTypeList" listKey="id" listValue="name" name="product.proType.id" value="product.proType.id" theme="simple"></s:select>
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						原价：
					</td>
					<td align="left">
						<input   type="text"  
							name="product.oldPrice" id="oldPrice" class='AvidmW150' />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						折后价：
					</td>
					<td align="left">
						<input   type="text"  
							name="product.newPrice" id="newPrice" class='AvidmW150' />
					</td>
				</tr>
				<!-- 
				<tr class="left_col">
					<td align="right">
						最低团购数量：
					</td>
					<td align="left">
						<input   type="text"  
							name="product.groupNum" id="groupNum" class='AvidmW150' />
					</td>
				</tr>
				 -->
				<tr class="left_col">
					<td align="right">
						关键词：
					</td>
					<td align="left">
						<input type="text" id="keyWords" name="product.keyWords" maxlength="15"
							class='AvidmW250' />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						入驻商户联系邮箱：
					</td>
					<td align="left">
						<input type="text" id="businessMail" name="product.businessMail" maxlength="15"
							class='AvidmW250' />
					</td>
				</tr>
				
				<tr class="left_col">
					<td align="right">
						商品描述：
					</td>
					<td align="left">
						<textarea name="product.content" id="content" style="width:480px;height:200px"></textarea>
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
					<input class="button_02" onclick="saveProduct()" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>