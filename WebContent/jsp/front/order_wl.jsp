<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购网站</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<link href="style/landed.css" rel="stylesheet" type="text/css" />
<link href="style/gwc.css" rel="stylesheet" type="text/css" />
<link href="style/search.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/openwindow.js"></script>
<script type="text/javascript">
function saveUser(){
	var expNo=$("#expNo").val();
				var expNm=$("#expNm").val();
				if(expNo==''){
					alert("快递单号不能为空！");
					return;
				}
				if(expNo==''){
					alert("快递公司不能为空！");
					return;
				}
					$("#saveButton").attr("disabled","disabled");
					$.post("updateOrderJh.action",$("form").serialize(),function(data){
						if(data=='success'){
							alert("操作成功！");
							window.close();
							window.location.href="myOrderList.action?menu=3";
						}else{
							alert("操作失败！");
							$("#saveButton").attr("disabled","");
						}
					});	
	 
}

 
</script>
<body>
<!--网站顶部-->
<input id="productId" type="hidden" value="${product.id}">
<div class="webtop">
	<jsp:include page="../../top.jsp"></jsp:include>
</div>

<!--搜索和导航-->
<div class="sounav">
	<jsp:include page="../../search.jsp"></jsp:include>
</div>
<form action="">
<input type="hidden" name="order.id" value="${id}">
<!-- top5-->
<div class="log">
<div class="hkuang">
  <div class="gwc_2">
    <div class="gwc_4">
        <table width="910" border="0" cellpadding="0" cellspacing="1" bgcolor="#E3E3E3">
      <tr>
        <td  bgcolor="#FFFFFF" width="100px;">订单号 ：</td>
        <td  bgcolor="#FFFFFF" width="200px">${id}</td>
      </tr>
       
       <tr>
        <td  bgcolor="#FFFFFF">快递单号 ：</td>
        <td bgcolor="#FFFFFF"><input type="text" id="expNo" name="order.expNo" ></td>
      </tr>
      
      <tr>
        <td  bgcolor="#FFFFFF">快递公司 ：</td>
        <td bgcolor="#FFFFFF"><input type="text" id="expNm" name="order.expNm" ></td>
      </tr>
    </table>
    <table align="center">
    	<tr><td>
    		<input type="button" onclick="saveUser()" value="确定">
    		</td>
    	</tr>
    </table>
        </div>
  </div>
</div>
</div>
</form>
<div style="width:960px; height:auto; margin:10px auto 0 auto;">
	<jsp:include page="../../foot.jsp"></jsp:include>
</div>

</body>
</html>
