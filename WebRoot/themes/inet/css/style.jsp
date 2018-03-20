<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%response.setContentType("text/css");%>

html,body {
	margin: 0px;
	font-family:"宋体", Arial, Helvetica, sans-serif;
	background-color: #ffffff;
	SCROLLBAR-FACE-COLOR: #e6e6e6; 
	SCROLLBAR-HIGHLIGHT-COLOR: #e6e6e6; 
	SCROLLBAR-SHADOW-COLOR: #e6e6e6; 
	SCROLLBAR-3DLIGHT-COLOR: #F4F4F4; 
	SCROLLBAR-ARROW-COLOR: #c0c4c3; 
	SCROLLBAR-TRACK-COLOR: #F4F4F4; 
	SCROLLBAR-DARKSHADOW-COLOR: #F4F4F4;
	height:100%;
}

.skip_title{
	padding:5px 0 5px 10px;
	margin-bottom:15px;
	font-size:12px;
	font-weight:bold;
	color:#333;
	border-bottom:1px solid #abb;
	background:url(<w:url src="/themes/inet/images/cont_bg.png"/>) 0 -105px repeat-x;
}
.skip_title img{
	vertical-align:middle;
}


a{
	font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#333333;
}

.function_head_name {
    font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;
	color:#333;
}


.formTable{
	width:100%;
	border-spacing:0;
	border:1px solid #6593cf;
	border-collapse:collapse;
	margin-bottom:8px;
}

.formTable .centertd{
	font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color: #333333;
	text-decoration:none;
	background-color:#f3f3f3;
	text-align:center;	
	border-right:1px solid #dadcdd;
	border-bottom:1px solid #dadcdd;
}

.formTable .othertd{
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	border-right:1px solid #dadcdd;
	height:30px;
}

.formTable .splittd{
	font-size:12px;
	height:28px;
	line-height:28px;
	font-weight:bold;
	color:#333333;
	text-align:left;
	border-bottom:1px solid #6593cf;
	border-top:1px solid #6593cf;
	background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>) 0 1px repeat-x;	
}
.formTable .splittd span{
	margin-left:4px;
}

.formTable .labeltd{
	font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color: #333333;
	text-decoration:none;
	background-color:#f3f3f3;
	text-align:right;	
	padding-right:5px;
	border-right:1px solid #dadcdd;
	border-left:1px solid #dadcdd;
	border-bottom:1px solid #dadcdd;
}

.formTable  td{
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	border-bottom:1px solid #dadcdd;
	height:30px;
}



.formTable .labeltd_title{
	font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color: #333333;
	text-decoration:none;
	background-color:#f3f3f3;
	text-align:center;	
	border:1px solid #dadcdd;
}


.detailTable{
	width:100%;
	border:1px solid #a5a5a5;
	margin-bottom:-1px;
	border-collapse:collapse;
	border-spacing:0; 
	margin-top:0px;
	word-break:break-all;
	word-wrap:break-word;
}
.detailTable .splittd{
	font-size:12px;
	height:27px;
	color:#323232;
	text-align:left;
	line-height:20px;
	padding:0px 0px 0px 10px;	
	border:0px;
	background:url(<w:url src="/themes/inet/images/detail_splittd.png"/>) repeat-x;	
}

.detailTable .labeltd{
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;
	height:30px;
	color: #20478c;
	padding:0px 0px 0px 10px;
	border-bottom:1px solid #d0d0d0;
	text-decoration:none;
	background-color:#f1f6fa;
	text-align:left;
	word-break:break-all;
	word-wrap:break-word;		
}

.detailTable .labeltd2{
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;
	height:30px;
	color: #20478c;
	padding:0px 0px 0px 10px;
	border-bottom:1px solid #d0d0d0;
	text-decoration:none;
	background-color:#f1f6fa;
	text-align:left;
	word-break:break-all;
	word-wrap:break-word;			
}

.detailTable td{
	border-bottom:1px solid #d0d0d0;
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#21468a;
	height:30px;
	word-break:break-all;
	word-wrap:break-word;	
	padding-left:2px;
}

.detailTable lumntd2{
	border-bottom:1px solid #d0d0d0;
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#21468a;
	height:30px;
	background-color:#ffffff;
	word-break:break-all;
	word-wrap:break-word;	
	padding-left:2px;
}

.formListTable{
	width:100%;
	border:1px #6593cf solid; 
 	border-spacing:0;
 	margin-top:8px; 
 	border-collapse:collapse;
 	margin-bottom:8px;
}

.formListTable .headrow th{
	padding: 5px;
	text-align:center;
	border-right:1px #dadcdd solid;
    font-size:12px;
	font-weight:bold;
	color:#333333;
	background-color: #f3f3f3 ; 	
}

.formListTable .splittd{
	font-size:12px;
	height:28px;
	line-height:28px;
	font-weight:bold;
	color:#333333;
	text-align:left;
	border-bottom:1px solid #6593cf;
	background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>)  0 repeat-x;	
}

.formListTable .labeltd{
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;
	height:30px;
	color: #333333;
	padding:0px 0px 0px 10px;
	border:1px solid #abbcda;
	text-decoration:none;
	background-color:#f3f3f3;
	text-align:left;
	word-break:break-all;
	word-wrap:break-word;		
}

.formListTable td{
	padding-left: 5px;
	border-right:1px #dadcdd solid;
	border-top:1px #dadcdd solid;
	color:#333333;
	text-align:left;
	height:28px;		
}

.formListTable .actiontd{
	text-align:center;	
}

.formListTable .numbertd{
	text-align:left;	
}

.formListTable .actiontd .action06{
	background:url(<w:url src="/themes/inet/images/icon_remove.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:3px;
}

.condicationTable{
	width:100%;
 	border-spacing:0; 
	border-collapse:collapse;
	border:0px;
	word-break:break-all;
	word-wrap:break-word;
}

.condicationTable .labeltd{
	text-align:right;
	color: #333333;	
	text-decoration:none;
	padding:0px 3px 0px 5px;	
}

.condicationTable .labeltd_other{
	text-align:right;
	color: #333333;	
	text-decoration:none;
	padding:0px 3px 0px 5px;	
	background-color: #f3f3f3;
}

.condicationTable td{
	padding-left:2px;
	border:0px;
	font-family:"宋体", Arial, Helvetica, sans-serif;	
	font-size:12px;
	height:30px;
	word-break:break-all;
	word-wrap:break-word;
}
.condicationTable_type1{ 
	width:100%;
	border-spacing:0;
	border:1px solid #6593cf;
	border-collapse:collapse;
}
.condicationTable_type1 .labeltd{ 
	color: #333333;
	font-size:12px;
	text-decoration:none;
	padding:0px 0px 0px 10px;
	background-color:#f3f3f3; 
	padding-right:15px;
	text-align:right;
	border-left:1px #dadcdd solid;
	border-right:1px #dadcdd solid;
}
.condicationTable_type1 td{
	 padding-left:2px;
	 font-family:"宋体", Arial, Helvetica, sans-serif;
	 font-size:13px;
	 border-bottom:1px #dadcdd solid;
	 height:30px;
	 text-align:left;
}

.condicationTable_type1 .splittd{
	color:#ffffff;
	background:url(<w:url src="/themes/inet/images/table_splittd.png"/>) repeat-x;
	font-weight:bold;
	padding-left:25px;
}
.condicationTable_type1 td input{
	padding-left:10px;
}


.resultTable{
	width:100%;
	border:1px #6593cf solid; 
 	border-spacing:0; 
 	font-size:12px;
 	color:#333333;
 	border-collapse:collapse;
}

.resultTable td{
	border-bottom:1px solid #dadcdd;
	border-right:1px solid #dadcdd;
	text-align:left;	
	padding-left:5px;
	table-layout:fixed; 
	word-wrap:break-word;	
}


.resultTable .splittd{
	font-size:12px;
	height:28px;
	line-height:28px;
	font-weight:bold;
	color:#333333;
	text-align:left;
	border-bottom:1px solid #6593cf;
	border-right:1px solid #6593cf;
	background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>)  0 repeat-x;	
}

.resultTable th.header {
	background:url(<w:url src="/themes/inet/images/order.gif"/>) no-repeat;
	background-position:center right; 
	background-color:#d1e4f7 ; 
	CURSOR: pointer;
}

.resultTable th.headerSortUp {     
	background: url(<w:url src="/themes/inet/images/asc.gif"/>) no-repeat; 
	background-position:center right;  
	background-color:#d1e4f7 ;  
	CURSOR: pointer;
}

.resultTable th.headerSortDown {     
	background: url(<w:url src="/themes/inet/images/desc.gif"/>) no-repeat; 
	background-position:center right;  
	background-color:#d1e4f7 ;  
	CURSOR: pointer;
}

.resultTable .headrow{
	color:#333333; 
	line-height:24px;
	vertical-align:middle;
	background-color: #d1e4f7 ; 
}

.resultTable th{
	text-align:center;
	border-right:1px #6593cf solid;
	border-bottom:1px #6593cf solid; 
	height:25px;
}

.resultTable tr{
    font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	height:24px;
}

.resultTable .checktd{
	text-align:center;	
	padding-left:0px;
}
.resultTable .numbertd{
	text-align:right;	
	padding-right:3px;
}
.resultTable .datetd{
	text-align:center;
	padding-left:0px;	
}
.resultTable .actiontd{
	text-align:center;
	padding-left:0px;
}

.resultTable .actiontd a{
	height:16px;
	display:inline-block;
}
.resultTable .actiontd .action01{
	background:url(<w:url src="/themes/inet/images/icon_modify.gif"/>) 0  no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}
.resultTable .actiontd .action02{
	background:url(<w:url src="/themes/inet/images/icon_personnel.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}
.resultTable .actiontd .action03{
	background:url(<w:url src="/themes/inet/images/icon_transfer.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}
.resultTable .actiontd .action04{
	background:url(<w:url src="/themes/inet/images/icon_import1.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}
.resultTable .actiontd .action05{
	background:url(<w:url src="/themes/inet/images/icon_alarm.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}
.resultTable .actiontd .action06{
	background:url(<w:url src="/themes/inet/images/icon_remove.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
	
}
.resultTable .actiontd .action07{
	background:url(<w:url src="/themes/inet/images/icon_empower.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}

.resultTable .actiontd .action08{
	background:url(<w:url src="/themes/inet/images/icon_search01.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}

.resultTable .actiontd .action09{
	background:url(<w:url src="/themes/inet/images/icon_stop.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}

.resultTable .actiontd .action10{
	background:url(<w:url src="/themes/inet/images/icon_start.gif"/>) 0 no-repeat;
	padding-left:18px;
	vertical-align:middle;
	padding-top:5px;
}

.resultTable .actiontd .actionCauseFeedback{
	background:url(<w:url src="/themes/inet/images/button/button3.gif"/>) 0 no-repeat;
	padding-left:18px;
	padding-top:4px;
}

.resultTable .actiontd .actionCauseDetail{
	background:url(<w:url src="/themes/inet/images/button/button1.gif"/>) 0 no-repeat;
	padding-left:18px;
	padding-top:4px;
}

.resultTable .actiontd .actionCauseDelete{
	background:url(<w:url src="/themes/inet/images/button/delete.gif"/>) 0 no-repeat;
	padding-left:18px;
	padding-top:4px;
}

.resultTable_qingbao{
	width:100%;
	border:1px #6593cf solid;
	border-collapse:collapse;
	border-spacing:0;
	margin-bottom:10px; 
}
.resultTable_qingbao th.header{ 
	background:url(<w:root/>/themes/inet/images/order.gif) no-repeat;
	background-position:center right;
	background-color:#f3f3f3;
	CURSOR:pointer; 
}
.resultTable_qingbao th.headerSortUp{
	 background: url(<w:root/>/themes/inet/images/asc.gif) no-repeat;
	 background-position:center right;
	 background-color:#f3f3f3;
	 CURSOR:pointer;
}
.resultTable_qingbao th.headerSortDown{ 
	background: url(<w:root/>/themes/inet/images/desc.gif) no-repeat;
	background-position:center right;
	background-color:#f3f3f3;
	CURSOR:pointer;
 }
.resultTable_qingbao .headrow{
	height:35px;
	font-size:13px;
	font-weight:bold;
	color:#0b2b65;
	line-height:35px;
	vertical-align:middle;
	background-color:#f3f3f3; 
}
.resultTable_qingbao th{ 
	padding:0 5px;
	text-align:left;
	border-right:0px #6593cf solid;
	border-top:0px #6593cf solid;
	border-bottom:0px #6593cf solid;
  }
.resultTable_qingbao tr{
	 font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	 font-size:12px;
	 height:25px; 
}
.resultTable_qingbao a{
	 font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	 font-size:12px; 
}
.resultTable_qingbao td{
	padding:0px;
	border-left:0px #6593cf solid;
	border-right:0px #6593cf solid;
	border-top:1px #6593cf solid;
	border-bottom:1px #6593cf solid;
	color:#333333;
	text-align:left;
	table-layout:fixed;
	word-wrap:break-word; 
}
.resultTable_qingbao .numbertd{ 
	text-align:left;
 }
.resultTable_qingbao .actiontd{ 
	text-align:center; 
}

.hover{
	background-color:#e0eaf7;
}

.oddrow{
	background-color:#f3f3f3;
}

.evenrow{
	background-color:#ffffff;
}


.innerTable{ 
	width:100%;
	margin-left:-3px;
	margin-bottom:-3px;
	border:0;
	word-break:break-all;
	word-wrap:break-word;
	border-spacing:0;
 }
.innerTable th{ 
	font-size:12px;
	font-weight:bold;
	color:#333333;
	text-align:left;
	border-left:0px solid #dadcdd;
	border-top:0px;
	border-bottom:1px solid #dadcdd;
	border-right:0px;
	padding:0px 0px;
	text-decoration:none;
	background-color:#f6f6f6;
	word-break:break-all;
	word-wrap:break-word;
	height:30px; 
}

.innerTable .lefttd{ 
	border-right:1px solid #dadcdd;
}
.innerTable .labeltd{ 
	font-size:12px;
	font-weight:bold;
	color:#666666;
	border-left:0px solid #dadcdd;
	border-top:0px;
	border-bottom:1px solid #dadcdd;
	border-right:0px;
	padding-left:5px;
	text-decoration:none;
	background-color:#f1f6fa;
	text-align:left;
	word-break:break-all;
	word-wrap:break-word;
	height:30px;
 }
.innerTable td{ 
	font-size:12px;
	padding:2px;
	word-break:break-all;
	word-wrap:break-word;
	height:30px; 
	border-bottom:1px solid #dadcdd;
}

.innerDataTable{ 
	width:100%;
	border:0px;
	margin-left:0px;
	margin-bottom:0px;
	border-collapse:collapse;
	word-break:break-all;
	word-wrap:break-word; 
}
.innerDataTable th{
	font-size:12px;
	font-weight:normal;
	height:20px;
	color: #333333;
	text-align:left;
	border-left:1px dashed #abbcda;
	border-top:0px;
	border-bottom:1px dashed #abbcda;
	border-right:0px;
	padding:5px;
	text-decoration:none;
	background-color:#f6f6f6;
	word-break:break-all;
	word-wrap:break-word; 
}
.innerDataTable .labeltd{ 
	font-size:12px;
	font-weight:normal;
	height:20px;
	color: #666666;
	border-left:1px dashed #abbcda;
	border-top:0px;
	border-bottom:1px dashed #abbcda;
	border-right:0px;
	text-decoration:none;
	padding:5px;
	background-color:#f1f6fa;
	text-align:center;
	word-break:break-all;
	word-wrap:break-word; 
}
.innerDataTable td{
	border-right:1px dashed #dadcdd;
	border-left:1px dashed #dadcdd;
	border-top:0px;
	border-bottom:1px dashed #dadcdd;
	font-size:12px;
	height:30px;
	padding:2px;
	word-break:break-all;
	word-wrap:break-word; 
}
.innerDataTable .noborder_checkbox{
	border-left:0px;
	border-bottom:0px;
}
.innerDataTable .noborder_zhaiyao1{
	border-bottom:0px;
}
.innerDataTable .noborder_zhaiyao2{
	border-bottom:0px;
	border-right:0px;
}
.innerDataTable .noborder_download{
	border-right:0px;
}
.innerDataTable .title{
	padding-left:20px;
	background-color:#f3f3f3;
	font-size:12px;
	font-weight:normal;
	color:#333333;
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
	height:30px;
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
	padding-top:5px;
}

.control td{
	border:0px;
	text-align:center;
}

.numbertd{
	text-align:center;	
}

.actiontd{
	text-align:center;	
}

.tab {
	FLOAT: left;
	FONT-SIZE: 12px; FONT-FAMILY: Verdana, 宋体;
	width:99%;
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none
}

.tab ul{
	list-style:none;

}

.tab li {
	FLOAT: left; MARGIN: 0px 0px 0px 1px; min-width: 84px
}

.tab ul a {
	DISPLAY: block; 
	BACKGROUND: url(<w:url src="/themes/inet/images/tab.png"/>) no-repeat; 
	PADDING-TOP: 0px;
	PADDING-BOTTOM: 0px; 
	PADDING-LEFT: 0px; 
	PADDING-RIGHT: 8px; 
	FONT-WEIGHT: bold; 
	MARGIN: 1px 0px 0px; 
	COLOR: #27537a; 
	LINE-HEIGHT: 20px; 
	WHITE-SPACE: nowrap; 
	TEXT-ALIGN: center; 
	TEXT-DECORATION: none; 
	outline: 0;
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
	BACKGROUND: url(<w:url src="/themes/inet/images/tab.png"/>) no-repeat; 
	PADDING-TOP: 4px; 
	PADDING-BOTTOM: 0px;
	PADDING-LEFT: 8px; 
	PADDING-RIGHT: 0px; 
	MIN-HEIGHT: 20px; 
	HEIGHT: 20px; 
	_width:64px;
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
	float:left;
	width:100%;
	BORDER-TOP: #97a5b0 1px solid; 
	PADDING-TOP: 2px
}

.required{
	color: #FF0000;
	font-size: 12px;
}

.text,.ip,.email,.password,.int,.numeric,.autocomplete{
	WIDTH:150px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: 20px;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.bigtext,.bigip,.bigemail,.bigpassword,.bigint,.bignumeric{
	WIDTH:600px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: 20px;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.droplist{
    position: relative;
    width: 155px;
    font-size:12px;
    line-height: 20px;
    border: 1px solid #829cb7;
    COLOR: #000000;
	height:25px;
	margin-left:1px;
}

.bigdroplist{
    position: relative;
    width: 600px;
    font-size:12px;
    line-height: 20px;
    border: 1px solid #829cb7;
    COLOR: #000000;
	height:25px;
	margin-left:1px;
}

.textarea{
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.bigtextarea{
	WIDTH:600px;
	HEIGHT: 100px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.select{
	WIDTH:150px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	margin-left:1px;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.bigselect{
	WIDTH:600px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	margin-left:1px;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.file{
	FONT-SIZE: 12px;
	COLOR: #000000;
	margin-left:1px;
	LINE-HEIGHT: 20px;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.bigfile{
	WIDTH:600px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	margin-left:1px;
	LINE-HEIGHT: 20px;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.date{
	WIDTH:130px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: 20px;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.bigdate{
	WIDTH:580px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: 20px;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.datebtn{
	WIDTH:20px;
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #829cb7;
}

.checkContainer,.radioContainer{
	border:0px;
}

.checkContainer td,.radioContainer td{
	border:0px;
	FONT-SIZE: 12px;
	COLOR: #000000;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
}

.button{
	HEIGHT: 20px;
	margin-left:1px;
	FONT-SIZE: 12px;
	COLOR: #8f8f8f;
	LINE-HEIGHT: normal;
	FONT-STYLE: normal;
	border: 1px solid #cccccc;
}

.gbutton{
	margin: 0;
	background-image: url(<w:url src="/themes/inet/images/button/btn_left.png"/>);
	background-repeat: no-repeat;	
    height:22px;
	padding:0 0 0 2px;
	display:inline-block;
}
.gbutton span{
	margin:0;
	padding:0px;
    height:22px;
	background: url(<w:url src="/themes/inet/images/button/btn_middle.png"/>) repeat-x;
	display:inline-block;
	color:#2d5698;
    font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	font-weight:bold;	
}
.gbutton span img{
	display:none;
}
.gbutton span a{
	padding-top:0px;
	padding-bottom:0px;
	padding-right:12px;
	padding-left:12px;
    height:22px;
    line-height:22px;
	text-decoration:none;
	display:block;
	float:left;
}
.gbutton span a:hover{
    color:#2d5698;
}
.gbutton span span{
	margin: 0;
	padding-left:2px;
    height:22px;
	background-image: url(<w:url src="/themes/inet/images/button/btn_right.png"/>);
	background-repeat: no-repeat;
}

.onValidateShow
{
    background:url(<w:url src="/themes/inet/images/validator/onShow.gif"/>) no-repeat; 
    height:25px;
	padding-left:25px; 
	font-size: 12px;
	line-height:25px; 
	vertical-align:middle;
}
.onValidateFocus
{
    background:url(<w:url src="/themes/inet/images/validator/onFocus.gif"/>) no-repeat; 
    height:25px;
	padding-left:25px; 
	font-size: 12px;
	line-height:25px; 
	vertical-align:middle;
}
.onValidateError
{
    background:url(<w:url src="/themes/inet/images/validator/onError.gif"/>) no-repeat;
    height:25px;
	padding-left:25px;
	font-size: 12px;
	line-height:25px; 
	vertical-align:middle;
}
.onValidateCorrect
{
    background:url(<w:url src="/themes/inet/images/validator/onCorrect.gif"/>) no-repeat;
	height:25px;    	
	padding-left:25px;
	font-size: 12px;
	line-height:25px; 
	vertical-align:middle;
}
.onValidateLoad
{
    background:url(<w:url src="/themes/inet/images/validator/onLoad.gif"/>) no-repeat 3px 3px;
	height:25px;    	
	padding-left:25px;
	font-size: 12px;
	line-height:25px; 
	vertical-align:middle;
} 

.resultPage{
    font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#525252;
	line-height:26px;
	border:0px;
	margin-top:2px;
	padding-right:6px;
	text-align:right;
	height:26px;
}

.resultPage a{
	color:#525252;
	text-decoration:none;
	_padding:3px 5px 5px;
	margin-top:2px;
}
.resultPage a:hover{
	color:#fff;
	text-decoration:none;
}
.resultPage .page{
    height:18px;
	width:18px;
	line-height:18px;
	border:1px #999 solid;
	vertical-align:middle;
	text-align:center;
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#686868;
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
	color:#000000;
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
	color:#000000;
}

img{
	border:0px;
}

.black_overlay{  
display: none;  
position: absolute;  
top: 0%;  left: 0%;  width: 100%;  height: 100%;  
background-color: black;  z-index:1001;  -moz-opacity: 0.8;  opacity:.80;  
filter: alpha(opacity=80);  }  

.white_content {  
display: none;  position: absolute;  top: 25%;  left: 25%;  width: 50%;  height: 50%;  
padding: 16px;  border: 16px solid orange;  background-color: white;  z-index:1002;  overflow: auto;  }  

/* 树形控件显示样式  *
====================================================================*/
.treeview, .treeview ul { padding: 0;margin: 0;list-style: none; }
.treeview ul { background-color: white;margin-top: 4px; }
.treeview .hitarea { background-position: -64px -25px;height: 16px;width: 16px;margin-left: -16px;float: left;cursor: pointer; }
/* fix for IE6 */
* html .hitarea { display: inline;float:none; }
.treeview li { margin: 0;padding: 3px 0pt 3px 16px; }
.treeview a.selected { background-color: #eee; }
#treecontrol { margin: 1em 0; display: none; }
.treeview .hover { color: red; cursor: pointer; }
.treeview li { background: url(<w:url src="/themes/inet/images/treeview/treeview-default-line.gif"/>) 0 0 no-repeat; }
.treeview li.collapsable, .treeview li.expandable { background-position: 0 -176px; }
.treeview .expandable-hitarea { background-position: -80px -3px; }
.treeview li.last { background-position: 0 -1766px }
.treeview .hitarea, .treeview li.lastCollapsable, .treeview li.lastExpandable { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-default.gif"/>); }  
.treeview li.lastCollapsable { background-position: 0 -111px }
.treeview li.lastExpandable { background-position: -32px -67px }
.treeview div.lastCollapsable-hitarea, .treeview div.lastExpandable-hitarea { background-position: 0; }
.treeview-red li { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-red-line.gif"/>); }
.treeview-red .hitarea, .treeview-red li.lastCollapsable, .treeview-red li.lastExpandable { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-red.gif"/>); } 
.treeview-black li { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-black-line.gif"/>); }
.treeview-black .hitarea, .treeview-black li.lastCollapsable, .treeview-black li.lastExpandable { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-black.gif"/>); }  
.treeview-gray li { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-gray-line.gif"/>); }
.treeview-gray .hitarea, .treeview-gray li.lastCollapsable, .treeview-gray li.lastExpandable { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-gray.gif"/>); } 
.treeview-famfamfam li { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-famfamfam-line.gif"/>); }
.treeview-famfamfam .hitarea, .treeview-famfamfam li.lastCollapsable, .treeview-famfamfam li.lastExpandable { background-image: url(<w:url src="/themes/inet/images/treeview/treeview-famfamfam.gif"/>); } 
.treeview .placeholder { background: url(<w:url src="/themes/inet/images/treeview/ajax-loader.gif"/>) 0 0 no-repeat;height: 16px;width: 16px;display: block; }
.filetree li { padding: 3px 0 2px 16px; }
.filetree span.folder, .filetree span .file { padding: 1px 0 1px 16px; border:0px }
.filetree span.folder { background: url(<w:url src="/themes/inet/images/treeview/folder.gif"/>) 0 0 no-repeat; }
.filetree li.expandable span.folder { background: url(<w:url src="/themes/inet/images/treeview/folder-closed.gif"/>) 0 0 no-repeat; }
.filetree span.file { background: url(<w:url src="/themes/inet/images/treeview/file.gif"/>) 0 0 no-repeat; }

.shadow_forward {
    -moz-box-shadow: 3px 3px 4px #c0c0c0;
    -webkit-box-shadow: 3px 3px 4px #c0c0c0;
    box-shadow: 3px 3px 4px #c0c0c0;
}

