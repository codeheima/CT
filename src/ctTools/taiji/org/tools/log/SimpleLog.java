package taiji.org.tools.log;

/**
 * 不用了
 * @author Archmage
 *
 */
public enum SimpleLog {
	INSTANCE;
	private StringBuffer msg = new StringBuffer();
	public void clear(){
		msg =  new StringBuffer();
	}
	public void appendLine(String str){
		msg.append(str).append("\n\r");
	}
	
	
	public String getLog(){
		String str =  msg.toString();
		clear();
		return str;
	}
}
