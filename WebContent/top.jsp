<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <script type="text/javascript" src="js/thickbox_plus.js"></script>
 <script type="text/javascript" src="js/openwindow.js"></script>
<script type="text/javascript">

	function leave_message(id){
		var url="message_init.action?id="+id;
		openWindow(url,500,400);
	}
	function countMessages(){
		$.post("countReadMessage.action",null,function(data){
			$("#total").html(data);
		},"json");
	}
	 setInterval(countMessages,10000);
	 
</script>
<div class="float_left" style="width:960px; height:25px">
  <div class="top_1"><span>您好，欢迎光临易购网站</span>
  <c:if test="${sessionScope.loginUser==null}"><a href="ShowLogin.html?height=160;width=400" class="thickbox">登录</a> | <a href="register.jsp">注册</a></c:if>
  <c:if test="${sessionScope.loginUser!=null}">${sessionScope.loginUser.name} | <a href="loginOut.action">退出</a>|<a href="back.jsp">新留言<span id="total" style="color: red;">0</span>条</a> |<a href="javascript:leave_message('2016031001');">给卖家留言</a> </c:if>
  </div>
  <div class="top_3">
  	<div><a href="javascript:online('${sessionScope.loginUser.id}')" id="qq"></a></div>
  	<a href="shopCar.action?menu=2">购物车</a>
  	
  	<c:if test="${!empty sessionScope.loginUser}">
  	     | <a href="myCollectList.action?menu=2">我的收藏</a>
         | <a href="myOrderList.action?menu=3">我的订单</a>
         | <a href="userInfoInit.action?menu=4">信息管理</a>
      <c:if test="${sessionScope.loginUser.roleId==1}">
         | <a href="back.jsp">后台管理</a>
      </c:if>
      <c:if test="${sessionScope.loginUser.roleId==8}">
         | <a href="back.jsp">后台管理</a>
       </c:if>
     </c:if>
  </div>
  
  </div>