package taiji.snappy.plugin.restask.service.impl;

import java.util.List;
import java.util.ArrayList;

import net.sf.json.JSONObject;
import taiji.org.tools.DateUtils;
import taiji.org.tools.EmptyUtil;
import taiji.snappy.plugin.restask.service.DataImChatService;
import taiji.snappy.db.DataObject;
import taiji.snappy.db.Result;
import taiji.snappy.db.exception.SnappydbException;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.web.pagination.WebPagination;
import taiji.snappy.webcore.service.SnappydbServiceTemplate;

/**
 * 
 * 
 * @author 
 */
public class DataImChatServiceImpl extends SnappydbServiceTemplate implements DataImChatService{

	//查询
	public Result query(PageValues values) throws Exception{
		
		return this.executeQuery("ctdb.dataImChat.query", prepareQueryParameter(values));
	}
	
	//查询
	public WebPagination query(PageValues values, int currentPage, int pageSize) throws Exception{
		
		return this.executeQuery("ctdb.dataImChat.query", prepareQueryParameter(values), currentPage, pageSize);
	}
	
	//处理传入查询条件
	private DataObject prepareQueryParameter(PageValues values) throws Exception{
		
		return new DataObject(values.getValues());
	}

	@Override
	public void updateTaskStatus(JSONObject data) {
		String taskId = data.getString("taskId");
		String taskStatus = data.getString("taskStatus");
		String sql = "update set taskStatus = '"+taskStatus+"' where taskId = '"+taskId+"'";
		this.executeSQL("ctdb.resSendTask", sql);
		
	}

	@Override
	public void doSomeDbService(List<DataObject> resultList) {
		if(!EmptyUtil.isEmptyList(resultList)){
			for(DataObject data:resultList){
				String sendTime = DateUtils.formatDate(data.getLong("sendTime")*1000l, DateUtils.SHORT_DATE_FORMAT);
				data.put("sendTime", sendTime);
				try {
					this.create("ctdb.dataImChat", data);
					this.setDefaultDatabaseName("ctdb");
					this.commitTranscation();
				} catch (SnappydbException e) {
					System.out.println(data.getString("context")+"_"+data.toString());
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void insert() {
		this.create("ctdb.dataImChat", new DataObject().setValue("context", "[何为]积分★1387.86[烟火]积分★891.26[燕珊]积分★753.06[怀念]积分★670.82[忧郁]积分★546.24[紫雨]积分★524.14[KS]积分★500.22[绅士]积分★"));
		
	}




}
