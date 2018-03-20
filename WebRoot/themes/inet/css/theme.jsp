<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%response.setContentType("text/css");%>
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	FONT-SIZE: 12px; FONT-FAMILY: Verdana, 宋体;
	background-color: #ffffff;
	SCROLLBAR-FACE-COLOR: #d5e0ec;
	SCROLLBAR-HIGHLIGHT-COLOR: #d5e0ec;
	SCROLLBAR-SHADOW-COLOR: #d5e0ec;
	SCROLLBAR-3DLIGHT-COLOR: #ffffff;
	SCROLLBAR-ARROW-COLOR: #6f8aaf;
	SCROLLBAR-TRACK-COLOR: #ebeff4;
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
}

a{
	color:#026aa7;
}

.function_head_name {
    font-family:"宋体";
	font-size:14px;
	font-weight:bold;
	color:#666666;
	line-height:26px;
	padding:5px 0 0 5px;
}
.function_head_name a{
    color:#666;
    text-decoration:none;
}
.function_head_name a:hover{
    color:#ff9900;
    text-decoration:underline;
}


.formTable{
	width:100%;
	border:1px solid #d3d3d3;
	margin-bottom:-1px;
	border-collapse:collapse;
	margin-top:0px;
	word-break:break-all;
	word-wrap:break-word;
}
.formTable .splittd{
	font-size:14px;
	line-height:25px;
	color:#FFFFFF;
	text-align:left;
	padding-left:10px;
	text-decoration:none;
	height:25px;
	background-color:#249fd8;
	word-break:break-all;
	word-wrap:break-word;
}

.formTable .labeltd{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	border:1px solid #d3d3d3;
	padding:0px;
	text-decoration:none;
	background-color:#efefef;
	text-align:center;
	word-break:break-all;
	word-wrap:break-word;
}

.formTable .labeltd2{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	border:1px solid #d3d3d3;
	padding:0px;
	text-decoration:none;
	background-color:#FFFFA0;
	text-align:center;
	word-break:break-all;
	word-wrap:break-word;
}

.formTable td{
	border:1px solid #d3d3d3;
	font-size:12px;
	line-height:25px;
	padding:0px;
	word-break:break-all;
	word-wrap:break-word;
}

.formTable .columntd2{
	border:1px solid #d3d3d3;
	font-size:12px;
	line-height:25px;
	padding:0px;
	background-color:#FFFFD0;
	word-break:break-all;
	word-wrap:break-word;
}

.formListTable{
	width:100%;
	border:1px solid #d3d3d3;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word;
}

.formListTable th{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	text-align:left;
	border:1px solid #d3d3d3;
	padding:0px 0px;
	text-decoration:none;
	background-color:#efefef;
	word-break:break-all;
	word-wrap:break-word;
}

.formListTable .splittd{
	font-size:14px;
	line-height:25px;
	color:#394459;
	text-align:left;
	border-left:0px;
	border-right:1px solid #d3d3d3;
	border-top:0px;
	border-bottom:0px;
	padding-left:25px;
	text-decoration:none;
	background-color:#DDEEFF;
	background:url(<w:url src="/themes/inet/images_integration/table_head_bg.jpg"/>) repeat-x;
	word-break:break-all;
	word-wrap:break-word;
}

.formListTable .labeltd{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	border:1px solid #d3d3d3;
	padding:0px 1px;
	text-decoration:none;
	background-color:#efefef;
	text-align:center;
	word-break:break-all;
	word-wrap:break-word;
}

.formListTable td{
	border:1px solid #d3d3d3;
	font-size:12px;
	line-height:25px;
	word-break:break-all;
	word-wrap:break-word;
}

.formListTable .actiontd{
	text-align:center;
}

.formListTable .numbertd{
	text-align:right;
}


.condicationTable{
	width:100%;
	border:1px solid #d3d3d3;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word;
}

.condicationTable .labeltd{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	border:1px solid #d3d3d3;
	padding:0px 1px;
	text-decoration:none;
	background-color:#efefef;
	text-align:center;
	word-break:break-all;
	word-wrap:break-word;
}

.condicationTable td{
	border:1px solid #d3d3d3;
	font-size:12px;
	line-height:25px;
	word-break:break-all;
	word-wrap:break-word;
}

.resultTable{
	width:100%;
	border:1px solid #d3d3d3;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word;
}

.resultTable th.header {
	BACKGROUND-POSITION: right center;
	background-image: url(<w:url src="/themes/inet/images_integration/bg.gif"/>);
	CURSOR: pointer;
	BACKGROUND-REPEAT: no-repeat
}

.resultTable th.headerSortUp {
	background-image: url(<w:url src="/themes/inet/images_integration/asc.gif"/>);
	background-color: #efece3;
}

.resultTable th.headerSortDown {
	background-image: url(<w:url src="/themes/inet/images_integration/desc.gif"/>);
	background-color: #efece3;
}

.resultTable th{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	text-align:left;
	vertical-align:middle;
	border:1px solid #d3d3d3;
	padding:0px 0px;
	text-decoration:none;
	background-color:#f2f2f2;
	word-break:break-all;
	word-wrap:break-word;
}

.resultTable td{
	border:1px solid #d3d3d3;
	font-size:12px;
	line-height:25px;
	word-break:break-all;
	word-wrap:break-word;
	vertical-align:middle;
}

.resultTable .numbertd{
	text-align:right;
}

.resultTable .actiontd{
	text-align:center;
}

.hover{
	background-color:#EEF1F5;
}

.oddrow{
	background-color:#ffffff;
}

.evenrow{
	background-color:#b3cdf0;
}

.innerTable{
	width:100%;
	margin-left:-2px;
	margin-bottom:-3px;
	border:0px;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word;
}

.innerTable th{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	text-align:left;
	border-left:1px solid #d3d3d3;
	border-top:0px;
	border-bottom:1px solid #d3d3d3;
	border-right:0px;
	padding:0px 0px;
	text-decoration:none;
	background-color:#D4E1F2;
	word-break:break-all;
	word-wrap:break-word;
}

.innerTable .labeltd{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	border-left:1px solid #d3d3d3;
	border-top:0px;
	border-bottom:1px solid #d3d3d3;
	border-right:0px;
	padding:0px 1px;
	text-decoration:none;
	background-color:#efefef;
	text-align:center;
	word-break:break-all;
	word-wrap:break-word;
}

.innerTable td{
	border-left:1px solid #d3d3d3;
	border-top:0px;
	border-bottom:1px solid #d3d3d3;
	border-right:0px;
	font-size:12px;
	line-height:25px;
	padding:0px;
	word-break:break-all;
	word-wrap:break-word;
}

.innerDataTable{
	width:100%;
	border:0px;
	margin-left:-2px;
	margin-bottom:-3px;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word;
}

.innerDataTable th{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	text-align:left;
	border-left:1px dashed #d3d3d3;
	border-top:0px;
	border-bottom:1px dashed #d3d3d3;
	border-right:0px;
	padding:0px 0px;
	text-decoration:none;
	background-color:#D4E1F2;
	word-break:break-all;
	word-wrap:break-word;
}

.innerDataTable .labeltd{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	border-left:1px dashed #d3d3d3;
	border-top:0px;
	border-bottom:1px dashed #d3d3d3;
	border-right:0px;
	text-decoration:none;
	background-color:#efefef;
	text-align:center;
	word-break:break-all;
	word-wrap:break-word;
}

.innerDataTable td{
	border-left:1px dashed #d3d3d3;
	border-top:0px;
	border-bottom:1px dashed #d3d3d3;
	border-right:0px;
	font-size:12px;
	line-height:25px;
	padding:0px;
	word-break:break-all;
	word-wrap:break-word;
}

.innerBlankTable{
	border:0px;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word;
}

.innerBlankTable td{
	border:0px;
	font-size:12px;
	word-break:break-all;
	word-wrap:break-word;
}

.blankTable{
	border:0px;
}

.blankTable td{
	border:0px;
	font-size:12px;
}

.control{
	width:100%;
	border:0px;
}

.control td{
	border:0px;
	font-size:12px;
	line-height:25px;
}

.numbertd{
	text-align:right;
}

.actiontd{
	text-align:center;
}

.tab {
	FONT-SIZE: 12px; FONT-FAMILY: Verdana, 宋体;
	width:99%;
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none
}

.tab li {
	FLOAT: left; MARGIN: 0px 0px 0px 1px; min-width: 84px
}

.tab ul a {
	DISPLAY: block; 
	BACKGROUND: url(<w:url src="/themes/inet/images_integration/tab.png"/>) no-repeat; 
	PADDING-TOP: 0px;
	PADDING-BOTTOM: 0px; 
	PADDING-LEFT: 0px; 
	PADDING-RIGHT: 5px; 
	FONT-WEIGHT: bold; 
	MARGIN: 1px 0px 0px; 
	COLOR: #27537a; 
	LINE-HEIGHT: 1.2; 
	WHITE-SPACE: nowrap; 
	TEXT-ALIGN: center; 
	TEXT-DECORATION: none; outline: 0;
	BACKGROUND-POSITION: 100% -100px;
	CURSOR: pointer
}

.tab ul a:hover {
	BACKGROUND-POSITION: 100% -150px
}
.tab ul a:unknown {
	BACKGROUND-POSITION: 100% -150px
}
.tab ul a:active {
	BACKGROUND-POSITION: 100% -150px
}


.tab ul a span{
	DISPLAY: block; 
	BACKGROUND: url(<w:url src="/themes/inet/images_integration/tab.png"/>) no-repeat; 
	PADDING-TOP: 6px; 
	PADDING-BOTTOM: 0px;
	PADDING-LEFT: 5px; 
	PADDING-RIGHT: 0px; 
	MIN-HEIGHT: 18px; 
	WIDTH: 64px; 
	HEIGHT: 18px; 
	min-width: 64px;
	BACKGROUND-POSITION: 0px 0px
}

.tab ul a:hover span {
	BACKGROUND-POSITION: 0px -50px
}
.tab ul a:unknown span {
	BACKGROUND-POSITION: 0px -50px
}
.tab ul a:active span {
	BACKGROUND-POSITION: 0px -50px
}

.tab ul a.selected {
	MARGIN-TOP: 0px; 
	Z-INDEX: 2; 
	COLOR: #000000; 
	POSITION: relative; 
	TOP: 1px;
	BACKGROUND-POSITION: 100% -150px
}

.tab ul a.selected span{
	PADDING-BOTTOM: 1px;
	BACKGROUND-POSITION: 0px -50px
}

.tab div {
	POSITION: relative;
	MARGIN-TOP: 21px; 
	BORDER-TOP: #97a5b0 1px solid; 
	PADDING-RIGHT: 0px; 
	PADDING-LEFT: 0px;
	PADDING-TOP: 2px
}

.required{
	color: #FF0000;
	font-size: 12px;
}

.text,.ip,.email,.password,.int,.numeric,.droplist,.autocomplete{
	WIDTH:150px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.bigtext,.bigip,.bigemail,.bigpassword,.bigint,.bignumeric,.bigdroplist{
	WIDTH:600px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.textarea{
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.bigtextarea{
	WIDTH:600px;
	HEIGHT: 100px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.select{
	WIDTH:150px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	margin-left:1px;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.bigselect{
	WIDTH:600px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	margin-left:1px;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.file{
	FONT-SIZE: 12px;
	COLOR: #666666;
	margin-left:1px;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.bigfile{
	WIDTH:600px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	margin-left:1px;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.date{
	WIDTH:130px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.bigdate{
	WIDTH:580px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.datebtn{
	WIDTH:20px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.checkContainer,.radioContainer{
	border:0px;
}

.checkContainer td,.radioContainer td{
	border:0px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
}

.button{
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #666666;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.gbutton{
	height:28px;
	margin: 0;
	padding-left: 3;
	background-image: url(<w:url src="/themes/inet/images_integration/button/l_b.gif"/>);
	background-repeat: no-repeat;
}

.gbutton span{
	margin: 0;
	padding: 0px;
	height:28px;
	background-image: url(<w:url src="/themes/inet/images_integration/button/m_b.gif"/>);
	background-repeat: repeat-x;
	line-height:15px;
}

.gbutton span img{
	margin-bottom: 4px;
	margin-left: 5px;
	border:0px;
}

.gbutton span a{
	padding-top: 6px;
	padding-bottom: 3px;
	padding-right: 2px;
	padding-left: 5px;
	height:28px;
	color:#666666;
	text-decoration: none;
	FONT-SIZE: 12px; 
	FONT-FAMILY: Verdana, 宋体;font-weight:bold;
}

.gbutton span a:hover{
    color:#000000;
}

.gbutton span span{
	margin: 0;
	padding: 0;
	height:28px;
	width:3px;
	background-image: url(<w:url src="/themes/inet/images_integration/button/r_b.gif"/>);
	background-repeat: no-repeat;
}


.gbutton2{
	height:28px;
	margin: 0;
	padding-left: 3;
	background-image: url(<w:url src="/themes/inet/images_integration/button/l_b2.gif"/>);
	background-repeat: no-repeat;
}
.gbutton2 span{
	margin: 0;
	padding: 0px;
	height:28px;
	background-image: url(<w:url src="/themes/inet/images_integration/button/m_b2.gif"/>);
	background-repeat: repeat-x;
	line-height:15px;
}
.gbutton2 span img{
	margin-bottom: 4px;
	margin-left: 5px;
	border:0px;
}
.gbutton2 span a{
	padding-top: 5px;
	padding-bottom: 3px;
	padding-right: 2px;
	padding-left: 5px;
	height:28px;
	color:#ffffff;
	text-decoration: none;
	FONT-SIZE: 12px; 
	FONT-FAMILY: Verdana, 宋体;font-weight:bold;
}
.gbutton2 span a:hover{
    color:#ffffff;
}
.gbutton2 span span{
	margin: 0;
	padding: 0;
	height:28px;
	width:4px;
	background-image: url(<w:url src="/themes/inet/images_integration/button/r_b2.gif"/>);
	background-repeat: no-repeat;
}


.onValidateShow
{
    background:url(<w:url src="/images/validator/onShow.gif"/>) no-repeat;
    height:23px;
	padding-left:25px;
	font-size: 12px;
	line-height:22px;
	vertical-align:middle;
}
.onValidateFocus
{
    background:url(<w:url src="/images/validator/onFocus.gif"/>) no-repeat;
    height:23px;
	padding-left:25px;
	font-size: 12px;
	line-height:22px;
	vertical-align:middle;
}
.onValidateError
{
    background:url(<w:url src="/images/validator/onError.gif"/>) no-repeat;
    height:23px;
	padding-left:25px;
	font-size: 12px;
	line-height:22px;
	vertical-align:middle;
}
.onValidateCorrect
{
    background:url(<w:url src="/images/validator/onCorrect.gif"/>) no-repeat;
	height:23px;
	padding-left:25px;
	font-size: 12px;
	line-height:22px;
	vertical-align:middle;
}
.onValidateLoad
{
    background:url(<w:url src="/images/validator/onLoad.gif"/>) no-repeat 3px 3px;
	height:23px;
	padding-left:25px;
	font-size: 12px;
	line-height:22px;
	vertical-align:middle;
}

.resultPage{
    font-family:"宋体";
	font-size:12px;
}
.resultPage .page{
	text-align:center;
	width:24px;
	height:18px;
	padding:0px;
	border-left:0px;
	border-top:0px;
	border-right:0px;
	border-bottom:1px solid #666666;
}

.messageContainer{
	font-family:"宋体";
	font-size:12px;
	line-height:22px;
}

.messageContainer .message{
	color:blue;
}

.messageContainer .error{
	color:red;
}

.messageContainer .warning{
	color:orange;
}

.errorContainer{
	font-family:"宋体";
	font-size:12px;
	color:red;
	line-height:22px;
}

.remark{
	font-family:"宋体";
	font-size:12px;
	color:#666666;
}

.tipContainer{
	overflow:auto;
	position:absolute;
	top:0px;
	left:0px;
	background:#eff5fa;
	filter:alpha(opacity=80);
	border:#0066CC double;
	margin:0 0 0 80px;
}

.tipContainer td{
	font-family:"宋体";
	font-size:12px;
	color:#666666;
}

#bottom{
	background:#57658A;
	height:40px;
	line-height:40px;
	vertical-align:middle;
	color:#FFF;
	text-align:center;
	margin-top:15px;
}

.resultTableSpecial{
	width:1300;
	border:1px solid #d3d3d3;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word;
}

.resultTableSpecial th.header {
	BACKGROUND-POSITION: right center;
	background-image: url(<w:url src="/themes/inet/images_integration/bg.gif"/>);
	CURSOR: pointer;
	BACKGROUND-REPEAT: no-repeat
}

.resultTableSpecial th.headerSortUp {
	background-image: url(<w:url src="/themes/inet/images_integration/asc.gif"/>);
	background-color: #b3cdf0 ;
}

.resultTableSpecial th.headerSortDown {
	background-image: url(<w:url src="/themes/inet/images_integration/desc.gif"/>);
	background-color: #b3cdf0 ;
}

.resultTableSpecial th{
	font-size:12px;
	font-weight:bold;
	line-height:25px;
	color: #666666;
	text-align:left;
	vertical-align:middle;
	border:1px solid #d3d3d3;
	padding:0px 0px;
	text-decoration:none;
	background-color:#efefef;
	word-break:break-all;
	word-wrap:break-word;
}

.resultTableSpecial td{
	border:1px solid #d3d3d3;
	font-size:12px;
	line-height:25px;
	word-break:break-all;
	word-wrap:break-word;
	vertical-align:middle;
}

.resultTableSpecial .numbertd{
	text-align:right;
}

.resultTableSpecial .actiontd{
	text-align:center;
}
