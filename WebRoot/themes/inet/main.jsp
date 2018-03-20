<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><f:applicationName/> <f:version/></title>
<script type="text/javascript">
function relogin(){
	document.location="<w:url src="/login.do"/>";
}
function reInitlization(){
	document.location.reload();
}
document.location="<w:url src="/resCurrent.ctl.do"/>";
</script>
</head>
<frameset id="inetframe" rows="140,*,0" cols="*" frameborder="no" border="0" framespacing="0">
	<frame src="<w:url src="/main.top.do"/>" name="topFrame" scrolling="no" noresize >
   	<frame src="<w:url src="/main.index.do"/>" name="mainFrame" scrolling="yes">
   	<frame src="<w:url src="/themes/inet/footer.jsp"/>" name="footerFrame" scrolling="no" noresize>
</frameset>
<noframes><body>
</body></noframes>
</html>
