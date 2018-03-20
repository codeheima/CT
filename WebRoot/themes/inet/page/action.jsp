<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title><f:applicationName /> <f:version />
		</title>
		<w:style src="/themes/inet/css/style.jsp" />
		<w:style src="/themes/inet/css/easyui.jsp" />
		<w:style src="/themes/inet/css/icon.jsp" />
		<w:style />
		<w:script src="/js/jquery.js" />
		<w:script src="/js/jquery.easyui.js" />
		<w:script src="/js/jquery.framework.js" />
		<w:script src="/js/jquery.validate.js" />
		<w:script src="/js/jquery.metadata.js" />
		<w:script src="/js/jquery.validate.snappy.js" />
		<w:script src="/themes/inet/js/WdatePicker.js" />
		<w:script src="/themes/inet/js/iframeresize.js" />
		<w:script />
	</head>
	<body style="margin-left: 8px; margin-top: 8px; margin-right: 8px;">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
			<tr id="functionName" style="display: none">
				<td>
					<h1 class="skip_title">
						<img src="<w:root/>/themes/inet/images/tag_orange.gif" />
						<w:name />
					</h1>
				</td>
			</tr>
			<tr>
				<td>
					<w:messageExist>
						<span class="messageContainer"><w:message />
						</span>
					</w:messageExist>
					<w:errorExist>
						<span id="validateGroupErrorContainer" class="errorContainer"><w:error />
						</span>
					</w:errorExist>
					<w:form>
						<e:hidden name="action" />
						<e:hidden name="method" />
						<w:areaExist id="detail">
							<w:area id="hidden" />
						</w:areaExist>
					</w:form>
				</td>
			</tr>
		</table>
	</body>
</html>
