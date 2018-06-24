<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <script type="text/javascript">
	$(function(){
		$.post("getNewProductTop.action",null,function(data){
			var list=data.productList;
			var info="";
			for(var i=0;i<list.length;i++){
				info+="<div class=\"shangpin_1\"><a href=\"productLook.action?id="+list[i].id+"\"><img src=\""+list[i].image+"\" width='120px' height='100px'></a><br/>";
				info+="<a href=\"productLook.action?id="+list[i].id+"\">"+list[i].title+"</a><br/><del>原价￥"+list[i].oldPrice+"</del><br/><span >折后价￥"+list[i].newPrice+"</span></div>";
			}
		$("#zxsj").html(info);
		},"json");
	});
</script>
<div style=" float:left; width:735px; height:42px;"> <div class="wzbt">热销<span>商品</span></div> </div>
   <span id="zxsj">

   </span> 