<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
String url = (String)request.getAttribute("FORWARD_URL");
Integer delaySet = (Integer)request.getAttribute("FORWARD_DELAY");
int delay = 0;
if(delaySet == null){
	delay = -1;
}else{
	delay = delaySet.intValue();
}
if(delay==0)
	delay = 2;

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%if(url!=null && delay>0){%>
<meta http-equiv="refresh" content="<%=delay%>;URL=<%=url%>">
<%}%>
<title><f:applicationName/> <f:version/></title>
<w:script src="/js/jquery.js"/>
<w:script src="/js/jquery.easyui.js"/>
<w:script src="/themes/inet/js/iframeresize.js"/>
<script language=JavaScript>
$(function(){
	fixFrameSize();
})
</script>
<w:style src="/themes/inet/css/style.jsp"/>
<style>
.messageArea{
	width:50%;
	border:1px solid #5174ae;
}
.messageArea th{
	font-size:14px;
	font-weight:bold;
	line-height:28px;
	color:#ffffff;
	text-align:left;
	padding-left:10px;
	background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>) repeat-x;
}
.messageArea td{
	font-size:12px;
	padding:10px 10px 10px 10px;
	line-height:20px;
}
</style>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="messageArea" style="margin-top:100px" align="center">
	<tr>	    				
		<th height="28">&nbsp;&nbsp;&nbsp;提示消息</th>
	</tr>
	<tr>
		<td height="40">
		<%if(url!=null && delay>0){%>
		  	<%=delay%>秒后自动跳转，立即跳转请点击<a href="<%=url%>">这里</a>
		<%}else if(url!=null){%>
			点击<a href="<%=url%>">这里</a>跳转
		<%}%>			
		</td>
	</tr>	
	<tr>
		<td>
		<w:message/>			
		</td>
	</tr>							    											
</table>	
</body>
</html>
