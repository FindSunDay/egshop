<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<STYLE type=text/css> 
body{
	FONT-SIZE: 12px;
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
</STYLE>
</HEAD>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
</STYLE>
<SCRIPT src="js/TreeNode.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/Tree.js" type=text/javascript></SCRIPT>
<BODY style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="images/bg_left_tl.gif"></TD>
      <TD style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">菜单管理</TD>
      <TD width=10><IMG src="images/bg_left_tr.gif"></TD>
    </TR>
    <TR>
      <TD style="BACKGROUND-IMAGE: url(images/bg_left_ls.gif)"></TD>
      <TD id=menuTree style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" valign=top>
      
      </TD>
      <TD style="BACKGROUND-IMAGE: url(images/bg_left_rs.gif)"></TD>
    </TR>
    <TR>
      <TD width=10><IMG src="images/bg_left_bl.gif"></TD>
      <TD style="BACKGROUND-IMAGE: url(images/bg_left_bc.gif)"></TD>
      <TD width=10><IMG src="images/bg_left_br.gif"></TD>
    </TR>
  </TBODY>
</TABLE>
<SCRIPT type=text/javascript>
var tree = null;
var root = new TreeNode('系统菜单');
$(function(){
		$.post("getMenuByRole.action",null,function(data){
			var html="";
			var list=data.menu;
			for(var i=0;i<list.length;i++){
			var node= new TreeNode(list[i].name, list[i].url, 'tree_node.gif', null, 'tree_node.gif', null);
				root.add(node);
			}
		tree = new Tree(root);
		tree.show('menuTree')
		},"json");
	});

</SCRIPT>
</BODY>
</html>