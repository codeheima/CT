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
public interface ResCurrentService{
	
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

	/**
	 * 删除一条记录
	 * @param id
	 * @return 提示消息
	 * @throws Exception
	 */
	public String deleteDataById(String id) throws Exception;
	
	/**
	 * 删除指定数据
	 * @param ids
	 * @return 提示消息
	 * @throws Exception
	 */
	public String deleteDataByIds(String[] ids) throws Exception;
	
	/**
	 * 根据页面选择删除
	 * @param values
	 * @return 提示消息
	 * @throws Exception
	 */
	public String deleteDataByQuery(PageValues values) throws Exception;

	
	public DataObject createMonitor(DataObject data);
}
