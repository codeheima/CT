<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><f:applicationName/><f:version/></title>
<w:style src="/themes/inet/css/style.jsp"/>
<style>
.errorArea{
	width:99%;
	border:1px solid #6593cf;
	margin-top:8px;
}
.errorArea th{
	font-size:14px;
	font-weight:bold;
	line-height:30px;
	color:#333333;
	text-align:left;
	padding-left:10px;
	border-bottom:1px solid #6593cf;
	background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>) 0 1px repeat-x;
}
.errorArea td{
	font-size:12px;
	padding:4px 4px 4px 4px;
	line-height:20px;
}
</style>
<w:script src="/js/jquery.js"/>
<w:script src="/js/jquery.easyui.js"/>
<w:script src="/themes/inet/js/iframeresize.js"/>
<script language=JavaScript>
$(function(){
	fixFrameSize();
})
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="errorArea" align="center">
	<tr>	    				
		<th height="30px">系统发生错误</th>
	</tr>
	<tr>
		<td height="24">
			>> <w:exception/> <a href="javascript:showOrHideDetail()"/>查看详情</a>&nbsp;<a href="javascript:history.back()"/>返回</a>
		</td>
	</tr>	
	<tr>
	<td>
		<textarea id="detailContainer" rows="20" style="width:100%;font-size:12px;display:none" readonly><w:exception type="detail"/></textarea>
	</td>
	</tr>							    											
</table>	
</body>
<script>
function showOrHideDetail(){
	if($("#detailContainer").is(":hidden")){
		$("#detailContainer").show();
	}else{
		$("#detailContainer").hide();
	}
}
</script>
</html>
