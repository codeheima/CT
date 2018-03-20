package taiji.snappy.plugin.monitor.service.impl;

import java.util.Calendar;
import java.util.Date;

import taiji.snappy.db.DataObject;
import taiji.snappy.plugin.monitor.service.MonitorService;
import taiji.snappy.toolkit.common.DateUtils;
import taiji.snappy.webcore.service.SnappydbServiceTemplate;

public class MonitorServiceImpl extends SnappydbServiceTemplate implements MonitorService {
	@Override
	public DataObject createMonitor(DataObject data) {
		DataObject val = (DataObject)this.create("ctdb.resCurrent", data);
		return val;
	}

	/**
	 * 清理
	 */
	public void clearXXX() {
		Date day1 = DateUtils.add(new Date(), Calendar.DAY_OF_YEAR, -1);
		
		Date day7 = DateUtils.add(new Date(), Calendar.DAY_OF_YEAR, -7);
		
		Date day30 = DateUtils.add(new Date(), Calendar.DAY_OF_YEAR, -30);
		
		this.executeSQL("ctdb", "DELETE FROM res_current WHERE CAPTURE_TIME  < " + day1.getTime());
		
		this.executeSQL("ctdb", "DELETE FROM ct_access WHERE CAPTURE_TIME  < " + day7.getTime());
		
	}
	
	
	

}
