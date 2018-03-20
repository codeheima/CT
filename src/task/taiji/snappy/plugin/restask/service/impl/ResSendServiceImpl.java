package taiji.snappy.plugin.restask.service.impl;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import taiji.org.tools.ComplexUtil;
import taiji.org.tools.Constants;
import taiji.org.tools.DateUtils;
import taiji.org.tools.EmptyUtil;
import taiji.org.tools.http.ChatchDataMemory;
import taiji.snappy.db.DataObject;
import taiji.snappy.db.Result;
import taiji.snappy.plugin.restask.service.ResSendService;
import taiji.snappy.web.dictionary.Dictionary;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.web.pagination.WebPagination;
import taiji.snappy.webcore.DictionaryPool;
import taiji.snappy.webcore.service.SnappydbServiceTemplate;

/**
 * 
 * 
 * @author 
 */
public class ResSendServiceImpl extends SnappydbServiceTemplate implements ResSendService{
	
	private String endTimeStr = "";

	//查询
	public Result query(PageValues values) throws Exception{
		
		return this.executeQuery("ctdb.resSendTask.query", prepareQueryParameter(values));
	}
	
	//查询
	public WebPagination query(PageValues values, int currentPage, int pageSize) throws Exception{
		
		WebPagination wepg = this.executeQuery("ctdb.resSendTask.query", prepareQueryParameter(values), currentPage, pageSize);
		
		return wepg;
	}
	
	//处理传入查询条件
	private DataObject prepareQueryParameter(PageValues values) throws Exception{
		
		return new DataObject(values.getValues());
	}

	//根据主键查询
	public DataObject findDataById(String id) throws Exception {
		return this.findById("ctdb.resSendTask",id);
	}
	
	//根据多个主键查询
	public List<DataObject> findDataByIds(String[] ids) throws Exception{
		return this.findByIds("ctdb.resSendTask",ids);
	}



	//根据主键删除
	public String deleteDataById(String id) throws Exception {
		this.delete("ctdb.resSendTask",id);	
		return null;
	}
	
	//删除指定的记录
	public String deleteDataByIds(String[] ids) throws Exception {
		this.delete("ctdb.resSendTask", ids);
		return null;
	}

	//删除符合查询条件的记录
	public String deleteDataByQuery(PageValues values) throws Exception {
		Result result = query(values);
		if(result!=null){
			while(result.hasNext()){
				this.delete("ctdb.resSendTask", result.next());
			}
		}
		return null;
	}

	@Override
	public String createData(PageValues values) {
		this.create("ctdb.resSendTask", new DataObject(values.getValues()));
		return null;
	}

	@Override
	public String modifyData(PageValues values) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void catchDatas(PageValues values) throws Exception {
		String startTime = values.getStringValue("startTime");
		String endTime = values.getStringValue("endTime");
		endTimeStr = startTime;
		//String cookieStr = values.getStringValue("cookies");
		String taskIds = values.getStringValue("taskIds");
		List<DataObject> list = ComplexUtil.list();
		if(!EmptyUtil.isEmptyStr(taskIds)){
			String[] taskIdArr = taskIds.split("、");
			list = this.findByIds("ctdb.resSendTask", taskIdArr);
		}else {
			list = this.findAll("ctdb.resSendTask");
		}
		do {
			endTimeStr = departCatchData(list,endTimeStr,endTime);
		} while (!EmptyUtil.isEmptyStr(endTimeStr));
		
		
	}

	@Override
	public void updateTaskStatus(String taskId,String status) {
		String sql = "update res_send_task set task_status = '"+status+"' where task_id = '"+taskId+"'";
		this.executeSQL("ctdb", sql);
		this.setDefaultDatabaseName("ctdb");
		this.commitTranscation();
		
	}
	@Override
	public String departCatchData(List<DataObject> list,String startTime,String taskEndTime) throws Exception {
		Date startDate = DateUtils.parseDate(startTime, DateUtils.SHORT_DATE_FORMAT);
		if(startTime.equals(taskEndTime)) {
			return "";
		}
		Date taskEndDate = DateUtils.parseDate(taskEndTime, DateUtils.SHORT_DATE_FORMAT);
		Date endDate = DateUtils.addDay(startDate, Constants.DEFAULT_TIME_TIMMER);
		String endTime = "";
		if(endDate.before(taskEndDate)) {
			endTime = DateUtils.formatDate(endDate, DateUtils.SHORT_DATE_FORMAT);
		}else {
			endTime = taskEndTime;
		}
		Dictionary dic = DictionaryPool.getDictionary("DIC_CASE_TYPE");
		List<JSONObject> qqjoList = ComplexUtil.list();
		List<JSONObject> weixinjoList = ComplexUtil.list();
		for(DataObject data:list){
			String caseId = data.getString("caseType");
			JSONObject jo = new JSONObject();
			jo.put("id", data.getString("taskId"));
			jo.put("targetId", "");
			JSONObject child = new JSONObject();
			child.accumulate("endTime", DateUtils.parseDate(endTime, DateUtils.SHORT_DATE_FORMAT).getTime());
			child.accumulate("endTimeStr", endTime);
			child.accumulate("startTime", DateUtils.parseDate(startTime, DateUtils.SHORT_DATE_FORMAT).getTime());
			child.accumulate("startTimeStr",startTime);
			child.put("caseId", caseId);
			child.put("caseName",  dic.getLabel(caseId));
			child.put("location", "");
			child.put("remark", data.getString("createReason"));
			child.put("locationStr", "未选择");
			child.put("paramCode", "keyword");
			child.put("paramName", "关键词");
			child.put("paramValue",data.getString("keyWord"));
			child.put("queryType", "beginadvancequery");
			child.put("sourceCodes", "11500008");
			child.put("sourceCodesStr","群聊");
			child.put("_", String.valueOf(System.currentTimeMillis()));
			jo.put("taskStatus","0");
			jo.put("resSendParams", child);
			JSONObject qqjo = new JSONObject();
			JSONObject qqChild = new JSONObject();
			qqChild.accumulate("endTime", DateUtils.parseDate(endTime, DateUtils.SHORT_DATE_FORMAT).getTime());
			qqChild.accumulate("endTimeStr", endTime);
			qqChild.accumulate("startTime", DateUtils.parseDate(startTime, DateUtils.SHORT_DATE_FORMAT).getTime());
			qqChild.accumulate("startTimeStr",startTime);
			qqChild.put("caseId", caseId);
			qqChild.put("caseName",  dic.getLabel(caseId));
			qqChild.put("location", "");
			qqChild.put("remark", data.getString("createReason"));
			qqChild.put("locationStr", "未选择");
			qqChild.put("paramCode", "keyword");
			qqChild.put("paramName", "关键词");
			qqChild.put("paramValue",data.getString("keyWord"));
			qqChild.put("queryType", "beginadvancequery");
			qqChild.put("sourceCodes", "11500008");
			qqChild.put("sourceCodesStr","群聊");
			qqChild.put("_", String.valueOf(System.currentTimeMillis()));
			qqjo.put("taskStatus","0");
			qqjo.put("id",data.getString("taskId"));
			qqjo.put("targetId", "");
			qqjo.put("resSendParams", qqChild);
			String sourceType = data.getString("sourceType");
			if("0".equals(sourceType)){
				qqjoList.add(qqjo);
				weixinjoList.add(jo);
			}else if("1".equals(sourceType)){
				weixinjoList.add(jo);
			}else {
				qqjoList.add(qqjo);
			}
			
		}
		ChatchDataMemory.getInstance().initQQList(qqjoList);
		ChatchDataMemory.getInstance().initWeixinList(weixinjoList);
		ChatchDataMemory.getInstance().downLoadDatas();
		return endTime;
	}

	@Override
	public void updateLastTime(String lastTime,String taskId) {
		String sql = "update res_send_task set last_time = '"+lastTime+"' where task_id = '"+taskId+"'";
		this.executeSQL("ctdb", sql);
		this.setDefaultDatabaseName("ctdb");
		this.commitTranscation();
		
		
	}
	
	
	

}
