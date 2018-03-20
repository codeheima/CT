package taiji.org.tools.entity;

import java.util.Map;

import net.sf.json.JSONObject;
import taiji.org.tools.ComplexUtil;
import taiji.org.tools.DateGet;
import taiji.org.tools.EmptyUtil;


/**
	"id" : "4028812f55de20d60155de45dba913f2",
	"resResultTime" : null,
	"resCreateTime" : "2016-07-12 16:42:48",
	"resSendParams" : {
		"appTypes" : "1220007",
		"appTypesStr" : "淘宝",
		"caseId" : "48451",
		"caseName" : "余姚重点人",
		"location" : "",
		"locationStr" : "未选择",
		"paramCode" : "accountname",
		"paramName" : "用户帐号",
		"paramValue" : "",
		"queryType" : "beginadvancequery",
		"sourceCodes" : "11500001,11500003",
		"sourceCodesStr" : "注册信息,登录日志"
	},
	"resTargetId" : null
	RES_CREATE_VALUE = QQ:6574321(手机号码)
	resCreateValue
	"child" : [{
					"rmrId" : "4028812f5600f8a1015600f9bc551299",
					"sourcecode" : "11500001",
					"sourcecodeName" : "注册信息"
				}, {
					"rmrId" : "4028812f5600f8a1015600fa161a129b",
					"sourcecode" : "11500002",
					"sourcecodeName" : "好友信息"
				}, {
					"rmrId" : "4028812f5600f8a1015600f9c3a0129a",
					"sourcecode" : "11500003",
					"sourcecodeName" : "登录日志"
				}
			]
	
 	@author Archmage
 */
public class ResEntity {
	public static final String SEND_TYPE_targetId = "targetId";
	public static final String SEND_TYPE_runStatus = "runStatus";
	public static final String SEND_TYPE_changeRmrSuccessTime = "changeRmrSuccessTime";
	
	public static final String SEND_TYPE_DATA_zhuce = "zhuce";
	public static final String SEND_TYPE_DATA_friend = "friend";
	public static final String SEND_TYPE_DATA_loginLog = "loginLog";
	public static final String SEND_TYPE_GroupMember = "groupMember";
	
	public static final String SEND_TYPE_DATA_joingroup = "joinGroup";
	public static final String SEND_TYPE_DATA_onoffline = "onoffline";
	public static final String SEND_TYPE_DATA_identityrelation = "identityrelation";
	public static final String SEND_TYPE_DATA_hardwarefeature = "hardwarefeature";
	public static final String SEND_TYPE_DATA_groupmessage = "groupmessage";
	public static final String SEND_TYPE_DATA_groupchat = "groupchat";
	public static final String SEND_TYPE_DATA_friendcircle = "friendcircle";
	
	
	private String id = null;
	private JSONObject resSendParams  = null;
	private String resTargetId  = null;
	private String taskStatus = null;
	/**
	 * 是否存在目标id
	 */
	private boolean hasTargetId = false;
	/**
	 * 是否存在目标id
	 */
	private boolean isInit = false;
	
	
	public ResEntity(JSONObject json){
		setResTargetId(json.optString("resTargetId",""));
		id = json.optString("id");
		taskStatus = json.optString("taskStatus");
		resSendParams = json.optJSONObject("resSendParams");
		
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public JSONObject getResSendParams() {
		return resSendParams;
	}

	public void setResSendParams(JSONObject resSendParams) {
		this.resSendParams = resSendParams;
	}

	public String getResTargetId() {
		return resTargetId;
	}

	public void setResTargetId(String resTargetId) {
		this.resTargetId = resTargetId;
		if(EmptyUtil.isEmptyStr(this.resTargetId) || this.resTargetId.equals("null")){
			hasTargetId = false;
		}else{
			hasTargetId = true;
		}
	
	}

	public boolean isInit() {
		return isInit;
	}


	public boolean isHasTargetId() {
		return hasTargetId;
	}

	/**
	 * 处理发送查询的相关参数
	 * 
	 * @return
	 */
	public Map<String, String> getResearchSendMap() {
		Map<String, String> params = ComplexUtil.map();
		/*
		"resSendParams" : {
			"appTypes" : "1030036",
			"appTypesStr" : "微信",
			"caseId" : "48446",
			"caseName" : "宁海重点人",
			"location" : "",
			"locationStr" : "未选择",
			"paramCode" : "userid",
			"paramName" : "用户ID",
			"paramValue" : "1233",
			"queryType" : "beginadvancequery",
			"sourceCodes" : "11500001,11500003,11500002",
			"sourceCodesStr" : "注册信息,登录日志,好友信息"
		}
		------------------------------------------
		params.put("appTypes", "1030001");
		params.put("appTypesStr", "QQ");
		params.put("caseId", "48449");
		params.put("caseName", "奉化重点人");
		params.put("endTime", "1467775273");
		params.put("endTimeStr", "2016-07-06 10:38:27");
		params.put("location", "");
		params.put("locationStr", "未选择");
		params.put("paramCode", "accountname");
		params.put("paramName", "用户帐号");
		params.put("paramValue", "1554792615");
		params.put("queryType", "beginadvancequery");
		params.put("sourceCodes", "11500001,11500002,11500003");
		params.put("sourceCodesStr", "注册信息,好友信息,登录日志");
		params.put("startTimeStr", "2016-07-03 10:38:28");
		params.put("startTime", "1467516074");
		params.put("taskId", "0");
		params.put("userId", "0");
		params.put("_", "1467775468343");
		*/
		
		String endTimeStr = resSendParams.optString("endTimeStr");
		String startTimeStr = resSendParams.optString("startTimeStr");
		
		params.put("appTypes", resSendParams.optString("appTypes"));
		params.put("appTypeNames", resSendParams.optString("appTypesStr"));
		params.put("caseId", resSendParams.optString("caseId"));
		params.put("caseName",  resSendParams.optString("caseName"));
		params.put("endTime", String.valueOf(DateGet.timeDateStrToLong(endTimeStr)));
		params.put("endTimeStr", endTimeStr);
		params.put("location", "");
		params.put("remark", resSendParams.optString("resmark"));
		params.put("locationStr", "未选择");
		params.put("paramCode", resSendParams.optString("paramCode"));
		params.put("paramName", resSendParams.optString("paramName"));
		params.put("paramValue",resSendParams.optString("paramValue"));
		params.put("queryType", "beginadvancequery");
		params.put("sourceCodes", resSendParams.optString("sourceCodes"));
		params.put("sourceCodesStr", resSendParams.optString("sourceCodesStr"));
		params.put("startTimeStr",startTimeStr);
		params.put("startTime",  String.valueOf(DateGet.timeDateStrToLong(startTimeStr))); // String.valueOf(start.getTime()/1000));
		params.put("_", String.valueOf(System.currentTimeMillis()));
		
		resSendParams = JSONObject.fromObject(params);
		
		return params;
	}//end getResearchSendMap


	public String getTaskStatus() {
		return taskStatus;
	}


	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}
	
	

}
