<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<style>
body{
	margin:5px 0;
	height:100%;
	padding:0;
	margin-left:-30px\0;
}
ul{
	list-style:none;
	padding;0;
	margin:0 0 0 15px;
	font-size:14px;
}
ul span{
	color:#082a69;
	background:#e9f4fd;
	display:block;
	width:90%;
	height:24px;
	line-height:24px;
	padding-left:5px;
	margin:5px 0;
	background:url(<w:root/>/themes/inet/images/menu_bg.png) right top no-repeat;
	font-weight:bold;
}
li{	
	width:80%;
	margin-left:10px;
	font-size:12px;
	height:20px;
	line-height:20px;	
}
a{
	color:#333;
	text-decoration:none;
	display:block;
	padding-left:15px;
	margin:5px 0;
	border:1px solid #fff;
	background:url(<w:root/>/themes/inet/images/menu_bg.png) 0 -38px no-repeat;
}
a:hover{
	border:1px solid #f1aa64;
	background:url(<w:root/>/themes/inet/images/menu_bg.png) 0 -68px no-repeat;
	background-color:#fff6e5;
	color:#333;
	font-weight:bold;
}
</style>
<script type="text/javascript" defer="true">
function onSelectedMenu(mid,id,name,url){
	parent.onSelectedFunctionName(mid,id,name,url);
}
</script>
<div>
<w:iterator id="module" name="SYS_MODULES">
	<w:if test="${module.permitted}">
		<ul><span>${module.name}</span>		
		<w:iterator id="menu" name="module" property="menus">
		<w:iterator id="item" name="menu" property="items">
		<w:if test="${item.permitted}">
			<li><a onclick="onSelectedMenu('${module.id}','${item.id}','${item.name}','<w:root/>${item.url}')" href="#">${item.name}</a></li>
		</w:if>
		</w:iterator>
		</w:iterator>
		</ul>
	</w:if>
</w:iterator>	
</div>	
