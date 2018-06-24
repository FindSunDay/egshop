<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

<script type="text/javascript">
	$(function(){
		$.post("getSellProductsTop.action",null,function(data){
			var news=data.newsList;
			var values="";
			for(var i=0;i<news.length;i++){
				var j=i+1;
				values+="<div class=\"rxsp_1\">"
				values+="<div class=\"rxsp_1_2\"><a href=\"productLook.action?id="+news[i].id+"\" tagert='_blank'>"+ j +"、"+news[i].title+"</a></div></div>"
			}
			$("#newsList").html(values);
		},"json");
	
	});
</script>
<div class="Four" style="width:210px">
	<!-- 热销商品-->
  <div class="rxsp">
    <div class="wzbt_3">销量排行榜</div>
    <span id="newsList"></span>
  </div>
 </div>