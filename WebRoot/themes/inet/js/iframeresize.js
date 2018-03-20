function parentFrameResize(){
	//var targWin = self.parent.document.all[self.name];
	var targWin = $(window.parent.document).find("iframe[name="+self.name+"]")[0];
	if(targWin != null) {
		if(!(targWin.resize && targWin.resize=="false")){
			var heightValue = self.document.body.scrollHeight
			if(heightValue < 50){
				//不小于350
				heightValue = 50;
			}
			targWin.style.pixelHeight = heightValue;
		}
		if(self.parent.onFrameResize){
			self.parent.onFrameResize(self.name);
		}
	}
}
function fixFrameSize(){
	if(top==this){
		$("#functionName").show();
	}
	if(self.frameElement && self.frameElement.tagName=="IFRAME"){ 
		//页面在iframe中时处理
		window.onload = parentFrameResize;
		window.onresize = parentFrameResize;
	} 
}