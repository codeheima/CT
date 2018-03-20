package taiji.snappy.plugin.monitor.job;

import taiji.org.tools.BeanUtil;
import taiji.snappy.plugin.monitor.service.MonitorService;

/**
 * 清垃圾用的,开不开都行
 *
 */
public class ClearJob {
	public static void start(){
		new Thread(new Runnable() {
			public void run() {
				while(true){
					try {
						realDo();
						Thread.sleep(3600 * 1000 * 24);
					} catch (Exception e) {
						//...
					}
				}
			}
		});
	}
	
	
	private static void realDo(){
		
		MonitorService  service = BeanUtil.getBean("monitorService", MonitorService.class);
		service.clearXXX();
		
	}
	
}
