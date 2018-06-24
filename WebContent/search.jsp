<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

<div class="sou">
    	<div class="logo"><font size="13" color="red">易购商城</font></div><!--LOGO-->
        <!--搜索-->
        <form action="productListByFront.action" method="post">
        	<input type="hidden" name="menu" value="${menu}">
        <div class="sousuo">
        	<div class="sp"></div>
            <div class="splr">
           	  <div class="float_left splr_left"><input name="title" value="${title}" type="text"  style="border:0px; width:300px; font-size:14px; padding-top:3px;" class="666"/><select id="productType" name="typeName" style="float: right;height: 23px"></select></div>
                <div class="float_left"> <input  type="image" src="images/soutp.jpg" /></div>
            </div>
        </div>
        </form>
     </div>
     <!--导航-->
     <div class="nav">
     	<div class="wz" id="menu0"><a href="index.jsp" >首  页</a></div>
     	<span id="menuList"></span>
        <!--  
        <div class="wz" id="menu2"><a href="shopCar.action?menu=2">购物车</a></div>
       
        <c:if test="${!empty sessionScope.loginUser}">
        <div class="wz" id="menu3"><a href="myOrderList.action?menu=3">我的订单</a></div>
        <div class="wz" id="menu4"><a href="userInfoInit.action?menu=4">信息管理</a></div>
        <c:if test="${sessionScope.loginUser.roleId==1}">
        <div class="wz" id="menu5"><a href="back.jsp">后台管理</a></div>
        </c:if>
        <c:if test="${sessionScope.loginUser.roleId==8}">
        <div class="wz" id="menu5"><a href="back.jsp">后台管理</a></div>
        </c:if>
        </c:if>
        -->
     </div> 
     
     <script type="text/javascript">
  
 	$(function(){
		$.post("getMenuParent.action",null,function(data){
			var menus=data.menuList;
			var menu="";
			var type="<option value=''>请选择</option>";
			for(var i=0;i<menus.length;i++){
				menu+="<div class=\"wz\" id=\"menu2"+i+"\"><a href=\"productListByFront.action?menu=2"+i+"&typeName="+menus[i].id+"\">"+menus[i].name+"</a></div>";
				type+="<option value=\""+menus[i].id+"\">"+menus[i].name+"</option>";
			}
			$("#menuList").html(menu);
			$("#productType").html(type);
			if('${menu}'!=''){
   			$("#menu${menu}").attr("class","navbg");
	   		}else{
   			 $("#menu0").attr("class","navbg");
	   		}
	   		$("#productType").val('${typeName}');
		},"json");
	
	});
	
     </script>     