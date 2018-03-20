<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><f:applicationName/> <f:version/></title>
<w:style src="/themes/inet/css/main.jsp"/>
<w:style src="/themes/inet/css/style.jsp"/>
<w:style/>
<w:script src="/js/jquery.js"/>
<w:script src="/js/jquery.easyui.js"/>
<w:script src="/js/jquery.framework.js"/>
<w:script src="/js/jquery.validate.js"/>
<w:script src="/js/jquery.metadata.js"/>
<w:script src="/js/jquery.validate.snappy.js"/>
<w:script src="/themes/inet/js/WdatePicker.js"/>
<script type="text/javascript">
function relogin(){
	document.location="<w:url src="/login.do"/>";
}
function reInitlization(){
	document.location.reload();
}
$(function(){
	$(document).initlizationSystem("<w:url src="/monitor.do"/>");
	var current = $(".nav a:first");
	current.addClass("choose");
	$(".itemnav").hide();
	$(".itemnav[module="+current.attr("name")+"]").show();
	$(".nav a").click(function(){
		$(".nav a").removeClass("choose");
		$(this).addClass("choose");
		$(".itemnav").hide();
		$(".itemnav[module="+$(this).attr("name")+"]").show();
	});
})
</script>
</head>
<body class="bodybg">
<w:form/>
</body>
<w:script/>
</html>