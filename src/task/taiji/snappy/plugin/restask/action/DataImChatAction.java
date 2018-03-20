package taiji.snappy.plugin.restask.action;

import java.util.List;

import taiji.org.tools.EmptyUtil;
import taiji.snappy.plugin.restask.service.DataImChatService;
import taiji.snappy.db.DataObject;
import taiji.snappy.web.WebConstants;
import taiji.snappy.web.pagination.WebPagination;
import taiji.snappy.webcore.WebCoreConstants;
import taiji.snappy.webcore.service.WebWorkAction;

/**
 * 
 * 
 * @author 
 */
public class DataImChatAction extends WebWorkAction{

	private DataImChatService dataImChatService;

	public void setDataImChatService(DataImChatService dataImChatService){
		this.dataImChatService = dataImChatService;
	}

	public DataImChatService getDataImChatService(){
		
		return this.dataImChatService;
	
	}

	//查询初始化
	public void onQueryInit() throws Exception{
		//TODO 查询初始化
	}
	
	
	//查询数据库
	public Object onQuery(int currentPage,int pageSize) throws Exception{
		String method = getValues().getStringValue(WebConstants.METHOD,"");
		if("query".equals(method)){
			//TODO 请修改日志描述
			log("日志管理-查询");			
		}
		WebPagination wepg = getDataImChatService().query(getValues(),getValues().getIntValue(WebCoreConstants.CURRENT_PAGE), 30);
		List<DataObject> list = (List<DataObject>) wepg.getList();
		if(!EmptyUtil.isEmptyList(list)){
			for(DataObject data:list){
				String context = data.getString("context");
				data.put("actionStr", data.getString("action"));
				if(context.length()>50){
					data.put("contextStr", context.substring(0, 50));
				}else {
					data.put("contextStr", context);
				}
			}
		}
		return wepg;
	}

	
	

	
}
