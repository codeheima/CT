package taiji.org.tools;

import java.io.File;


/**
 * @author Archmage
 */
public class Constants {
	
	public static final String mediaType_text = "01";
	public static final String mediaType_pic = "02";
	public static final String mediaType_voice = "03";
	public static final String mediaType_av = "04";
	
	public static final String ACCESS_ROOT = "D:"+ File.separator + "access";
	/**
	 * 默认查询时间范围/天
	 */
	public static final int DEFAULT_TIME_TIMMER = 2;
	/**
	 * 一次返回数量
	 */
	public static final int DEFAULT_CATCH_NUMBER = 1000;
	
	public static final String PORT_8080 = "8080";
	public static final String PORT_8081 = "8081";
	
	/** */                            
	public static  String TEST_LOGIN = "http://15.6.42.234:"+PORT_8080+"/inet/monitor/task_list?pagesize=2&page=1&caseId=-1&status=-10&opMode=0&_=";
	


	
	public static String URL_RES_GROUPCHAT = "http://15.6.42.234:"+PORT_8080+"/inet/result/groupchatpage?type=QUERY";
	
	public static String URL_RES_GROUPCHAT_DETAIL ="http://15.6.42.234:8080/inet/result/groupchatmsg?type=QUERY";
	
	
	public static  String URL_RES_FIND_HIS_LIST = "http://15.6.42.234:"+PORT_8080+"/inet/query/historylist?userRemark=&appType=&caseId=0&status=-10&endTime=&totalrows=0";
	
	
	
	
	
	
	public static void main(String [] args){
	
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
	}
}
