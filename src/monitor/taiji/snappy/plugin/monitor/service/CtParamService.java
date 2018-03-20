package taiji.snappy.plugin.monitor.service;

import java.util.List;

import taiji.snappy.db.DataObject;
import taiji.snappy.db.Result;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.web.pagination.WebPagination;

/**
 * 
 * 
 * @author 
 */
public interface CtParamService{
	
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

	/**
	 * 查询指定记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public DataObject findDataById(String id) throws Exception;
	
	/**
	 * 查询指定记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<DataObject> findDataByIds(String[] ids) throws Exception;
	
	/**
	 * 新增
	 * @param values
	 * @return	错误消息，为空表示操作成功
	 * @throws Exception
	 */
	public String createData(PageValues values) throws Exception;

	/**
	 * 修改
	 * @param values
	 * @return	错误消息，为空表示操作成功
	 * @throws Exception
	 */
	public String modifyData(PageValues values) throws Exception;

}
