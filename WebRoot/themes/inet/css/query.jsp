<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%response.setContentType("text/css");%>

.condicationArea{
	background:url(<w:url src="/themes/inet/images/nbquery/condication_bg.jpg"/>) repeat-x;
	width:100%;
	border-spacing:0;
}

.condicationHeadArea{
	width:100%;
	border:1px solid #6593cf;
}
.condicationHeadArea th{
	font-size:12px;
	font-weight:normal;
	line-height:22px;
	color:#333333;
	text-align:right;
	padding-right:5px;
	cursor:pointer;
}

.page_tr{
	background-color:#d1e4f7;
	height:20px;
	font-family:"宋体", Calibri;
	font-size:12px;
}

.page_tr td{
	border-left:1px #6593cf solid;
	border-right:1px #6593cf solid;
	border-bottom:1px #6593cf solid;
	border-top:0px;
}

.resultHeadArea{
	width:100%;
	border-left:1px solid #6593cf;
	border-right:1px solid #6593cf;
	border-top:1px solid #6593cf;
}

.resultHeadArea th{
	font-size:12px;
	line-height:30px;
	text-align:left;
	background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>) 0 1px repeat-x;
}

.showOrHideButton{
	padding-top:4px;
	color:#f2f6f9;
	font-size:12px;
	font-weight:bold;	
	display:block;
	width:111px;
	height:21px;
	cursor:hand;
	background:url(<w:url src="/themes/inet/images/condication_button.png"/>) no-repeat;
}

.formTable_type1{
	width:100%;
	border-spacing:0;
	border:1px solid #6593cf;
	border-collapse:collapse;
}

.formTable_type1 .splittd{
	font-size:12px;
	height:28px;
	line-height:28px;
	font-weight:bold;
	color:#333333;
	text-align:left;
	border-bottom:1px solid #6593cf;
	background:url(<w:url src="/themes/inet/images/table_splittd.jpg"/>)  0 1px repeat-x;	
}

.formTable_type1 .labeltd{
	font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	color: #333333;
	text-decoration:none;
	background-color:#f3f3f3;
	text-align:right;	
	padding-right:5px;
	border-right:1px solid #dadcdd;
	border-left:1px solid #dadcdd;
}


.formTable_type1  td{
	border-bottom:1px solid #dadcdd;
	font-family:"宋体", Arial, Helvetica, sans-serif;
	font-size:12px;
	height:30px;
	padding-left:5px;
}


.resultTable_type1{
	width:100%;
	border-left:1px #6593cf solid; 
	border-top:1px #6593cf solid;  
	border-bottom:1px #6593cf solid;  
 	border-spacing:0; 
 	font-size:12px;
 	color:#333333;
 	border-collapse:collapse;
}

.resultTable_type1 .splittd{
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

.resultTable_type1 th.header {
	background:url(<w:url src="/themes/inet/images/order.png"/>) no-repeat;
	background-position:center right; 
	CURSOR: pointer;
}

.resultTable_type1 th.headerSortUp {     
	background: url(<w:url src="/themes/inet/images/asc.png"/>) no-repeat; 
	background-position:center right;   
	CURSOR: pointer;
}

.resultTable_type1 th.headerSortDown {     
	background: url(<w:url src="/themes/inet/images/desc.png"/>) no-repeat; 
	background-position:center right;  
	CURSOR: pointer;
}

.resultTable_type1 .headrow{
	color:#333333; 
	line-height:24px;
	vertical-align:middle;
	background-color: #d1e4f7 ; 
}

.resultTable_type1 th{
	text-align:center;
	border-right:1px #6593cf solid;
	border-bottom:1px #6593cf solid; 
	height:25px;
}

.resultTable_type1 tr{
    font-family:Tohoma,"宋体", Arial, Helvetica, sans-serif;
	height:24px;
}

.resultTable_type1 td{
	padding-left:3px;
	border-bottom:1px solid #dadcdd;
	border-right:1px solid #dadcdd;
	text-align:left;	
	table-layout:fixed; 
	word-wrap:break-word;
}

.resultTable_type1 .checktd{
	text-align:center;	
}
.resultTable_type1 .numbertd{
	text-align:right;	
	padding-right:3px;
}
.resultTable_type1 .datetd{
	text-align:center;	
}
.resultTable_type1 .actiontd{
	text-align:center;
	border-right:1px #6593cf solid;	
}
