package taiji.snappy.plugin.monitor.action;

import java.util.Date;
import java.util.List;

import taiji.snappy.db.DataObject;
import taiji.snappy.plugin.monitor.service.ResCurrentService;
import taiji.snappy.plugin.restask.service.ResSendService;
import taiji.snappy.toolkit.common.DateUtils;
import taiji.snappy.web.WebConstants;
import taiji.snappy.web.pagination.WebPagination;
import taiji.snappy.webcore.WebCoreConstants;
import taiji.snappy.webcore.service.WebWorkAction;

/**
 * 
 * 
 * @author 
 */
public class ResCurrentAction extends WebWorkAction{

	private ResSendService resSendService;

	public ResSendService getResSendService() {
		return resSendService;
	}
	public void setResSendService(ResSendService resSendService) {
		this.resSendService = resSendService;
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
		WebPagination wp =  getResSendService().query(getValues(), getValues().getIntValue(WebCoreConstants.CURRENT_PAGE), 100);
		return wp;
	}

	//新增初始化
	public String onCreateInit() throws Exception{
		//TODO 新增初始化
		return null;
	}
	//新增保存
	public String onCreateSave() throws Exception{
		String message = getResSendService().createData(getValues());
		if(message==null){
			//TODO 请修改日志描述
			log("新增");
			addMessage("保存成功");
		}else{
			addError(message);
		}
		return null;
	}
	
	//修改初始化
	public String onModifyInit() throws Exception{
		String id = getValues().getStringValue("id");
		if(id==null || id.trim().length()==0){
			addMessage("未指定要修改的记录ID");
			return "query";//返回列表页面
		}else{
			DataObject data = getResSendService().findDataById(id);
			if(data==null){
				addMessage("指定的记录已不存在");
				return "query";//返回列表页面
			}else{
				getFunction().getFunction().getForm().getElement("id").setDisplayonly("true");
				getValues().setBeanValue(data);
				return null;
			}
		}
	}
	//修改保存
	public String onModifySave() throws Exception{
		String message = getResSendService().modifyData(getValues());
		if(message==null){
			//TODO 请修改日志描述
			log("修改");
			addMessage("保存成功");
		}else{
			addError(message);
		}		
		return null;
	}
	
	//删除指定记录
	public String onDelete() throws Exception{
		String id = getValues().getStringValue("id");
		if(id==null || id.trim().length()==0){
			addMessage("未指定要删除的记录ID");
		}else{
			DataObject data = getResSendService().findDataById(id);
			if(data==null){
				addMessage("指定的记录已不存在");
			}else{
				String message = getResSendService().deleteDataById(id);
				if(message==null){
					//TODO 请修改日志描述
					log("删除主键为\""+id+"\"的记录");
					addMessage("删除成功");
				}else{
					addError(message);
				}
			}
		}
		return null;
	}

	//删除选中记录
	public String onBatchDelete() throws Exception{
		if(getValues().getObject("checkAll")==null){
			String[] ids = getValues().getStringArrayValue("checkItem");
			if(ids==null || ids.length==0)
				addMessage("未指定要删除的记录ID");
			else{
				getResSendService().deleteDataByIds(ids);
				addMessage("删除成功");
				//TODO 请修改日志描述
				log("删除选中的记录");
			}			
		}else{
			getResSendService().deleteDataByQuery(getValues());
			addMessage("删除成功");
			//TODO 请修改日志描述
			log("根据查询条件批量删除");			
		}
		return null;
	}
	public String ctl(){
		
		return null; 
	}
}
