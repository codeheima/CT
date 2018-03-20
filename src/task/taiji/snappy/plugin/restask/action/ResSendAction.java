package taiji.snappy.plugin.restask.action;

import java.util.Date;
import java.util.List;

import org.apache.bcel.generic.NEW;

import net.sf.json.JSONObject;
import taiji.org.tools.Constants;
import taiji.org.tools.DateUtils;
import taiji.org.tools.EmptyUtil;
import taiji.org.tools.http.ChatchDataMemory;
import taiji.org.tools.http.HttpByHeader.GetCallBack;
import taiji.snappy.db.DataObject;
import taiji.snappy.plugin.restask.service.ResSendService;
import taiji.snappy.web.WebConstants;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.web.pagination.WebPagination;
import taiji.snappy.webcore.WebCoreConstants;
import taiji.snappy.webcore.service.WebWorkAction;

/**
 * 
 * 
 * @author 
 */
public class ResSendAction extends WebWorkAction{

	private ResSendService resSendService;
	
	
	public void setResSendService(ResSendService resSendService){
		this.resSendService = resSendService;
	}

	public ResSendService getResSendService(){
		return this.resSendService;
	}
	private CatchDataThread catchDataThread;

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
		WebPagination wepg = getResSendService().query(getValues(), getValues().getIntValue(WebCoreConstants.CURRENT_PAGE), 50);
		List<DataObject> list = (List<DataObject>) wepg.getList();
		if(!EmptyUtil.isEmptyList(list)){
			for(DataObject data:list){
				if("1".equals(data.getString("taskStatus"))){
					getValues().setValue("taskStatusStr", "1");
					break;
					
				}
			}
			
		}
		return wepg;
	}

	
	
	//删除指定记录
	public String onDelete() throws Exception{
		String id = getValues().getStringValue("taskId");
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
	
	//新增保存
	public String onCreateSave() throws Exception{
		getValues().setValue("createTime",DateUtils.formatDate(new Date(), DateUtils.SHORT_DATE_FORMAT));
		getValues().setValue("taskStatus",0);
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
	public String startTaskConfig(){
		return null;
		
	}
	public String saveTaskConfig(){
		catchDataThread = new CatchDataThread(getValues());
		String cookieStr =  getValues().getStringValue("cookies");
		boolean flag = ChatchDataMemory.getInstance().httpByHeader.testCookieLogin(false, Constants.TEST_LOGIN, cookieStr, new GetCallBack() {
			@Override
			public void callback(boolean isSuccess, String str) {
				try{
					JSONObject.fromObject(str);
				}catch(Exception err){
					
				}
				
			}
		});
		JSONObject jo = new JSONObject();
		jo.accumulate("isSuccess", flag);
		if(flag) {
			jo.accumulate("msg", "任务开始执行");
		}else {
			jo.accumulate("msg", "请输入有效cookie！");
		}
		if(flag){
			new Thread(catchDataThread).start();
		}
		return jo.toString();
		
	}
	
	class CatchDataThread implements Runnable{
		
		PageValues values;
		
		

		public CatchDataThread(PageValues values) {
			this.values = values;
		}



		@Override
		public void run() {
			try {
				resSendService.catchDatas(values);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
}
