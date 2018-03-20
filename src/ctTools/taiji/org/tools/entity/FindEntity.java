package taiji.org.tools.entity;

import java.util.List;
import java.util.Map;

import taiji.org.tools.ComplexUtil;
import taiji.org.tools.EmptyUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



/**
  	"caseId" : 48446,
	"caseStatus" : 0,
	"groupopId" : 100008313019,
	"appType" : "1030036",
	"appName" : "全部",
	"optype" : "Query",
	"opTimeStr" : null,
	"status" : 3020,
	"opDesc" : "全部",
	"statusTranslate" : "查询成功"
	"userId" : 108871,
	"userName" : "zj33028651",
	"userRemark" : "用户帐号:1554792611",
	"ops" : [
		{
			public String opid;
			public String sourceCode;
			public String sourceName;
			public String status;
			public String statusTranslate;  
			public String appType;
			public String createTimeStr;
		},
		...
	]
 * @author Archmage
 */
public class FindEntity {
	
	public static final String sourceCode_zhuce = "11500001";
	public static final String sourceCode_friend = "11500002";
	public static final String sourceCode_loginlog = "11500003";
	public static final String sourceCode_groupMember = "11500007";
	
	public static final String sourceCode_joingroup = "11500037";
	public static final String sourceCode_onoffline = "11500050";
	public static final String sourceCode_identityrelation = "11500012";
	public static final String sourceCode_hardwarefeature = "11500013";
	public static final String sourceCode_groupmessage = "11500006";
	public static final String sourceCode_groupchat = "11500008";
	public static final String sourceCode_friendcircle = "11500044";
	
	
	
	private Map<String,FindOP> opMap = ComplexUtil.map();
	private List<FindOP> ops = ComplexUtil.list();
	
	private String groupopId;
	private String caseId;
	private String caseStatus;
	
	private String appType;
	private String optype;
	
	private String resultNum;
	
	/**
	 * 查询状态
	 * 6010 : 查询排队中
	 * 3020 : 查询成功
	 * 4010 : 查询失败
	 * 5010 : 部分成功
	 * 2010 : 查询中
	 * -----------------
	 * 302 : 查询成功
	 * 501 : 查询异常
	 * 201 : 查询中       (data[i].status==301||data[i].status==201||data[i].status==202||data[i].status==203)
	 * 200 : 排队中
	 * @return
	 */
	private String status;

	private String statusTranslate;
	
	private String userId;
	private String userName;
	private String userRemark;
	
	
	public FindEntity(JSONObject json){
		groupopId = json.optString("groupopId");
		caseId = json.optString("caseId");
		caseStatus = json.optString("caseStatus");
		
		appType = json.optString("appType");
		optype = json.optString("optype");
		
		status = json.optString("status");
		statusTranslate = json.optString("statusTranslate");
		
		userId = json.optString("userId");
		userName = json.optString("userName");
		userRemark = json.optString("userRemark");
		
		resultNum = json.optString("resultNum");
		
		
		JSONArray opts = json.optJSONArray("ops");
		if(!EmptyUtil.isEmptyList(opts)){
			for(int i = 0; i< opts.size(); i++){
				JSONObject opJson = opts.getJSONObject(i);
				FindOP op = new FindOP(opJson,this);
				opMap.put(op.sourceCode, op);
				ops.add(op);
			}
		}
		
	}
	
	
	public String getResultNum() {
		return resultNum;
	}

	public void setResultNum(String resultNum) {
		this.resultNum = resultNum;
	}


	public class FindOP{
		public String opid;
		/** "sourceCode" : "11500002", */
		public String sourceCode;
		/** "sourceName" : "好友信息", */
		public String sourceName;
		/** 
		 * "status" : 302, 
		 * 302 : 查询成功
		 * 501 : 查询异常
		 * 201 : 查询中
		 */
		public String status;
		/** "statusTranslate" : "查询成功" */
		public String statusTranslate;  
		/** "appType" : "1030036" */
		public String appType;
		
		public String createTimeStr;
		
		public FindEntity outer= null;
		
		public FindOP(JSONObject json, FindEntity outer){
			opid = json.optString("opid");
			sourceCode = json.optString("sourceCode");
			sourceName = json.optString("sourceName");
			status = json.optString("status");
			statusTranslate = json.optString("statusTranslate");
			appType = json.optString("appType");
			createTimeStr = json.optString("createTimeStr");
			this.outer = outer;
			
		}

		public boolean isResSuccess() {
			return "302".equals(status);
		}
		public boolean isResSearching() {
			boolean isResSearching = false;
			if("201".equals(status) ||  "200".equals(status) || "301".equals(status)){
				isResSearching = true;
			}
			return isResSearching;
		}
		
	}
	
	
	
	public Map<String, FindOP> getOpMap() {
		return opMap;
	}

	public String getGroupopId() {
		return groupopId;
	}

	public void setGroupopId(String groupopId) {
		this.groupopId = groupopId;
	}
	public String getCaseId() {
		return caseId;
	}

	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}



	public String getCaseStatus() {
		return caseStatus;
	}



	public void setCaseStatus(String caseStatus) {
		this.caseStatus = caseStatus;
	}



	public String getAppType() {
		return appType;
	}



	public void setAppType(String appType) {
		this.appType = appType;
	}



	public String getOptype() {
		return optype;
	}



	public void setOptype(String optype) {
		this.optype = optype;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getStatusTranslate() {
		return statusTranslate;
	}



	public void setStatusTranslate(String statusTranslate) {
		this.statusTranslate = statusTranslate;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserRemark() {
		return userRemark;
	}
	public void setUserRemark(String userRemark) {
		this.userRemark = userRemark;
	}

	/**
	 * @return 查询是否正在执行中....
	 */
	public boolean isResRunning() {
		/**
		 * 查询状态
		 * 6010 : 查询排队中
		 * 3020 : 查询成功
		 * 4010 : 查询失败
		 * 5010 : 部分成功
		 * 2010 : 查询中
		 * -----------------
		 * 302 : 查询成功
		 * 501 : 查询异常
		 * 401  ： 查询失败
		 * 201 : 查询中
		 * 200 : 排队中
		 */
		if(EmptyUtil.isEmptyStr(status)){
			return true;
		}
		if("2010".equals(status)){
			return true;
		}if("6010".equals(status)){
			return true;
		}
		for(FindOP op : ops){
			if(!"201".equals(op.status) && !"200".equals(op.status)){
				return false;
			}
		}
		return false;
	}
	
	

}
