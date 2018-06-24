<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	var name=$("#name").val();
	var email=$("#email").val();
		var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if($.trim(name)==''||$.trim(name)=='null'){
			alert("姓名不能为空！");
			return;
		}
		if($.trim(email)==''||$.trim(email)=='null'){
					alert("电子邮箱不能为空！");
					return;
				}else if(!reg.test(email)){
					alert("电子邮箱不合法！");
					return;
				}
	 $.post("updatePerson.action",$("form").serialize(),function(data){
	 	if(data=='success'){
	 		alert("操作成功！");
	 		window.location.reload();
	 	}else if(data=='login'){
	 		alert("操作成功！");
	 		window.location.href="loginOut.action"
	 	}else{
	 		alert('操作失败！');
	 	}
	 });
	 
}

function payWay(){
				var url="front_money.action";
			 	openWindow(url,500,290);
}
			
function advance(){
	var url="front_advanceMoney.action";
 	openWindow(url,500,290);
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
<!-- top5-->
<div class="log">
<div class="hkuang">
  <div class="gwc_2">
    <div class="gwc_4">
        <table width="910" border="0" cellpadding="0" cellspacing="1" bgcolor="#E3E3E3">
      <tr>
        <td  bgcolor="#FFFFFF" width="100px;">账号 ：</td>
        <td  bgcolor="#FFFFFF" width="200px">${sessionScope.loginUser.account}</td>
      </tr>
      <tr>
        <td  bgcolor="#FFFFFF">钱包余额 ：</td>
       <td  bgcolor="#FFFFFF">${sessionScope.loginUser.money}</td>    
       <td  bgcolor="#FFFFFF">&nbsp;<input type="button" onclick="payWay()" value="钱包充值"><input type="button" onclick="advance()" value="余额提现"></td>

      </tr>
      <tr>
        <td  bgcolor="#FFFFFF">积分 ：</td>
        <td  bgcolor="#FFFFFF">${sessionScope.loginUser.integral}</td>    
      </tr>
      <tr>
        <td  bgcolor="#FFFFFF">会员等级 ：</td>
        <td  bgcolor="#FFFFFF">${sessionScope.loginUser.memberLevel}</td>    
      </tr>
      <tr>
        <td  bgcolor="#FFFFFF">优惠券剩余数量 ：</td>
        <td  bgcolor="#FFFFFF">${sessionScope.loginUser.coupon}</td>    
      </tr>
       <tr>
        <td  bgcolor="#FFFFFF">真实姓名 ：</td>
        <td bgcolor="#FFFFFF"><input type="text" id="name" name="user.name" value="${sessionScope.loginUser.name}"></td>
      </tr>
      <tr>
        <td  bgcolor="#FFFFFF">密码 ：</td>
        <td bgcolor="#FFFFFF"><input type="password" name="user.psw" ></td>
      </tr>
      <tr>
        <td  bgcolor="#FFFFFF">邮箱 ：</td>
        <td bgcolor="#FFFFFF"><input type="text" id="email" name="user.email" value="${sessionScope.loginUser.email}"></td>
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
