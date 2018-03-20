<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><f:applicationName/> <f:version/></title>
<w:style src="/themes/inet/css/login.jsp"/>
<w:style src="/themes/inet/css/style.jsp"/>
<w:style/>
<w:script src="/js/jquery.js"/>
<w:script src="/js/jquery.easyui.js"/>
<w:script src="/js/jquery.framework.js"/>
<w:script src="/js/jquery.validate.js"/>
<w:script src="/js/jquery.metadata.js"/>
<w:script src="/js/jquery.validate.snappy.js"/>
<w:script src="/themes/inet/js/WdatePicker.js"/>
</head>
<body>
<div class="login_top">
<w:formDefine>
<e:hidden name="action" value="login"/>
<e:hidden name="mac"/>
<w:area id="hidden"/>
    <div class="login_back">
        <table  cellpadding="0" cellspacing="0" class="login_tab1">
            <tr>
                <td>账 号：</td>
                <td><e:text id="userid" required="true" description="用户名" theme="input01"/></td>
                <td rowspan="3"><a class="login_btn01" onclick="javascript:onLogin()">
                <img src='<w:url src="/themes/inet/images/login-btn01.png"/>' width="70" height="66" 
                onmouseover="src='<w:url src="/themes/inet/images/login-btn02.png"/>'" 
                onmouseout="src='<w:url src="/themes/inet/images/login-btn01.png"/>'" />
                </a></td>
            </tr>
            <tr>
                <td>密 码：</td>
                <td><e:password id="password" required="true" description="密码" theme="input01"/></td>
            </tr>
            <tr>
            	<td>全  屏：</td>
            	<td><e:check id="fullScreen" value="1"/></td>
            </tr>
            <tr>
            	<td colspan="3" style="color:red"><div align="center" id="validateGroupErrorContainer" class="validateGroupErrorMessage"><w:error/></div></td>
            </tr>            
        </table>
    </div>
</w:formDefine>
</div>
<div class="login_bottom" style="display:none">
Copyright © 2011 ... All Rights Reserved. 
  <p>技术支持 ...
</div>
</body>
<script language="javascript">
$(function(){
	if($("#userid").val()=="")
		$("#userid").focus();
	else
		$("#password").focus();

	$("#password").val("");

	if(window.name.indexOf('xxn')!=-1){
		$("#fullScreen").attr("disabled","true");
		$("#fullScreen").attr("checked","true");
		$("form").append("<input type='hidden' name='fullScreen' value='1'/>");
	}
})
function onLogin(){
	if($("form").validateForm()){
		document.forms[0].submit();
	}
}
function onReset(){
	$("#userid").val("");
	$("#password").val("");
}
$(document).keydown(function(){
	if(event.keyCode==13){
		onLogin();
	}
});	
</script>
<w:script/>
</html>
