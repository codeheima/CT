package taiji.snappy.plugin.monitor.service.impl;

import java.util.List;
import java.util.ArrayList;
import taiji.snappy.plugin.monitor.service.ResCurrentService;
import taiji.snappy.db.DataObject;
import taiji.snappy.db.Result;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.web.pagination.WebPagination;
import taiji.snappy.webcore.service.SnappydbServiceTemplate;

/**
 * 
 * 
 * @author 
 */
public class ResCurrentServiceImpl extends SnappydbServiceTemplate implements ResCurrentService{

	//查询
	public Result query(PageValues values) throws Exception{
		
		return this.executeQuery("ctdb.resSendTask.query", prepareQueryParameter(values));
	}
	
	//查询
	public WebPagination query(PageValues values, int currentPage, int pageSize) throws Exception{
		
		
		
		return this.executeQuery("ctdb.resSendTask.query", prepareQueryParameter(values), currentPage, pageSize);
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

	
	
	//新增
	public String createData(PageValues values) throws Exception {
	
		this.create("ctdb.resSendTask", new DataObject(values.getValues()));
		return null;
	}

	//修改
	public String modifyData(PageValues values) throws Exception {

		this.update("ctdb.resSendTask", new DataObject(values.getValues()));
		return null;
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
	
	
	public DataObject createMonitor(DataObject data) {
		DataObject val = (DataObject)this.create("ctdb.resSendTask", data);
		return val;
	}

}
