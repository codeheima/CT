package taiji.org.tools;

import java.util.HashMap;
import java.util.Map;


/**
 * @author Archmage
 */
public class PicUtil {
	private static Map<String,String> picMap = new HashMap<String,String>();
	
	public static String getPicPath(String name){
		if(!picMap.containsKey(name)){
	/*		//<img src="/weixin/wxmc/bqicon/83.png"/>
			int s = name.indexOf("src=\"");
			if(s > 0){
				s = s +"src=\"".length();
				int end = name.indexOf("\"", s);
				if(end > 0){
					String url = name.substring(s, end);
					int l = url.lastIndexOf(".");
					String suf  = url.substring(l + 1);
					
					
					CloseableHttpResponse resp = null;
					try {
						resp = MainMemory.tempHttp.downLoadFile(Constants.url_pre + url, null);
						StatusLine statusLine = resp.getStatusLine();
						if(200  == statusLine.getStatusCode()){
							String access = AccessUtil.saveAccess(resp.getEntity().getContent(), suf);
							picMap.put(name, access);
						}
					}catch(Exception err){
						
					}
				}
			}*/
		}
		
		return picMap.get(name);
	}

	public static void main(String [] args){
		String p = getPicPath("<img src=\"/weixin/wxmc/bqicon/83.png\"/>");
	}
}
