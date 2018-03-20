<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><f:applicationName/><f:version/></title>
<w:style src="/themes/inet/css/style.jsp"/>
<w:style src="/themes/inet/css/query.jsp"/>
<w:style src="/themes/inet/css/otherstyle.jsp"/>
<w:style src="/themes/inet/css/other/easyui.jsp" />
<w:style src="/themes/inet/css/other/icon.jsp" />
<w:style/>
<style>
.lightbox{width:300px;background:#FFFFFF;border:5px solid #ccc;line-height:20px;display:none; margin:0;}
.lightbox dt{background:#f4f4f4;padding:5px;}
.lightbox dd{ padding:20px; margin:0;}
</style>
<w:script src="/js/jquery.js"/>
<w:script src="/js/jquery.easyui.js"/>
<w:script src="/js/jquery.framework.js"/>
<w:script src="/js/jquery.validate.js"/>
<w:script src="/js/jquery.metadata.js"/>
<w:script src="/js/jquery.validate.snappy.js"/>
<w:script src="/themes/inet/js/WdatePicker.js"/>
<w:script src="/themes/inet/js/iframeresize.js"/>
<script type="text/javascript">
function onQuery(form, mark){
	if($("form").validateForm()){
		$("#queryWaittingArea").show();
		$("#action").val("query");
		$("#method").val(mark);
		$("form").submit();
	}
}
<w:areaExist id="result">
$(function(){
	$("#result").queryInitlization($("#control"));
})
</w:areaExist>
<w:areaExist id="condication">
function hideConidcation(){
	$("#condication_show_hide").val("1");
	$("#queryCondicationRow").hide();
	$("#queryButtonRow").hide();
	$("#queryCondicationRow_div").show();
}
function showConidcation(){
	$("#condication_show_hide").val("0");
	$("#queryCondicationRow").show();
	$("#queryButtonRow").show();
	$("#queryCondicationRow_div").hide();
}	
function onCondicationShowOrHide(){
	if($("#condication_show_hide").val()=="" || $("#condication_show_hide").val()=="0")
		hideConidcation();
	else
		showConidcation();
}
$(function(){
	hideConidcation();
	//var table = $("#result");
	//增加鼠标移动行变色功能
	//var color;
	//table.find("tr[class!=headrow]").hover(
	//		function(){
	//			color=$(this).attr("class");
	//			$(this).removeAttr("class");
	//			$(this).addClass("hover");
	//		},
	//		function(){
	//			$(this).attr("class",color);
	//			$(this).removeClass("hover");
	//		});
});
</w:areaExist>	
$(function(){
	$("#initlizationWaittingArea").hide();
	fixFrameSize();
});
</script>
</head>
<body style="margin-left:8px;margin-top:8px;margin-right:8px;">
		<div
			style="overflow: hidden; position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 99; background-color: #FFFFFF;"
			id="initlizationWaittingArea">
			<table width="100%" height="100%">
				<tr>
					<td align="center">
						<img
							src="<w:url src="/themes/inet/images/resource/large-loading-124.gif"/>" width="124" height="124"/>
					</td>
				</tr>
			</table>
		</div>
<w:formDefine>
<e:hidden name="action"/>
<e:hidden name="method"/>	
<e:hidden name="condication_show_hide"/>
<e:hidden name="orderColumn"/>
<e:hidden name="currentPage"/>	
<w:area id="hidden"/>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" >
<tr id="functionName" style="display:none">
	<td><h1 class="skip_title"><img src="<w:root/>/themes/inet/images/tag_orange.gif" /> <w:name/></h1></td>
</tr>
<tr>
	<td>
		<w:areaExist id="condication">
		<table width="100%" cellpadding="1" cellspacing="1" class="condicationHeadArea"  style="margin-bottom:10px;" >
			<tr id="queryCondicationRow_div">	    				
				<th height="22px" onclick="javascript:onCondicationShowOrHide()" bgcolor="#FFFFFF"  style="filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#bdd3ef,endcolorstr=#f1f8fd,gradientType=0)">
						查询条件<img id="openBtn" src="<w:root/>/themes/inet/images/listarrow_up.gif" style="vertical-align:middle;"/>
				</th>
			</tr>	
			<tr id="queryCondicationRow">
				<td bgcolor="#FFFFFF"  style="filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#bdd3ef,endcolorstr=#f1f8fd,gradientType=0)">
				<table align="center" style="width:100%;">
					<tr>
						<td>
							<w:area id="condication"/>
							<img style="cursor:hand;float:right;position:absolute;top:20px;right:20px;"  onclick="javascript:onCondicationShowOrHide();"
								src="<w:url src="/themes/inet/images/listarrow_down.gif"/>" />
						</td>
					</tr>
					<tr id="queryButtonRow">	    				
						<td style="text-align:center;padding-bottom:3px;padding-top:3px">
							<a href="javaScript:onQuery($('form'),'query')" onfocus="this.blur()"><img src="<w:url src="/themes/inet/images/query_button.png"/>"/></a>
						</td>
					</tr>
				</table>
				</td>
			</tr>	
													    											
		</table>
		</w:areaExist>	
		<w:areaExist id="detail">
		<w:area id="detail"/>
		</w:areaExist>
		<w:areaExist id="result">
		<table width="100%" cellpadding="0" cellspacing="0" class="resultHeadArea">
			<tr>
				<th height="30px" style="text-align:left;">
					<w:area id="control"/>
				</th>
			</tr>						    											
		</table>		
			<w:area id="result"/>
		</w:areaExist>
		</td>
	</tr>
	<tr class="page_tr">	    				
		<td style="text-align:right"><e:pagination name="resultPage"/></td>
	</tr>									    											
</table>
<w:areaExist id="myDiv">
<div id="light" class="white_content"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="resultHeadArea" style="margin-top:10px">
		<tr>	    				
			<th height="28" id="titleName">请选择合并后的对象名称</th>
		</tr>						    											
	</table>
	<table id="result"  class="resultTable" >
	<tr class="headrow" >
		<th width="25" >&nbsp;</th>
		<th><span ><span id="myDivName">对象名称</span></span></th>
		<th><span ><span id="myDivStatus">对象状态</span></span></th>
	</tr>
	<tr>
		<td><span  id="obj_container0" ><input  type="radio"  id="objId0"  name="objId0"  class="radio"></span><span id="objIdTip0"></span></td>
		<td><span  id="objName_container0" ><span  id="objName0" >6666</span></span></td>
		<td><span  id="objStatus_container0" ><span  id="objStatus0" >在侦</span></span></td>
	</tr>
	<tr>
		<td><span  id="obj_container1" ><input  type="radio"  id="objId1"  name="objId0"  class="radio"  ></span><span id="objIdTip1"></span></td>
		<td><span  id="objName_container1" ><span  id="objName1" >6666</span></span></td>
		<td><span  id="objStatus_container1" ><span  id="objStatus1" >在侦</span></span></td>
	</tr>
	</table>
	<a href="#"  onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';objtouchNext();"> 
    确定</a>
    <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';"> 
    关闭</a>
</div> 
<div id="fade" class="black_overlay"> 
</w:areaExist>
<w:areaExist id="myDiv1">
<div id="light1" class="white_content">
<table class="formArea" >
<tr>
<td class="labeltd"  width="20%" ><span ><span  refid="clueEndtime_tmp" >侦控结束时间</span><span class="required">*</span></span></td>
<td><span  id="clueEndtime_tmp_container" ><input  type="text"  id="clueEndtime_tmp"  name="clueEndtime_tmp"   class="date" /></span><span id="clueEndtime_tmpTip"></span></td>
</tr>
<tr>
<td colspan="2">
<font color="red">*修改的侦控结束时间如大于案件对象侦控结束时间,案件对象也将以此结束时间为准!</font>
</td>
</tr>
</table>
<a href="#"  onclick="clueContinue();">确定</a>
 </div> 
<div id="fade1" class="black_overlay"></div>
</w:areaExist>
</w:formDefine>
</body>
<w:script/>
</html>
