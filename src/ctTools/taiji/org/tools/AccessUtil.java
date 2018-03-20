package taiji.org.tools;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


/**
 * @author Archmage
 */
public class AccessUtil {
	
	
	public static String saveAccess(String key,InputStream is,String suf){
		if(!urlMap.containsKey(key)){
			String aa = saveAccess(is,suf);
			Access.saveAccess(key, aa);
			urlMap.put(key, aa);
		}
		return urlMap.get(key);
	}
	
	static{
		File f = new File(Constants.ACCESS_ROOT);
		if(!f.exists()){
			f.mkdirs();
		}
	}
	
	public static String saveAccessByStr(String content,String suf){
		String uuid = UUID.randomUUID().toString();
		String mark = uuid + suf;
		String path = Constants.ACCESS_ROOT +  File.separator + uuid + suf;
		
		File f = new File(path);
		FileOutputStream os = null;
		BufferedWriter bw = null;
		try {
			os = new FileOutputStream(f);
			bw =  new BufferedWriter(new OutputStreamWriter(os,"utf-8"));
			bw.write(content);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(bw != null){
				try {
					bw.close();
				} catch (IOException e) {
				}
			}
			if(os != null){
				try {
					os.close();
				} catch (IOException e) {
				}
			}
		}
		
		
		return mark;
		
	}
	
	public static String saveAccess(InputStream is,String suf){
		String uuid = UUID.randomUUID().toString();
		String mark = uuid + "."+ suf;
		String dirPath = Constants.ACCESS_ROOT;
		if(!new File(dirPath).exists()){
			new File(dirPath).mkdirs();
		}
		String path = Constants.ACCESS_ROOT +  File.separator + uuid + "."+suf;
		File f = new File(path);
		FileOutputStream os = null;
		try {
			os = new FileOutputStream(f);
			byte [] bs = new byte[2048];
			
			int i = -1;
			while((i =is.read(bs)) > 0){
				os.write(bs, 0, i);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(os != null){
				try {
					os.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return path;
	}
	
	
	public static void main(String args[]) throws Exception{
		File f = new File("c:/temp/WeiXinCatch/m.html");
		System.out.println(f.exists());
		InputStream is = new FileInputStream(f);
		String abc = saveAccess(is,".html");
		System.out.println(abc);
	}

	private static Map<String,String> urlMap = new HashMap<String,String>();
	
	public static String saveAccessByStrTest(String url){
		if(urlMap.containsKey(url)){
			return urlMap.get(url);
		}
		return null;
	}
	
	public static String saveAccessByStr(String url, String content,String suf) {
		
		if(urlMap.containsKey(url)){
			return urlMap.get(url);
		}
		String result = saveAccessByStr(content,suf);
		Access.saveAccess(url, result);
		urlMap.put(url, result);
		return result;
	}
}
