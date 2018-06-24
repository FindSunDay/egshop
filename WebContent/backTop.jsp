<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<STYLE type=text/css> 
*{
	FONT-SIZE: 12px; COLOR: white
}
#logo {
	COLOR: white
}
#logo A {
	COLOR: white
}
FORM {
	MARGIN: 0px
}
</STYLE>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<SCRIPT src="js/Clock.js" type=text/javascript></SCRIPT>
<script type="text/javascript" src="js/openwindow.js"></script>
<script type="text/javascript">
	function tuiChu(){
		window.parent.close();
	}

</script>
</HEAD>
<BODY style="BACKGROUND-IMAGE: url(images/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x" onload="countMessages()" >
  <DIV id=logo style="BACKGROUND-IMAGE: url(); BACKGROUND-REPEAT: no-repeat">
    <DIV style="PADDING-RIGHT: 50px; BACKGROUND-POSITION: right 50%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(images/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px; TEXT-ALIGN: right">
<IMG src="images/menu_seprator.gif" align=absMiddle> <A id=HyperLink2 href="loginOut.jsp">返回首页</A> 
</DIV>
    <DIV style="DISPLAY: block; HEIGHT: 54px"></DIV>
    <DIV style="BACKGROUND-IMAGE: url(images/q11w); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
      <TABLE cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
          <TR>
            <TD>
              <DIV><IMG src="images/nav_pre.gif" align=absMiddle> 欢迎 [${sessionScope.loginUser.name}] 光临&nbsp;&nbsp;&nbsp;所属角色： ${sessionScope.userRole.name}</DIV>
            </TD>
            <TD align=right width="70%">
            <SPAN style="PADDING-RIGHT: 50px">
            <A  href="javascript:history.go(-1);"><IMG src="images/nav_back.gif"  align=absMiddle border=0>后退</A> 
            <A href="javascript:history.go(1);"><IMG src="images/nav_forward.gif" align=absMiddle border=0>前进</A> 
            <A href="javascript:alert('已成功备份到“C:\\backup.sql”！');">数据备份</A> 
             <IMG  src="images/menu_seprator.gif" align=absMiddle> <SPAN  id=clock></SPAN></SPAN></TD>
          </TR>
        </TBODY>
      </TABLE>
    </DIV>
  </DIV>
  <SCRIPT type=text/javascript>
    var clock = new Clock();
    clock.display(document.getElementById("clock"));
</SCRIPT>
</BODY>
</html>