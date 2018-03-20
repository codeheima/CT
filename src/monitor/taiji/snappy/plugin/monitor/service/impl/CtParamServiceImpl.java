package taiji.snappy.plugin.monitor.service.impl;

import java.util.List;
import java.util.ArrayList;
import taiji.snappy.plugin.monitor.service.CtParamService;
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
public class CtParamServiceImpl extends SnappydbServiceTemplate implements CtParamService{

	//查询
	public Result query(PageValues values) throws Exception{
		
		return this.executeQuery("ctdb.ctParam.query", prepareQueryParameter(values));
	}
	
	//查询
	public WebPagination query(PageValues values, int currentPage, int pageSize) throws Exception{
		
		return this.executeQuery("ctdb.ctParam.query", prepareQueryParameter(values), currentPage, pageSize);
	}
	
	//处理传入查询条件
	private DataObject prepareQueryParameter(PageValues values) throws Exception{
		
		return new DataObject(values.getValues());
	}

	//根据主键查询
	public DataObject findDataById(String id) throws Exception {
		return this.findById("ctdb.resCaseType",id);
	}
	
	//根据多个主键查询
	public List<DataObject> findDataByIds(String[] ids) throws Exception{
		return this.findByIds("ctdb.resCaseType",ids);
	}

	//新增
	public String createData(PageValues values) throws Exception {
	
		this.create("ctdb.resCaseType", new DataObject(values.getValues()));
		return null;
	}

	//修改
	public String modifyData(PageValues values) throws Exception {

		this.update("ctdb.resCaseType", new DataObject(values.getValues()));
		return null;
	}

}
