<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%response.setContentType("text/css");%>

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
.checkboxbug{_margin-left:-4px;+margin-left:-4px;}
input{margin:0 2px 0 0;color:#333;padding:0 3px;} 
div.rightPart {background:#e9f2fe;}
div.rightPart:after {content:".";clear:both;height:0;display:block;visibility:hidden;}
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
	color:#333;
	font-size:12px;
}
.bodybg{ height:28px;}
.fontshallow{color:#999;}
.fontgray{color:#666;}
.fontblack{color:#333;}
.fontwhite{color:#fff;}
.fontred{color:#f00;}
.font_imp{font-size:12px;font-weight:bold;color:#f00;}
.fontorg{color:#f60;}
.fontblue{color:#2e58a9;}
.ver_center{vertical-align:middle;}
.ver_top{vertical-align:top;}
.textcenter{text-align:center;}
.textleft{text-align:left;}
.textright{text-align:right;}
.block{display:block;}
.left{float:left;}
.right{float:right;}
.inputtext{width:75%;height:20px;line-height:20px;font-size:12px;}

/* 头部 *
=====================================================================*/
.status{padding:0;background:url(<w:url src="/themes/inet/images/top_bg.jpg"/>) repeat-x; height:77px;overflow:hidden;font-family:"宋体", Calibri;font-size:13px;}
.status_bg2{background:url(<w:url src="/themes/inet/images/logo_bg2.jpg"/>) right no-repeat; height:77px;text-align:right;}
.status_btn1{background:url(<w:url src="/themes/inet/images/icon_home.gif"/>) 0  no-repeat;padding-left:18px;position:absolute;right:250px;padding-top:4px;}
.status_btn2{background:url(<w:url src="/themes/inet/images/icon_logout.gif"/>) 0  no-repeat;padding-left:18px;position:absolute;right:188px;padding-top:4px;}
.status_btn3{background:url(<w:url src="/themes/inet/images/icon_exit.gif"/>)  0  no-repeat;padding-left:18px;position:absolute;right:128px;padding-top:4px;}
.status_btn4{background:url(<w:url src="/themes/inet/images/icon_help.gif"/>) 0  no-repeat;padding-left:18px;position:absolute;right:65px;padding-top:4px;}
.status_btn5{background:url(<w:url src="/themes/inet/images/icon_down.gif"/>) 0  no-repeat;padding-left:18px;position:absolute;right:10px;padding-top:4px;}
.status_btn6{background:url(<w:url src="/themes/inet/images/icon_welcome.gif"/>) 0 0 no-repeat;padding-left:24px;position:absolute;top:46px;right:15px;font-size:13px;}
.status_btn7{background:url(<w:url src="/themes/inet/images/icon_arrow_inout.gif"/>) 0 0 no-repeat;padding-left:22px;padding-top:4px;}
.status_btn8{background:url(<w:url src="/themes/inet/images/icon01.gif"/>) 0 0 no-repeat;padding-left:18px;padding-top:4px;}
.status_btn9{background:url(<w:url src="/themes/inet/images/set.gif"/>) 0 0 no-repeat;padding-left:22px;padding-top:4px;}
.nav{padding-left:10px;height:29px;line-height:29px;font-size:12px;font-weight:normal;background:url(<w:url src="/themes/inet/images/nav_bg.jpg"/>) 0 0 repeat-x;}
.nav .nav_module a{width:85px;display:block;float:left;font-size:12px;font-weight:normal;text-align:center;color:003295;}
.nav .nav_module a:hover{background:url(<w:url src="/themes/inet/images/nav_up_light_bg.jpg"/>) 3px 0 no-repeat;text-decoration:none;}
.nav .nav_module a.choose{background:url(<w:url src="/themes/inet/images/nav_up_light_bg.jpg"/>) 3px 0 no-repeat;color:#ffffff;}
.nav .nav_module a.choose:hover{background:url(<w:url src="/themes/inet/images/nav_up_light_bg.jpg"/>) 3px 0 no-repeat;}
*html .nav .nav_page{padding-top:6px;}
.nav .nav_page{text-align:right;padding-right:13px;font-size:12px;}
.subnav{width:100%;height:32px;line-height:32px;font-size:12px;font-weight:normal;color:#ffffff;background:url(<w:url src="/themes/inet/images/nav_down_bg.jpg"/>) 0 0 repeat-x;}
.subnav .left{width:10px;float:left;background:url(<w:url src="/themes/inet/images/nav_up_light_bg.jpg"/>) 0 0 no-repeat;font-weight:bold;}
.subnav .right{width:10px;float:right;background:url(<w:url src="/themes/inet/images/nav_up_light_bg.jpg"/>) 0 0 no-repeat;}
.subnav span{display:inline-block;}
.subnav a{margin-right:10px;font-family:"宋体", font-weight：normal; Calibri;font-size:12px; height:32px;line-height:32px;text-align:center;display:inline-block;color:#ffffff;padding-left:6px;}
.subnav a.handon{padding-left:5px;padding-right:5px; color:003295;text-decoration:none;font-weight：bold;}
.subnav a:hover{background:url(<w:url src="/themes/inet/images/icon_sub_down.jpg"/>) left top no-repeat;background-position:center;text-decoration:none;}
.selectItem{font-weight:bold;background:url(<w:url src="/themes/inet/images/icon_sub_down.jpg"/>) left top no-repeat; background-position:center;}
*html .itemspan{padding-top:7px;cursor: pointer;}
.statusbg1{background:url(<w:url src="/themes/inet/images/top_btnbg.png"/>) 0 9px no-repeat;padding-left:25px;display:inline-block;font-family:"宋体", Calibri;font-size:12px;}
.statusbg2{background:url(<w:url src="/themes/inet/images/top_btnbg.png"/>) 0 -15px no-repeat;padding-left:20px;display:inline-block;font-family:"宋体", Calibri;font-size:12px;margin-right:10px;}
.user_info{float:left;margin-left:12px;_margin-left:10px;}
.btn_info{float:right;margin-right:20px;_margin-right:10px;font-family:"宋体", Calibri;font-size:12px;}
.btn_info a{display:inline-block;height:20px;line-height:20px;font-family:"宋体", Calibri;font-size:12px;}
.btn_info a:hover{text-decoration:none;}
/* 底部 *
=====================================================================*/
.bottom{width:100%;background:url(<w:url src="/themes/inet/images/bottom_bg.jpg"/>) repeat-x;text-align:center;line-height:28px;}

/* 内容部分 *
=====================================================================*/
.main{width:96%;margin:15px auto;}

/* 查询条件 *
=====================================================================*/
.search{margin-bottom:10px;}
.search h1{height:30px;line-height:30px;font-size:12px;padding-left:5px;font-weight:bold;color:#333333;background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>) 0 1px repeat-x;border:1px solid #6593cf;}
.search_cont{border-left:1px solid #7291c0;border-right:1px solid #7291c0;border-bottom:1px solid #7291c0;padding:10px;}
.search_cont table{margin-bottom:5px;width:100%;border-top:1px solid #d0d0d0;border-left:1px solid #d0d0d0;}
.search_cont table td{padding:4px;border-right:1px solid #d0d0d0;border-bottom:1px solid #d0d0d0;}
.search_cont table td.title{background:#eee;width:15%;font-weight:bold;}
.search_btn{width:89px;height:29px;line-height:30px;border:0;background:url(../images/search_btnbg.png) no-repeat;padding-left:20px;font-weight:bold;color:#f60;cursor:pointer;}
.search_option{line-height:0;text-align:center;}

/* 主要摘要 *
=====================================================================*/
.report{margin-bottom:10px;border:1px solid #a5a5a5;}
.report h2{height:28px;line-height:28px;_height:24px;_padding-top:4px;background:url(../images/cont_bg.png) 0 -112px repeat-x;padding-left:10px;font-size:12px;}
.report h2 img{vertical-align:middle;}
.report table td{padding:4px;border-top:1px solid #d0d0d0;color:#20478a;}
.report table td.titleblue{width:15%;background:#f1f6fb;}

/* 查询结果 *
=====================================================================*/
.result{border:1px solid #6593cf;}
.result h3{height:30px;line-height:30px;font-size:12px;font-weight:bold;color:#333333;background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>) 0 1px repeat-x;}
.result table td,th{border-top:1px solid #d0d0d0;border-right:1px solid #d0d0d0;padding:2px 4px;}
.result table th{background:#eee;font-weight:bold;}
.result_roll{margin-top:10px;overflow:hidden;}
.result_btn{height:22px;line-height:20px;color:#2e58a9;font-weight:bold;border:1px solid #687792;padding:0 4px;background:url(../images/cont_bg.png) 0 -328px repeat-x;margin-right:5px;cursor:pointer;font-size:12px;}
.result_roll .right img{vertical-align:middle;}
.result_input{width:30px;height:22px;line-height:22px;border-bottom:1px solid #333;border-top:0;border-left:0;border-right:0;vertical-align:middle;text-align:center;}

/* 添加信息表单 *
=====================================================================*/
.addlist{width:85%;margin:15px auto;}
.add_cont{border:1px solid #5274ae;}
.add_cont h3{height:28px;line-height:28px;font-size:12px;padding-left:10px;font-weight:bold;color:#fff;background:url(../images/cont_bg.png) 0 -152px repeat-x;}
.add_cont table td{border-top:1px solid #aabcda;border-right:1px solid #aabcda;padding:5px;}
.add_cont table td.titleadd{background:#f1f6fb;font-weight:bold;width:15%;}
.add_inputtext{width:250px;height:20px;line-height:20px;font-size:12px;}
.add_inputblank{width:500px;height:80px;}
.worn_input{width:90%;height:50px;}
.add_listbg{width:10%;background:#f3f3f3;color:#333333;}
.add_review{border:1px solid #a5a5a5;margin-top:10px;}
.add_review h6{border-bottom:1px solid #a5a5a5;font-size:12px;font-weight:bold;background:url(../images/cont_bg.png) 0 -112px repeat-x;color:#333;padding:0 5px;}
.add_review p{font-size:12px;padding:5px;}
