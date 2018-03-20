<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%response.setContentType("text/css");%>

@charset "utf-8";
/* CSS Document */

/* Reset *
====================================================================*/
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,p,blockquote,table,tr,th,td,embed,object,em,hr,span{margin:0;padding:0;}
table{border-collapse:collapse;border-spacing:0;}
fieldset,img,abbr{border:0;}
address,caption,cite,code,dfn,em,h1,h2,h3,h4,h5,h6,strong,th,var{font-style:normal;font-weight:normal;}
ul{list-style:none;}
caption,th {text-align:left;}
div { text-align: left; vertical-align: top; }
q:before,q:after{content:'';}
a,ins{text-decoration:none;}
strong { font-weight: bold; }
cite { display: block; font-size: 12px; font-style: italic; text-align: right; }
textarea{ overflow: auto}

/* Global Classes Style
=====================================================================*/
.distext { display:none; }
.clearboth { clear:both;}
.clearleft { clear:left; }
.clearright { clear:right; }

/* Global Elements Style
=====================================================================*/
html {overflow-x:auto; height:100%;}
	/* fixes MSIE scrollbar bug DO NOT REMOVE, has no effect in Mozilla, or Opera */
img{border:0;}
/*@purpose To enable resizing for IE */
/*@branch For IE6-Win, IE7-Win */
input, textarea, select, optgroup, option{font-family: inherit; font-size: inherit; font-style: inherit; font-weight: inherit;}
input[type="text"] , input[type="password"] , input[type="email"] , input[type="url"] {border:1px solid #999;background:#fff;}
.checkboxbug{_margin-left:-4px;+margin-left:-4px;}
input{margin:0 2px 0 0;color:#333;padding:0 3px;} 
div.rightPart {background:#e9f2fe;}
div.rightPart:after {content:".";clear:both;height:0;display:block;visibility:hidden;}

/* Global Links Style
=====================================================================*/
a {
	margin:0px;
	padding:0px;
	color:#666;
}
a:hover,a:active{text-decoration:underline;}

/* List Elements Style
=====================================================================*/

ul li 
{
	margin:0;
	padding:0;
	list-style: none;
}

li a {
	padding:0;margin:0;
}

/* Global *
=====================================================================*/
body, p, th, td, li
{
	font-family:Tahoma, "宋体", Helvetica, Arial, sans-serif;
	line-height:22px;
}
.fontshallow{color:#999;}
.fontgray{color:#666;}
.fontblue{color:#399FD6;}
.fontblack{color:#333;}
.fontwhite{color:#fff;}
.fontred{color:#f00;}
.fontyorg{color:#f60;}
.fontdarkred{color:#c00;}
.ver_center{vertical-align:middle;}
.ver_top{vertical-align:top;}
.textcenter{text-align:center;}
.textleft{text-align:left;}
.textright{text-align:right;}
.font12{font-size:12px;}
.font14{font-size:14px;}
.block{display:block;}
.left{float:left;}
.right{float:right;}
.clearfix:after {
	content: ".";
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
}
.clearfix {
	display: inline-block;
}
html[xmlns] .clearfix {
	display: block;
}
* html .clearfix {
	height: 1%;
}




/* login *
=====================================================================*/
body{background:url(<w:url src="/themes/inet/images/login-bg.jpg"/>) left top repeat-x;}
.login_top{
	width:100%;
	background:url(<w:url src="/themes/inet/images/login-bg.jpg"/>) left top repeat;
	height:600px;
	text-align:center;}
	/* */
.login_back{
	background:url(<w:url src="/themes/inet/images/login-pic.jpg"/>) left top no-repeat;
	width:1000px;
	height:600px; 
	
	margin:0 auto;
	position:relative;}

.login_tab1{width:360px; height:75px; font-size:12px; color:#333; line-height:36px; font-weight:bold; 
            position:absolute; top:290px; left:320px;}	

.input01{
	width:220px;
	height:26px;
	line-height:26px;
	border:#96a3b6 solid 1px;
	vertical-align:middle;}
	
.login_btn01{
	width:68px;
	height:62px;
	
	border:0px;
	margin-left:10px;
	display:block;
	cursor:pointer;}
	/* background:url(<w:url src="/themes/inet/images/login-btn01.png"/>) no-repeat;
a.login_btn01:hover {background:url(<w:url src="/themes/inet/images/login-btn02.png"/>) no-repeat;} */

.login_bottom{
	background:#FFF;
	width:100%;
	height:94px;
	padding-top:28px;
	text-align:center;
	font-size:12px;
	color:#333;}
