<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<title>易购网站</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/home.css" rel="stylesheet" type="text/css" />
<link href="style/sppd.css" rel="stylesheet" type="text/css" />
</head>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript">
      $(function(){
       var values="";
      	$.post("productListByType.action",null,function(data){
      		var menuList = data.menuList;
			var productList=data.productList;
			for(var i=0;i<menuList.length;i++){
				values+="<div class=\"ff\"><div class=\"ff_1\"><div class=\"wzbt\">"+(i+1)+"F&nbsp;&nbsp;<span>"+menuList[i].name+"首发新品</span></div>";
				values+="<div class=\"more\"></div></div>";
				values+="<div class=\"ff_2_right\">";
				for(var m=0;m<productList.length;m++){
					if(menuList[i].id==productList[m].proType.id){
					values+="<div class=\"shangpin_2\"><a href=\"productLook.action?id="+productList[m].id+"\"><img src=\""+productList[m].image+"\" width='160px' height='160px'/></a><br/>";
       				values+="<a href=\"productLook.action?id="+productList[m].id+"\">"+productList[m].title+"</a><br /><del>原价￥"+productList[m].oldPrice+"</del><br/><span >折后价￥"+productList[m].newPrice+"</span></div>";
    				}
				}
				values+="</div></div></div>";
			}
			$("#productList").html(values);
      	},"json");
      });
    
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
<!-- top2-->
<div class="fcpd">
	<!--全部商品分类-->
  <div class="qbspfl_1">
  <jsp:include page="news.jsp"></jsp:include>
  </div>
  
<div class="sp_banner">
<jsp:include page="image.jsp"></jsp:include>
</div>

<div class="zxsj">
<jsp:include page="zxsj.jsp"></jsp:include>
</div>



</div>
<!-- 1F -->
<span id="productList">

</span>
<!-- width:960px -->
<div style="width:960px; height:auto; margin:10px auto 0 auto;">
<jsp:include page="foot.jsp"></jsp:include>
</div>
</body>
</html>
