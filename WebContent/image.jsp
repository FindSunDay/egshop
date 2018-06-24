<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/image.css" rel="stylesheet" type="text/css" />
<div id="win">
	<ul id="picChange">
		<!-- <li><img  src="images/gg1.jpg" width="740px" title=""></li> -->

	</ul>
</div>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/picChange-0.3.2.js"></script>
<script type="text/javascript">
$(function(){
		$.post("getGGList.action",null,function(data){
			try {
				
			var ggs=data.ggList;
			var values="";
			for(var i=0;i<ggs.length;i++){
				var j=i+1; 
				/* values+="<li><img  src=\""+ggs[i].image+"\" width=\"740px\" title=\""+ggs[i].title+"\"></li>";  */
				values+="<a href=\"productLook.action?id="+ggs[i].title+"\" >";
				values+="<li><img  src=\""+ggs[i].image+"\" width=\"740px\" title=\""+ggs[i].title+"\"></li>"; 
				values+="</a>"
				
			}
			
			$("#picChange").html(values);
			//淡出效果
			$pic("picChange").picChange({changeStyle:"fade",time:200,interTime:5000});
			}catch(e){
				alert(e);
			}
		},"json");

	
});




</script>
