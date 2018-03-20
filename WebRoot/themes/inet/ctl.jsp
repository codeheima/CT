<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据</title>
<style type="text/css">
	.my-a{
		margin-top:20px;
	}

</style>


<%@include file="/themes/inet/page/ConstantsPage.jsp"%>

<script type="text/javascript">

</script>
</head>
<body class="bodybg" style="padding-top:20px;padding-left:20px;">
	<div>
	
		<a href="<w:url src="/resCurrent.query.do?action=query"/>" target="blank" class="my-a">日志监控</a>
		
		<br></br>
				
		
		<a href="<w:url src="/task/dataImChat.query.do?action=query"/>" target="blank" class="my-a">群聊查询</a>
		
		<br></br>
		
		<a href="<w:url src="/task/resSend.query.do?action=query"/>" target="blank" class="my-a">下发任务</a>
		
		<br></br>
		<a href="<w:url src="/ctParam.query.do?action=query"/>" target="blank" class="my-a">事由类型管理</a>
		
		

		
	</div>
<w:form/>
</body>
<w:script/>
</html>