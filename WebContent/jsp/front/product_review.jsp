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
<style type="text/css">
body,div,ul,li,p{margin:0;padding:0;}
body{color:#666;font:12px/1.5 Arial;}
ul{list-style-type:none;}
#star{position:relative;margin:10px auto;}
#star ul,#star span{float:left;display:inline;height:19px;line-height:19px;}
#star ul{margin:0 10px;}
#star li{float:left;width:24px;cursor:pointer;text-indent:-9999px;background:url(images/star.png) no-repeat;}
#star strong{color:#f60;padding-left:10px;}
#star li.on{background-position:0 -28px;}
#star p{position:absolute;top:20px;width:159px;height:60px;display:none;background:url(images/icon.gif) no-repeat;padding:7px 10px 0;}
#star p em{color:#f60;display:block;font-style:normal;}
</style>
</head>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	window.onload = function ()
{
	var oStar = document.getElementById("star");
	var aLi = oStar.getElementsByTagName("li");
	var oUl = oStar.getElementsByTagName("ul")[0];
	var oSpan = oStar.getElementsByTagName("span")[0];
	var oP = oStar.getElementsByTagName("p")[0];
	var i = iScore = iStar = 0;
	var aMsg = [
				"很不满意|差得太离谱，与卖家描述的严重不符，非常不满",
				"不满意|部分有破损，与卖家描述的不符，不满意",
				"一般|质量一般，没有卖家描述的那么好",
				"满意|质量不错，与卖家描述的基本一致，还是挺满意的",
				"非常满意|质量非常好，与卖家描述的完全一致，非常满意"
				]
	
	for (i = 1; i <= aLi.length; i++)
	{
		aLi[i - 1].index = i;
		//鼠标移过显示分数
		aLi[i - 1].onmouseover = function ()
		{
			fnPoint(this.index);
			//浮动层显示
			oP.style.display = "block";
			//计算浮动层位置
			oP.style.left = oUl.offsetLeft + this.index * this.offsetWidth - 104 + "px";
			//匹配浮动层文字内容
			oP.innerHTML = "<em><b>" + this.index + "</b> 分 " + aMsg[this.index - 1].match(/(.+)\|/)[1] + "</em>" + aMsg[this.index - 1].match(/\|(.+)/)[1]
		};
		//鼠标离开后恢复上次评分
		aLi[i - 1].onmouseout = function ()
		{
			fnPoint();
			//关闭浮动层
			oP.style.display = "none"
		};
		//点击后进行评分处理
		aLi[i - 1].onclick = function ()
		{
			iStar = this.index;
			oP.style.display = "none";
			oSpan.innerHTML = "<strong>" + (this.index) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"
			$("#content").val(aMsg[this.index - 1].match(/\|(.+)/)[1]);
		}
	}
	//评分处理

	function fnPoint(iArg)
	{
		//分数赋值
		iScore = iArg || iStar;
		for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : "";	
	}
};

function saveReviews(){
	var productId=$("#productId").val();
	var content=$("#content").val();
	if(content==''){
		alert("评价内容不能为空！");
		return;
	}
	 var param={"id":productId,"reviews.level":iScore,"reviews.content":content};
	 $.post("saveReviews.action",param,function(data){
	 	if(data=='success'){
	 		alert("评价成功！");
	 		window.location.href="myOrderList.action?menu=3";
	 	}else{
	 		alert('评价失败！');
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

<!-- top5-->
<div class="log">
<div class="hkuang">
  <div class="gwc_2">
    <div class="gwc_4">
        <table width="910" border="0" cellpadding="0" cellspacing="1" bgcolor="#E3E3E3">
      <tr>
        <td  bgcolor="#FFFFFF">商品名称 ：</td>
        <td  bgcolor="#FFFFFF">${product.title}</td>
      </tr>
       <tr>
        <td  bgcolor="#FFFFFF">商品评分 ：</td>
        <td bgcolor="#FFFFFF">
			<div id="star">
		    <ul>
		        <li><a href="javascript:;">1</a></li>
		        <li><a href="javascript:;">2</a></li>
		        <li><a href="javascript:;">3</a></li>
		        <li><a href="javascript:;">4</a></li>
		        <li><a href="javascript:;">5</a></li>
		    </ul>
		    <span></span>
		    <p></p>
			</div>
	</td>
      </tr>
      <tr>
        <td  bgcolor="#FFFFFF">商品评价 ：</td>
        <td bgcolor="#FFFFFF">
        	<textarea rows="4" cols="50" id="content" ></textarea><input type="button" onclick="saveReviews()" value="评价">
        </td>
      </tr>
    </table>
        </div>
  </div>
</div>
</div>

<div style="width:960px; height:auto; margin:10px auto 0 auto;">
	<jsp:include page="../../foot.jsp"></jsp:include>
</div>

</body>
</html>
