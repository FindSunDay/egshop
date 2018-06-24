<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易购网站</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<link href="style/landed.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	function register(){
				var name=$("#name").val();
				var account=$("#account").val();
				var psw=$("#psw").val();
				var password=$("#password").val();
				var email=$("#email").val();
				if($.trim(account)==''||$.trim(account)=='null'){
					$("#account_err").html("账号不能为空！");
					return;
				}else{
					$("#account_err").html("");
				}
				if($.trim(name)==''||$.trim(name)=='null'){
					$("#name_err").html("姓名不能为空！");
					return;
				}else{
					$("#name_err").html("");
				}
				if($.trim(psw)==''||$.trim(psw)=='null'){
					$("#psw_err").html("密码不能为空！");
					return;
				}else{
					$("#psw_err").html("");
				}
				if($.trim(psw)!=$.trim(password)){
					$("#password_err").html("密码不匹配！");
					return;
				}else{
					$("#password_err").html("");
				}
				if($.trim(email)==''||$.trim(email)=='null'){
					$("#email_err").html("邮箱不能为空！");
					return;
				}else{
					$("#email_err").html("");
				}
				var flag=true;
				$("#saveButton").attr("disabled","disabled");
				var param={"account":account};
				$.post("yzAccount.action",param,function(data){
					if(data=='false'){
						alert("账户已存在！请重新输入");
						$("#saveButton").attr("disabled","");
						return;
					}else{
						$.post("registerUser.action",$("form").serialize(),function(data){
							if(data=='success'){
								alert("注册成功！");
								window.location.href="index.jsp";
							}else{
								alert("注册失败！");
								$("#saveButton").attr("disabled","");
							}
						});	
					}
				});
	}
	
	function checkValue(){
				var name=$("#name").val();
				var account=$("#account").val();
				var psw=$("#psw").val();
				var password=$("#password").val();
				var email=$("#email").val();
				var reg=/^([0-9]{10})+@yxnu.net$/;
				if($.trim(account)==''||$.trim(account)=='null'){
					$("#account_err").html("账号不能为空！");
					return;
				}else{
					$("#account_err").html("");
				}
				if($.trim(name)==''||$.trim(name)=='null'){
					$("#name_err").html("姓名不能为空！");
					return;
				}else{
					$("#name_err").html("");
				}
				if($.trim(psw)==''||$.trim(psw)=='null'){
					$("#psw_err").html("密码不能为空！");
					return;
				}else{
					$("#psw_err").html("");
				}
				if($.trim(psw)!=$.trim(password)){
					$("#password_err").html("密码不匹配！");
					return;
				}else{
					$("#password_err").html("");
				}
				if($.trim(email)==''||$.trim(email)=='null'){
					$("#email_err").html("邮箱不能为空！");
					return;
				}else {
					$("#email_err").html("");
				}
	}
</script>
<body>
<!--网站顶部-->
<div class="webtop">
	<jsp:include page="top.jsp"></jsp:include>
</div>

<!--搜索和导航-->
<div class="sounav">
	<jsp:include page="search.jsp"></jsp:include>
</div>

<div class="xdhlr">首页 &gt;注册</div>
<!-- top5-->
<div class="log">
<div class="hkuang">
  <div class="land">注册新用户</div>
  <form action="" method="post">
  <div class="zc_2">
  	<div class="zc_2_1">
  	  <div class="land_1_3" >
      	<div class="zc_2_2"><span>*</span>账号：</div>
        <div class="float_left"><input name="user.account" onblur="checkValue()" type="text" class="kuang" id="account" size="30"/><span id="account_err" style="color: red;border: 1;font-size: 10px;"></span></div>
      </div>
       <div class="land_1_3" >
      	<div class="zc_2_2"><span>*</span>真实姓名：</div>
        <div class="float_left"><input name="user.name" type="text" onblur="checkValue()" class="kuang" id="name" size="30"/><span id="name_err" style="color: red;border: 1;font-size: 10px;"></span></div>
      </div>
  	  <div class="land_1_3" >
      	<div class="zc_2_2"><span>*</span>设置密码：</div>
        <div class="float_left"><input name="user.psw" type="password" onblur="checkValue()" class="kuang" id="psw" size="30"/><span id="psw_err" style="color: red;border: 1;font-size: 10px;"></span></div>
      </div>
  	  <div class="land_1_3" >
      	<div class="zc_2_2"><span>*</span>确认密码：</div>
        <div class="float_left"><input type="password" class="kuang" onblur="checkValue()" id="password" size="30"/><span id="password_err" style="color: red;border: 1;font-size: 10px;"></span></div>
      </div>
  	  <div class="land_1_3" >
      	<div class="zc_2_2"><span>*</span>邮箱：</div>
        <div class="float_left"><input name="user.email" type="text" onblur="checkValue()" class="kuang" id="email" size="30"/><span id="email_err" style="color: red;border: 1;font-size: 10px;"></span></div>
      </div>
  	  <div class="land_1_2"><input type="button" value="注册新用户" id="saveButton" onclick="register()"/></div>
  	</div>
  </div>
  </form>
</div>
</div>

<div style="width:960px; height:auto; margin:10px auto 0 auto;">
<jsp:include page="foot.jsp"></jsp:include>
</div>

</body>
</html>

