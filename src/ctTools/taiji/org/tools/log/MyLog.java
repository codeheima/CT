package taiji.org.tools.log;



/**
 * @author Archmage
 */
public class MyLog {
	public static final String fileName = "log.txt";
	

	public static void debug(String content){
		print(content,"DEBUG");
	}
	
	public static void error(String content){
		print(content,"ERROR");
	}
	public static void error(String msg,Throwable err){
		error(msg + err.getMessage());
		StringBuilder sb = new StringBuilder();
		StackTraceElement[] eles = err.getStackTrace();
		for(StackTraceElement e : eles){
			sb.append(String.valueOf(e)).append("\r\n");
		}
		error(sb.toString());
	}
	
	private static void print(String content, String mark) {
		
		
	}
	

}
