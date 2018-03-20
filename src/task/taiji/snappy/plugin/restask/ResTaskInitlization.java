package taiji.snappy.plugin.restask;

import java.util.List;

import jit.pms.certdistribution.test;

import taiji.org.tools.BeanUtil;
import taiji.org.tools.EmptyUtil;
import taiji.snappy.db.DataObject;
import taiji.snappy.plugin.monitor.service.CtParamService;
import taiji.snappy.plugin.restask.service.DataImChatService;
import taiji.snappy.web.dictionary.Dictionary;
import taiji.snappy.web.page.PageValues;
import taiji.snappy.webcore.DictionaryPool;
import taiji.snappy.webcore.IPluginInitlization;

/**
 * 插件初始化

 * @author 
 */
public class ResTaskInitlization implements IPluginInitlization {

	public void init() throws Exception {
		
		System.out.println("ResTaskInitlization init..");
		initCaseDic();
		Dictionary dicStatus = new Dictionary();
		dicStatus.add("0", "初始化");
		dicStatus.add("1", "正在查询");
		dicStatus.add("3", "查询成功");
		dicStatus.add("2", "查询失败");
		DictionaryPool.putDictionary("DIC_TASK_STATUS", dicStatus);
		Dictionary sourceTypeDic = new Dictionary();
		sourceTypeDic.add("0", "全部");
		sourceTypeDic.add("1", "微信");
		sourceTypeDic.add("2", "QQ");
		DictionaryPool.putDictionary("DIC_SOURCE_TYPE", sourceTypeDic);
		Dictionary chatTypeDic = new Dictionary();
		chatTypeDic.add("13", "群聊");
		chatTypeDic.add("01", "私聊");
		DictionaryPool.putDictionary("DIC_CHAT_TYPE", chatTypeDic);
		Dictionary appTypeDic = new Dictionary();
		appTypeDic.add("1030036", "微信");
		appTypeDic.add("1030001", "QQ");
		DictionaryPool.putDictionary("DIC_APP_TYPE", appTypeDic);
	}
	
	public void initCaseDic() throws Exception{
		CtParamService ctParamService = BeanUtil.getBean("ctParamService", CtParamService.class);
		Dictionary dic = new Dictionary();
		List<DataObject> list = ctParamService.query(new PageValues());
		if(!EmptyUtil.isEmptyList(list)){
			for(DataObject data: list){
				dic.add(data.getString("caseId"), data.getString("caseValue"));
				
			}
		}
		DictionaryPool.putDictionary("DIC_CASE_TYPE", dic);
	}
	

}
