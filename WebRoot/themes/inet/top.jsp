<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@page import="java.io.File"%>
<%@ taglib uri="/taiji-snappy-web" prefix="w"%>
<%@ taglib uri="/taiji-snappy-web-element" prefix="e"%>
<%@ taglib uri="/taiji-snappy-web-core" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><f:applicationName/> <f:version/></title>
<w:style src="/themes/inet/css/main.jsp"/>
<w:style src="/themes/inet/css/style.jsp"/>
<w:style/>
<w:script src="/js/jquery.js"/>
<w:script src="/js/jquery.easyui.js"/>
<w:script src="/js/jquery.framework.js"/>
<w:script src="/js/jquery.validate.js"/>
<w:script src="/js/jquery.metadata.js"/>
<w:script src="/js/jquery.validate.snappy.js"/>
<w:script src="/themes/inet/js/WdatePicker.js"/>
<script type="text/javascript">
function relogin(){
	document.location="<w:url src="/login.do"/>";
}

var nownews=0;
//接收系统信息
//online	在线用户数
//keeptime	在线时长
//news	未处理/未读消息数
//lasttime	最新消息时间
//messages	消息对象
function receiveSystemInfo(online,keeptime,news,lasttime,messages){
	var html = "";
	if($("#keeptimeContainer").length>0)
		$("#keeptimeContainer").html(keeptime);
	if($("#noticeLastChangeTime").length>0)
		$("#noticeLastChangeTime").val(lasttime);
	if(news){
		if(news>"0"){
			$(messages.get(messages.size()-1)).each(function(){
				//遍历消息对象，获取消息内容
				var id = $(this).attr("id");//消息ID
				var type = $(this).attr("type");//消息类型
				var typename = $(this).attr("typename");//类型名称
				var url = $(this).attr("url");//查看消息使用的URL
				var time = $(this).attr("time");//消息发出时间
				var description = $(this).text();//消息内容摘要
				//if(url != ""){
					//description = "<a href=\"" + url + "\" target=\"mainFrame\">" + description + "</a>";
				//}
		
				//try{
					//description = appendNotice(description);
				//}catch(e){
					//description = "["+typename+"]"+description + "&nbsp;";
				//}
		
				//html = html + description;
			});
			if($("#newNoticeTimesContainer").length>0){
				//$("#newNoticeTimesContainer").html(news+"&nbsp;|&nbsp;"+html);
				$("#newNoticeTimesContainer").html(news);
			}
			//弹出报警信息窗口
			if(parseInt(news)>parseInt(nownews)){ 
				nownews=news;
				//openWindow_new('<w:url src="/message.do?action=query"/>','800','400','alarmWindow');
				if($("#sound").length>0){
					if($("#sound").attr("flag")=="open"){
						try{
							//播放声音
							document.getElementById("noticeSound").play();
						}catch(e){}
					}
				}
			}
			nownews=parseInt(news);
		}else{
			if($("#newNoticeTimesContainer").length>0)
				$("#newNoticeTimesContainer").html("0");
			nownews=0;
			try{
				//停止播放
				document.getElementById("noticeSound").stop();
			}catch(e){}	
		}					
	}
}
//打开窗口
function openWindow_new(newhtml,strWidth,strHeight,newName){
	var wLeft,wTop,newName,wWidth,wHeight;

	if (parseInt(strWidth)>0)	wWidth = parseInt(strWidth);
	else	wWidth = 600;

	if (parseInt(strHeight)>0)	wHeight = parseInt(strHeight);
	else	wHeight = 400;

	wLeft = (screen.availWidth - wWidth)/2;
	wTop = (screen.availHeight - wHeight)/2;

	if(newName==null)
		newName = "w"+new Date().getTime();

	newwindow=window.open(newhtml,newName,'height='+wHeight+',width='+wWidth+',top='+wTop+',left='+wLeft+',status=no,toolbar=no,menubar=no,location=no,resizable=yes,scrollbars=1');
	if(newwindow!=null&&(!newwindow.closed)){
		newwindow.location.reload();
	}
	newwindow.focus();
}

$(function(){
	if(parent.inetframe.rows=="140,*,0"){
		toNormalView();
	}else{
		toSimpleView();
	}
	$(document).initlizationSystem("<w:url src="/monitor.do"/>");
	var current = $(".nav .nav_module a:first");
	current.addClass("choose");
	$(".itemnav").hide();
	$(".itemnav[module="+current.attr("name")+"]").show();
	$(".itemnav[module="+current.attr("name")+"] a[flag=item]:first").addClass("selectItem");
	$("#selectedFunctionName").text($(".itemnav[module="+current.attr("name")+"] a[flag=item]:first").text());
	$(".nav .nav_module a").click(function(){
		$(".nav .nav_module a").removeClass("choose");
		$(this).addClass("choose");
		$(".itemnav").hide();
		$(".itemnav[module="+$(this).attr("name")+"]").show();	
		$(".itemnav[module="+$(this).attr("name")+"] a[flag=item]").removeClass("selectItem");
		$(".itemnav[module="+$(this).attr("name")+"] a[flag=item]:first").addClass("selectItem");
		$("#selectedFunctionName").text($(".itemnav[module="+$(this).attr("name")+"] a[flag=item]:first").text());
	});
	
	$(".subnav a[flag=item]").click(function(){
		$(".subnav a[flag=item]").removeClass("selectItem");
		$(this).addClass("selectItem");
		$("#selectedFunctionName").text($(this).text());
	});
})
function convertView(){
	if(parent.inetframe.rows=="140,*,0"){
		toSimpleView();
	}else{
		toNormalView();
	}
}
function toNormalView(){
	parent.inetframe.rows="140,*,0";
	$(".status").show();
	$("#convert").html("精简版");
}
function toSimpleView(){
	parent.inetframe.rows="64,*,0";
	$(".status").hide();
	$("#convert").html("标准版");
}

var popmenu = null;
function onTopMenu(){
	if(popmenu==null){
		var popmenu = window.createPopup();
		$.post("<w:url src="/main.menu.do"/>",function(data){
			popmenu.document.write(data);
		})
	}
	popmenu.show(35,25,250,parent.document.body.clientHeight-50,document.body);	
}
function onSelectedFunctionName(mid,id,name,url){
	if(popmenu!=null){
		popmenu.hide();
	}
	$("#selectedFunctionName").text(name);
	$(".nav a").removeClass("choose");
	$(".nav a[name="+mid+"]").addClass("choose");	
	$(".itemnav").hide();
	$(".itemnav[module="+mid+"]").show();
	$(".itemnav[module="+mid+"] a[flag=item]").removeClass("selectItem");
	$(".itemnav[module="+mid+"] a[flag=item][item="+id+"]").addClass("selectItem");	
	parent.mainFrame.document.location = url;
}

</script>
</head>
<body class="bodybg">
	<!--头部开始-->
	<!--状态栏开始-->
	<div class="status">
		<img src="<w:url src="/themes/inet/images/logo_bg1.jpg"/>" style="float:left;"/>
        <div class="status_bg2">
        	<a href="javascript:window.parent.reInitlization();" class="status_btn1">首页</a>
        	<a href="<w:url src="/logout.do"/>" class="status_btn2" target="_parent" onfocus="this.blur()">注销</a>
        	<a href="javascript:window.parent.window.close();" class="status_btn3">退出</a>
        	<a href="<w:url src="/download/user_s_manual.doc"/>" class="status_btn4" onfocus="this.blur()" target="mainFrame">帮助</a>
        	<a href="<w:url src="/tdEquipment/tdEquipment.download.do?action=download"/>" class="status_btn5" target="mainFrame" onfocus="this.blur()">下载</a>
        	<span class="status_btn6">当前用户：<font color="#bc1b00"><b><f:loginInfo property="name"/></b></font>！在线时间：<span id="keeptimeContainer" style="color:#bc1b00;font-weight:bold;">00:00:00</span></span>
        </div>
    </div>
	<!--状态栏结束-->
	<!--菜单开始-->
	<div class="nav">
		<div class="nav_module">
		<w:iterator id="module" name="SYS_MODULES">
		<w:if test="${module.permitted}">
		<a name="<w:write name="module" property="id"/>" href="<w:root/>/main.index.do?id=<w:write name="module" property="id"/>" onfocus="this.blur()" target="mainFrame">
			<w:write name="module" property="name"/>
		</a>
		</w:if>
		</w:iterator>
		</div>
		<div class="nav_page" >
			<span id="newNoticeShowContainer" class="status_btn8">（<a href="javascript:openWindow('<w:url src="/message.do?action=query"/>')" class="fontorg"><span id="newNoticeTimesContainer">0</span></a>）<input id="noticeLastChangeTime" type="hidden"/></span>&nbsp;
			<a href="<w:url src="/auth/user.person.do?action=modify"/>" target="mainFrame" class="status_btn9" onfocus="this.blur()">个人设置</a>&nbsp;
			<a href="javascript:convertView();" class="status_btn7" onfocus="this.blur()" id="convert">标准版</a>
		</div>
	</div>
	<div class="subnav">
	<w:iterator id="module" name="SYS_MODULES"> 
		<span style="margin-left:20px;" module="<w:write name="module" property="id"/>" style="display:none" class="itemnav" >
			<!--img src="<w:url src="/themes/inet/images/icon_arrow03.gif"/>" style="vertical-align:middle;"/-->
			<!--w:write name="module" property="name" /-->
<w:iterator id="menu" name="module" property="menus">
	<w:iterator id="item" name="menu" property="items">
		<w:if test="${item.permitted}">	
			<a href="<w:root/><w:write name="item" property="url"/>" target="mainFrame" onfocus="this.blur()" flag="item" item="${item.id}">
				<span class="itemspan">
					<img src="<w:url src="/themes/inet/images/icon_arrow03.gif"/>" style="vertical-align:middle;"/>
					<w:write name="item" property="name"/>
				</span>
			</a>
		</w:if>
	</w:iterator>
</w:iterator>
		</span>
	</w:iterator>		
	</div>
</body>
<w:script/>
</html>
