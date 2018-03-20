package taiji.snappy.plugin.restask.service;

import java.util.List;

import net.sf.json.JSONObject;

import taiji.snappy.db.DataObject;
import taiji.snappy.db.Result;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.web.pagination.WebPagination;

/**
 * 
 * 
 * @author 
 */
public interface DataImChatService{
	
	/**
	 * 查询
	 * @param values
	 * @return
	 * @throws Exception
	 */
	public Result query(PageValues values) throws Exception;
	
	/**
	 * 查询
	 * @param values
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public WebPagination query(PageValues values, int currentPage, int pageSize) throws Exception;
	
	
	public void updateTaskStatus(JSONObject jsonObject);

	public void doSomeDbService(List<DataObject> resultList);

	public void insert();
		

	


}
