<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><f:applicationName/> <f:version/></title>
<w:style src="/themes/inet/css/style.jsp"/>
<w:style src="/themes/inet/css/easyui.jsp" />
<w:style src="/themes/inet/css/icon.jsp" />
<w:style/>
<w:script src="/js/jquery.js"/>
<w:script src="/js/jquery.easyui.js"/>
<w:script src="/js/jquery.framework.js"/>
<w:script src="/js/jquery.validate.js"/>
<w:script src="/js/jquery.metadata.js"/>
<w:script src="/js/jquery.validate.snappy.js"/>
<w:script src="/themes/inet/js/WdatePicker.js"/>
<w:script src="/themes/inet/js/iframeresize.js"/>
</head>
<body  style="margin-left:8px;margin-top:8px;height:98%;">
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" >
<tr id="functionName" style="display:none">
	<td><h1 class="skip_title"><img src="<w:root/>/themes/inet/images/tag_orange.gif" /> <w:name/></h1></td>
</tr>
</table>
<w:view/>
<script type="text/javascript">
$(function(){
	//fixFrameSize();
});
</script>
</body>
<w:script/>

</html>
