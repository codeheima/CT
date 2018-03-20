package taiji.org.tools.http;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import taiji.org.tools.BeanUtil;
import taiji.org.tools.ComplexUtil;
import taiji.org.tools.Constants;
import taiji.org.tools.DateUtils;
import taiji.org.tools.EmptyUtil;
import taiji.org.tools.entity.FindEntity;
import taiji.org.tools.entity.FindEntity.FindOP;
import taiji.org.tools.entity.ResEntity;
import taiji.org.tools.entity.TempObj;
import taiji.org.tools.file.DFile;
import taiji.org.tools.file.FileMemory;
import taiji.snappy.db.DataObject;
import taiji.snappy.plugin.restask.service.DataImChatService;
import taiji.snappy.plugin.restask.service.ResSendService;

public class ChatchDataMemory {
	
	private static ChatchDataMemory chatchDataMemory = null;
	
	private static final Log log = LogFactory.getLog(ChatchDataMemory.class);
	
	private  List<ResEntity> qqSearch = ComplexUtil.list();
	
	private  List<ResEntity> weixinSearch = ComplexUtil.list();
	
	private  Map<String, String> idMap = ComplexUtil.map();
	
	public  HttpByHeader httpByHeader = new HttpByHeader();
	
	private  Map<String,FindEntity> targetFindMap = ComplexUtil.map();
	
	private static ResSendService resSendService = null;
	
	private List<DataObject> taskIdInfo = ComplexUtil.list();
	
	private static DataImChatService dataImChatService = null;
	
	static {
		resSendService = BeanUtil.getBean("resSendService", ResSendService.class);
		dataImChatService = BeanUtil.getBean("dataImChatService", DataImChatService.class);
	}
	
	private ChatchDataMemory(){
		
	}
	
	public static ChatchDataMemory getInstance(){
		if(null==chatchDataMemory){
			chatchDataMemory = new ChatchDataMemory();
		}
		return chatchDataMemory;
	}
	
	public  void initQQList(List<JSONObject> joList){
		if(EmptyUtil.isEmptyList(joList)) return;
		for(JSONObject jo :joList){
			jo.getJSONObject("resSendParams").accumulate("appTypes", "1030001").accumulate("appTypesStr", "QQ");
			
			ResEntity resEntity = new ResEntity(jo);
			qqSearch.add(resEntity);
		}
	}
	public  void initWeixinList(List<JSONObject> joList){
		if(EmptyUtil.isEmptyList(joList)) return;
		for(JSONObject jo :joList){
			jo.getJSONObject("resSendParams").accumulate("appTypes", "1030036").accumulate("appTypesStr", "微信");
			ResEntity resEntity = new ResEntity(jo);
			weixinSearch.add(resEntity);
		}
	}
	
	public  void resetqqList(){
		qqSearch.clear();
	}
	public  void resetWeiXinList(){
		weixinSearch.clear();
	}
	public  void downLoadDatas() throws InterruptedException{
		
		if(!EmptyUtil.isEmptyList(qqSearch)){
			for(final ResEntity entry:qqSearch){
				if("0".equals(entry.getTaskStatus())){
					Map<String, String> params = entry.getResearchSendMap();
					httpByHeader.doSend(false, "http://15.6.42.234:8080/inet/query/beginadvancequery", params, new HttpByHeader.GetCallBack() {
						
						@Override
						public void callback(boolean isSuccess, String str) {
							try{
								// str == "{\"result\":100007778144}";
					//			System.out.println(str);
								if(str.contains("result")){
									//认为查询成功:
									JSONObject json = JSONObject.fromObject(str);
									String targetId = json.getString("result");
									if("-1".equals(targetId)){
										resSendService.updateTaskStatus(entry.getId(), "2");
										return;
									}
									log.debug("下发查询成功:" + targetId);
									entry.setTaskStatus("1");
									entry.setResTargetId(targetId);
									idMap.put(targetId, entry.getId());
									resSendService.updateTaskStatus(entry.getId(), "1");
								}else{
									log.debug("下发查询失败:" + str);
									resSendService.updateTaskStatus(entry.getId(), "2");
								}
								
							}catch(Exception err){
								log.error("下发查询失败,未知异常:" + str, err);
								resSendService.updateTaskStatus(entry.getId(), "2");
							}
							
						}
					});
				}
				Thread.sleep(5000);
			}
		}
		if(!EmptyUtil.isEmptyList(weixinSearch)){
			for(final ResEntity entry:weixinSearch){
				if("0".equals(entry.getTaskStatus())){
					Map<String, String> params = entry.getResearchSendMap();
					httpByHeader.doSend(false, "http://15.6.42.234:8080/inet/query/beginadvancequery", params, new HttpByHeader.GetCallBack() {
						
						@Override
						public void callback(boolean isSuccess, String str) {
							try{
								// str == "{\"result\":100007778144}";
								//			System.out.println(str);
								if(str.contains("result")){
									JSONObject json = JSONObject.fromObject(str);
									String targetId = json.getString("result");
									if("-1".equals(targetId)){
										resSendService.updateTaskStatus(entry.getId(), "2");
										return;
									}
									log.debug("下发查询成功:" + targetId);
									entry.setTaskStatus("1");
									entry.setResTargetId(targetId);
									idMap.put(targetId, entry.getId());
									resSendService.updateTaskStatus(entry.getId(), "1");
								}else{
									log.debug("下发查询失败:" + str);
									resSendService.updateTaskStatus(entry.getId(), "2");
								}
								
							}catch(Exception err){
								log.error("下发查询失败,未知异常:" + str, err);
								resSendService.updateTaskStatus(entry.getId(), "2");
							}
							
						}
					});
				}
				Thread.sleep(5000);
			}
		}
		Thread.sleep(300000);
		String createTime = DateUtils.formatDate(DateUtils.addHour(new Date(), -10), DateUtils.SHORT_DATE_FORMAT);
		fillTargetFindMap(createTime);
		while(!EmptyUtil.isEmptyList(qqSearch)){
			getQQDatas();
			Thread.sleep(5000);
		}
		while(!EmptyUtil.isEmptyList(weixinSearch)){
			getWeixinDatas();
			Thread.sleep(5000);
		}
		resetqqList();
		resetWeiXinList();
		targetFindMap.clear();
		idMap.clear();
		if(!EmptyUtil.isEmptyList(taskIdInfo)){
			for(DataObject data:taskIdInfo){
				String taskId = data.getString("taskId");
				String startTime = data.getString("startTime");
				String endTime = data.getString("endTime");
				List<DataObject> list = ComplexUtil.list();
				DataObject tempdata;
				try {
					tempdata = resSendService.findDataById(taskId);
					list.add(tempdata);
					resSendService.departCatchData(list, startTime,endTime);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		taskIdInfo.clear();
		
	}
	
	public  void getWeixinDatas() throws InterruptedException{
		weixinSearch = doSomeCatch(weixinSearch);
			
	}
	
	public  void getQQDatas() throws InterruptedException{
		
		qqSearch = doSomeCatch(qqSearch);
		
		
	}
	private List<ResEntity> doSomeCatch(List<ResEntity> qqSearch) throws InterruptedException{
		if(EmptyUtil.isEmptyList(qqSearch)){
			return null;
		}
		List<ResEntity> tempList = ComplexUtil.list();
		for(final ResEntity entry:qqSearch){
			String taskStatus = entry.getTaskStatus();
			if("1".equals(taskStatus)){
				String targetId = entry.getResTargetId();
				String taskId = entry.getId();
				FindEntity findEntity = targetFindMap.get(targetId);
				if(findEntity==null){
					continue;
				}
				
				log.debug("开始下载数据：" + entry.getResSendParams().optString("paramValue") + "=" + findEntity.getUserRemark());
				long l1 = System.currentTimeMillis();
				boolean isResRunning = findEntity.isResRunning();
				if(isResRunning){
					String createTime = DateUtils.formatDate(DateUtils.addHour(new Date(), -10), DateUtils.SHORT_DATE_FORMAT);
					fillTargetFindMap(createTime);
					tempList.add(entry);
					continue;
				}
				String status = findEntity.getStatus();
				if("401".equals(status)||"501".equals(status)){
					resSendService.updateTaskStatus(entry.getId(), "2");
					continue;
				}
				FindOP op = findEntity.getOpMap().get("11500008");
				//有数据
				Map<String,String> params = getSendParams(entry.getResSendParams(),op);
				
				params.put("keyWord", "");
				params.put("page", "1");
				params.put("pagesize", "10");
				params.put("_", String.valueOf(System.currentTimeMillis()));
				final TempObj tempObj= new TempObj();
				httpByHeader.doSend(false, Constants.URL_RES_GROUPCHAT + HttpByHeader.getUriParams(params), null, new HttpByHeader.GetCallBack() {
					public void callback(boolean isSuccess, String str) {
						try{
							tempObj.target = Integer.valueOf(JSONObject.fromObject(str).
									getJSONObject("result").getInt("totalrows"));
							tempObj.isSuccess = true;
						}catch(Exception err){
							resSendService.updateTaskStatus(entry.getId(), "2");
							entry.setTaskStatus("2");
							log.error("未知异常", err);
						}
					}
				});
				if(!tempObj.isSuccess){
					log.error("获取失败：处理好友信息");
					continue;
				}
				log.debug("获取成功[群聊关系]:totalrows=" + tempObj.target);
				int chatRelationCount =(Integer) tempObj.target;
				String startTime = "";
				chatRelationCount = afterTotalrows(chatRelationCount,entry.getResSendParams(),op);
				int pageMax = 100;
				try{
					if(chatRelationCount <= pageMax){
						startTime = downloadDetailData(params,1,chatRelationCount,taskId);
					}else{
						int pageSize = pageMax;
						for(int page = 1; ; page++){
							boolean isBreak = false;
							if(page* pageMax > chatRelationCount){
								isBreak = true;
								//			pageSize = recordCount - ((page-1)*pageMax);
							}
							startTime = downloadDetailData(params,page,pageSize,taskId);
							if(isBreak)
								break;
						}
					}
				}catch(Exception err){
					resSendService.updateTaskStatus(entry.getId(), "2");
					entry.setTaskStatus("2");
					log.error("好友信息查询异常", err);
				}
				entry.setTaskStatus("3");//3表示数据爬取完成
				resSendService.updateTaskStatus(taskId, "3");
				resSendService.updateLastTime(startTime, taskId);
				long l2 = System.currentTimeMillis();
				log.debug("综合查询的群聊下载耗时："+ (l2-l1));
				String resultNum = findEntity.getResultNum();
				if(Constants.DEFAULT_CATCH_NUMBER==Integer.parseInt(resultNum)){
					DataObject obj = new DataObject();
					obj.setValue("taskId", taskId);
					obj.setValue("startTime", startTime);
					obj.setValue("endTime", entry.getResSendParams().optString("endTimeStr"));
					taskIdInfo.add(obj);
					
				}
				
			}
			Thread.sleep(5000);
		}
		return tempList;
		
	}

	
	private  void downloadDetailData(final Map<String, String> params,
			int page, int pageSize, int chatRelationCount,final String taskId) {
		params.put("page", String.valueOf(page));
		params.put("pagesize", String.valueOf(pageSize));
		httpByHeader.doSend(false, Constants.URL_RES_GROUPCHAT + HttpByHeader.getUriParams(params), null, new HttpByHeader.GetCallBack() {
			public void callback(boolean isSuccess, String str) {
				try{
					JSONArray jsonArray = JSONArray.fromObject(JSONObject.fromObject(str).getJSONObject("result").get("results"));
					List<DataObject> resultList = ComplexUtil.list();
					for (int i = 0; i < jsonArray.size(); i++) {
						final DataObject data = new DataObject();
						JSONObject jo = jsonArray.getJSONObject(i);
						parseChatFiles(data,jo);
						resultList.add(data);
						
					}
					//TODO去掉时间小于该taskId对应最后爬取时间的数据,去重怎么做？
					dealResultList(resultList,taskId);
					DataObject data = resultList.get(0);
					String lastTime = DateUtils.formatDate(data.getLong("sendTime")*1000l, DateUtils.SHORT_DATE_FORMAT);
					resSendService.updateLastTime(lastTime,taskId);
					dataImChatService.doSomeDbService(resultList);
					List<DataObject> list = ComplexUtil.list();
					DataObject tempdata = resSendService.findDataById(taskId);
					list.add(tempdata);
					resSendService.departCatchData(list, lastTime, params.get("endTimeStr"));
					resSendService.updateTaskStatus(taskId, "3");
				}catch(Exception err){
					resSendService.updateTaskStatus(taskId, "2");
					log.error("未知异常", err);
				}
			}

		});
	}
	protected void dealResultList(List<DataObject> resultList, String taskId) {
		
		try {
			DataObject taskData = resSendService.findDataById(taskId);
			final String lastTimeStr = taskData.getString("lastTime");
			if(!EmptyUtil.isEmptyStr(lastTimeStr)){
				resultList = ComplexUtil.findList(resultList, new ComplexUtil.FindData<DataObject>() {
					@Override
					public boolean find(DataObject d) {
						String lastTime = DateUtils.formatDate(d.getLong("sendTime")*1000l, DateUtils.SHORT_DATE_FORMAT);
						return lastTime.compareTo(lastTimeStr)>0;
					}
				});
			}
			Collections.sort(resultList, new Comparator<DataObject>() {

				@Override
				public int compare(DataObject o1, DataObject o2) {
					
					return (int) (o1.getLong("sendTime")-o2.getLong("sendTime"));
				}
			});
		} catch (Exception e) {
			resSendService.updateTaskStatus(taskId, "2");
			e.printStackTrace();
		}
		
	}

	private void parseChatFiles(final DataObject data, JSONObject jo) {
		data.put("sendId", EmptyUtil.isEmptyStr(jo.optString("sendUserId"))?jo.optString("sendAppId"):jo.optString("sendUserId"));
		data.put("appType", jo.optString("appType"));
		data.put("chatType", jo.optString("type"));
		data.put("action", "13");
		data.put("groupId", jo.optString("groupId"));
		data.put("sendTime", jo.optString("captureTime"));
		data.put("fromId", jo.optString("fromId"));
		data.put("fromUsername", jo.optString("fromUsername"));
		data.put("toId", jo.optString("toId"));
		data.put("toUsername", jo.optString("toUsername"));
		data.put("context", jo.optString("content"));
		data.put("transFile", jo.optString("transFile"));
		data.put("captureTimeStr", jo.optString("captureTimeStr"));
		data.put("sendIpStrArea", jo.optString("sendIpStrArea"));
		data.put("sendIpStr", jo.optString("sendIpStr"));
		data.put("mainFile", "");
		if(hasAccess(jo)){
			httpByHeader.downLoadFile(false, jo.getString("transFile"), new HttpByHeader.GetCallBack(){
				public void callback(boolean isSuccess,	String uri) {
					if(isSuccess){
						DFile df = FileMemory.getDFile(uri);
						data.put("mainFile",df.getPath());
						
					}
				}
			});
		}
		
	}

	private  String downloadDetailData(final Map<String, String> params, int page, int pageSize,final String taskId) {
		params.put("page", String.valueOf(page));
		params.put("pagesize", String.valueOf(pageSize));
		final List<String> groupIds = new ArrayList<String>();
		List<String> timeList = ComplexUtil.list();
		final List<DataObject> resultList = ComplexUtil.list();
		httpByHeader.doSend(false, Constants.URL_RES_GROUPCHAT + HttpByHeader.getUriParams(params), null, new HttpByHeader.GetCallBack() {
			public void callback(boolean isSuccess, String str) {
				try{
					JSONArray jsonArray = JSONArray.fromObject(JSONObject.fromObject(str).getJSONObject("result").get("results"));
					for (int i = 0; i < jsonArray.size(); i++) {
						JSONObject jo = jsonArray.getJSONObject(i);
						if(jo.optInt("groupcnt")>1){
							groupIds.add(jo.getString("groupId"));
						}else{
							DataObject data = new DataObject();
							parseChatFiles(data,jo);
							resultList.add(data);
						}
						
					}
				}catch(Exception err){
					resSendService.updateTaskStatus(taskId, "2");
					log.error("未知异常", err);
				}
			}
		});
		dealResultList(resultList,taskId);
		DataObject data = resultList.get(0);
		String lastTime = DateUtils.formatDate(data.getLong("sendTime")*1000l, DateUtils.SHORT_DATE_FORMAT);
		timeList.add(lastTime);
		dataImChatService.doSomeDbService(resultList);
		for(String groupId : groupIds){
			Map<String,String> paramsDetail = params;
			paramsDetail.put("groupId", groupId);
			paramsDetail.put("keyWord", "");
			paramsDetail.put("secKeyWord", "");
			paramsDetail.put("page", "1");
			paramsDetail.put("pagesize", "2");
			paramsDetail.put("sort", "desc");
			paramsDetail.put("valueType", "1");
			paramsDetail.put("_", String.valueOf(System.currentTimeMillis()));
			
			final TempObj tempObjDetail = new TempObj();
			httpByHeader.doSend(false, Constants.URL_RES_GROUPCHAT_DETAIL + HttpByHeader.getUriParams(paramsDetail), null, new HttpByHeader.GetCallBack() {
				public void callback(boolean isSuccess, String str) {
					try{
						tempObjDetail.target = Integer.valueOf(JSONObject.fromObject(str).getJSONObject("result").getInt("totalrows"));;
						tempObjDetail.isSuccess = true;
					}catch(Exception err){
						resSendService.updateTaskStatus(taskId, "2");
						log.error("未知异常", err);
					}
				}
			});
			
			if(!tempObjDetail.isSuccess){
				log.error("获取失败：处理好友信息");
				break;
			}
			log.debug("获取成功[群聊具体内容]:totalrows=" + tempObjDetail.target);
			int chatDetailCount =(Integer) tempObjDetail.target;
			
			if(chatDetailCount <=0){
				break;
			}
			int pageMax = 300;
			if(chatDetailCount <= pageMax){
				String endTimeStr = downloadDetailDataByPage(paramsDetail,1,chatDetailCount,taskId);
				timeList.add(endTimeStr);
			}else{
				pageSize = pageMax;
				for(int p = 1; ; p++){
					boolean isBreak = false;
					if(p* pageMax > chatDetailCount){
						isBreak = true;
					}
					String endTimeStr = downloadDetailDataByPage(paramsDetail,p,pageSize,taskId);
					timeList.add(endTimeStr);
					if(isBreak)
						break;
				}
			}
		}//for(String groupId : groupIds)
		Collections.sort(timeList, new Comparator<String>() {

			@Override
			public int compare(String arg0, String arg1) {

				return arg1.compareTo(arg0);
			}
		});
		return timeList.get(0);
		
	}
	private String downloadDetailDataByPage(Map<String, String> params,
			int page, int pageSize,final String taskId) {
		params.put("_", String.valueOf(System.currentTimeMillis()));
		params.put("pagesize", String.valueOf(pageSize));
		params.put("page", String.valueOf(page));
		final String[] arrStr = new String[1];
		httpByHeader.doSend(false, Constants.URL_RES_GROUPCHAT_DETAIL + HttpByHeader.getUriParams(params), null, new HttpByHeader.GetCallBack() {
			public void callback(boolean isSuccess, String str) {
				try{
					JSONObject json = JSONObject.fromObject(str);
					JSONArray arr = json.optJSONObject("result").optJSONArray("results");
					List<DataObject> resultList = ComplexUtil.list();
					for (int i = 0; i < arr.size(); i++) {
						DataObject data = new DataObject();
						JSONObject jo = arr.getJSONObject(i);
						parseChatFiles(data,jo);
						resultList.add(data);
						
					}
					dealResultList(resultList, taskId);
					DataObject data = resultList.get(0);
					String lastTime = DateUtils.formatDate(data.getLong("sendTime")*1000l, DateUtils.SHORT_DATE_FORMAT);
					arrStr[0] = lastTime;
					resSendService.updateLastTime(lastTime,taskId);
					dataImChatService.doSomeDbService(resultList);
				}catch(Exception err){
					resSendService.updateTaskStatus(taskId, "2");
					log.error("未知异常", err);
				}
			}
		});
		return arrStr[0];
		
	}

	private  void fillTargetFindMap(String createTime) {

		final TempObj tempObj= new TempObj();
		Map<String,String> params = ComplexUtil.map();
//		params.put("appType","");
		params.put("_", String.valueOf(System.currentTimeMillis()));
		params.put("pagesize", "2");
		params.put("page", "1");
		params.put("startTime", createTime); //zdrWx.optString("targetStartTime"));
		
		httpByHeader.doSend(false, Constants.URL_RES_FIND_HIS_LIST + HttpByHeader.getUriParams(params), null, new HttpByHeader.GetCallBack() {
			public void callback(boolean isSuccess, String str) {
				try{
					tempObj.target = Integer.valueOf(JSONObject.fromObject(str).getJSONObject("result").getInt("totalrows"));
					tempObj.isSuccess = true;
				}catch(Exception err){
					
				}
			}
		});
		
		if(!tempObj.isSuccess){
			log.error("获取失败：历史查询列表");
			return;
		}
		log.debug("获取成功[历史查询列表]:totalrows=" + tempObj.target);
		
		int recordCount =(Integer) tempObj.target;
		
		if(recordCount <=0){
			return;
		}
		targetFindMap.clear();
		
		int pageMax = 100;
		
		if(recordCount <= pageMax){
			fillFindResult(params,1,recordCount);
		}else{
			int pageSize = pageMax;
			for(int page = 1; ; page++){
				boolean isBreak = false;
				if(page* pageMax > recordCount){
					isBreak = true;
		//			pageSize = recordCount - ((page-1)*pageMax);
				}
				fillFindResult(params,page,pageSize);
				if(isBreak)
					break;
			}
		}
		
	}


	private  void fillFindResult(Map<String, String> params, int page,
			int pageSize) {
		params.put("_", String.valueOf(System.currentTimeMillis()));
		params.put("pagesize", String.valueOf(pageSize));
		params.put("page", String.valueOf(page));
		
		httpByHeader.doSend(false, Constants.URL_RES_FIND_HIS_LIST + HttpByHeader.getUriParams(params), null, new HttpByHeader.GetCallBack() {
			public void callback(boolean isSuccess, String str) {
				try{
					JSONObject json = JSONObject.fromObject(str);
					JSONArray arr = json.optJSONObject("result").optJSONArray("results");
					for(int i = 0; i < arr.size(); i++){
						JSONObject resJo = arr.getJSONObject(i);
						FindEntity findEntity = new FindEntity(resJo);
						targetFindMap.put(findEntity.getGroupopId(), findEntity);
					}
				}catch(Exception err){
					log.error("未知异常", err);
				}
			}
		});
		
	}
	
	private Map<String, String> getSendParams(JSONObject jo,FindOP op) {
		Map<String,String> params = ComplexUtil.map();
		params.put("appType", op.appType);
		params.put("opId", op.opid);
		
		String endTimeStr = jo.optString("endTimeStr");
		//Date end = DateUtils.parseDate(endTimeStr, DateUtils.SHORT_DATE_FORMAT);
		String startTimeStr = jo.optString("startTimeStr");
		//Date start = DateUtils.parseDate(startTimeStr, DateUtils.SHORT_DATE_FORMAT);
		
		params.put("startTimeStr", startTimeStr);
		params.put("endTimeStr", endTimeStr);
		params.put("sort", "desc");
		
		
		return params;
	}
	
	public  int afterTotalrows(int totals,JSONObject jo,FindOP op) {

		int countSame = 0;
		while(true){
			
			Map<String,String> params = getSendParams(jo,op);
			
			params.put("keyWord", "");
			params.put("page", "1");
			params.put("pagesize", "10");
			params.put("_", String.valueOf(System.currentTimeMillis()));
			final TempObj tempObj= new TempObj();
			
			httpByHeader.doSend(false, Constants.URL_RES_GROUPCHAT + HttpByHeader.getUriParams(params), null, new HttpByHeader.GetCallBack() {
				public void callback(boolean isSuccess, String str) {
					try{
						System.out.println(str);
						tempObj.target = Integer.valueOf(JSONObject.fromObject(str).getJSONObject("result").getInt("totalrows"));
						tempObj.isSuccess = true;
					}catch(Exception err){
						log.error("未知异常", err);
					}
				}
			});
			
			if(tempObj.isSuccess == false){
				return totals;
			}
			
			int chatRelationCount =(Integer) tempObj.target;
			if(chatRelationCount ==totals ){
				countSame++;
			}else{
				totals = chatRelationCount;
				countSame = 0;
			}
			
			if(countSame == 2){
				//如果有3次取值都相同，则认为无新数据进来，继续。
				return chatRelationCount;
			}
			
		}
		
	}
	private boolean hasAccess(JSONObject jo) {
		String appType = jo.getString("appType");
		String mediaType = jo.getString("mediaType");
		String transFile = jo.getString("transFile");
		if("1030036".equals(appType)){
			if(Constants.mediaType_pic.equals(mediaType)
					|| Constants.mediaType_voice.equals(mediaType)
					|| Constants.mediaType_av.equals(mediaType)){
				if(!EmptyUtil.isEmptyStr(transFile)){
					return true;
				}
			}
		}
		return false;
	}
	

}
