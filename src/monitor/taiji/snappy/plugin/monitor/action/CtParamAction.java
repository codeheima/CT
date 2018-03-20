package taiji.snappy.plugin.monitor.action;

import java.util.List;

import taiji.org.tools.EmptyUtil;
import taiji.snappy.plugin.monitor.service.CtParamService;
import taiji.snappy.db.DataObject;
import taiji.snappy.web.WebConstants;
import taiji.snappy.web.dictionary.Dictionary;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.webcore.DictionaryPool;
import taiji.snappy.webcore.WebCoreConstants;
import taiji.snappy.webcore.service.WebWorkAction;

/**
 * 
 * 
 * @author 
 */
public class CtParamAction extends WebWorkAction{

	private CtParamService ctParamService;

	public void setCtParamService(CtParamService ctParamService){
		this.ctParamService = ctParamService;
	}

	public CtParamService getCtParamService(){
		return this.ctParamService;
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
		return getCtParamService().query(getValues(), getValues().getIntValue(WebCoreConstants.CURRENT_PAGE), 100);
	}

	//新增初始化
	public String onCreateInit() throws Exception{
		//TODO 新增初始化
		return null;
	}
	//新增保存
	public String onCreateSave() throws Exception{
		String message = getCtParamService().createData(getValues());
		if(message==null){
			//TODO 请修改日志描述
			log("新增");
			addMessage("保存成功");
			Dictionary dic = new Dictionary();
			List<DataObject> list = ctParamService.query(new PageValues());
			if(!EmptyUtil.isEmptyList(list)){
				for(DataObject data: list){
					dic.add(data.getString("caseId"), data.getString("caseValue"));
					
				}
			}
			DictionaryPool.putDictionary("DIC_CASE_TYPE", dic);
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
			DataObject data = getCtParamService().findDataById(id);
			if(data==null){
				addMessage("指定的记录已不存在");
				return "query";//返回列表页面
			}else{
				getFunction().getFunction().getForm().getElement("id").setDisplayonly("true");
				getFunction().getFunction().getForm().getElement("key").setDisplayonly("true");
				getValues().setBeanValue(data);
				return null;
			}
		}
	}
	//修改保存
	public String onModifySave() throws Exception{
		String message = getCtParamService().modifyData(getValues());
		if(message==null){
			//TODO 请修改日志描述
			log("修改");
			addMessage("保存成功");
		}else{
			addError(message);
		}		
		return null;
	}
	

	
}
