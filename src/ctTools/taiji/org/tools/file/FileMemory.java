package taiji.org.tools.file;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import taiji.org.tools.Constants;
import taiji.org.tools.EmptyUtil;
import taiji.org.tools.FileCheck;

import net.sf.json.JSONObject;


/**
 * @author Archmage
 */
public class FileMemory {
	
	/**
	 * key : url
	 * val : 文件信息
	 */
	private static final Map<String,DFile> downLoadsMap = new ConcurrentHashMap<String,DFile>();
	
	/** 
	 * key : 文件路径
	 * val ： 与 downLoadsMap 一致
	 */
	private static final Map<String,DFile> pathMap = new ConcurrentHashMap<String,DFile>();
	
	/** 
	 * md5 : 文件路径
	 * val ： 与 downLoadsMap 一致
	 */
	private static final Map<String,DFile> md5Map = new ConcurrentHashMap<String,DFile>();
	
	private static final Object mapLock = new Object();
	
	/**
	 * 初始化
	 */
	public static void init(){
		
		downLoadsMap.clear();
		
		//删除之前的临时文件
		delTempFiles();
		
		//加载数据库中原文件
	//	addDBMd5Files();
	}
	



	/**
	 * url是否存在
	 * @param url
	 * @return
	 */
	public static boolean hasUrl(String url){
		boolean hasUrl = downLoadsMap.containsKey(url);
		return hasUrl;
	}
	
	public static DFile getDFile(String url){
		return downLoadsMap.get(url);
	}
	
	public static DFile getDFileByPath(String path){
		return pathMap.get(path);
	}
	
	public static DFile getDFileByMd5(String md5){
		return md5Map.get(md5);
	}
	
	/**
	 * 
	 * @param url
	 * @param path
	 * @return  null if file or url not exists
	 */
	public static DFile addFile(String url,String path){
		if(EmptyUtil.isEmptyStr(path)){
			return null;
		}
		if(EmptyUtil.isEmptyStr(url)){
			return null;
		}
		File f = new File(path);
		if(!f.exists()){
			return null;
		}
		if(downLoadsMap.containsKey(url)){
			return downLoadsMap.get(url);
		}
		//虽然会存在异步，但影响较小，忽略。
		String md5 = FileCheck.getFileCheckCode(f);
		if(EmptyUtil.isEmptyStr(md5)){
			return null;
		}
		DFile dFile = new DFile(md5,url,System.currentTimeMillis(),path);
		
		downLoadsMap.put(url, dFile);
		pathMap.put(dFile.getPath(), dFile);
		md5Map.put(md5, dFile);
		
		return dFile;
	}

	private static void delTempFiles() {
		//删除临时文件
		File p = new File(Constants.ACCESS_ROOT);
		if(!p.exists()){
			//文件夹不存在，直接返回
			return;
		}
		//全部删除
		for(File f : p.listFiles()){
			if(!f.isDirectory()){
				f.deleteOnExit();
			}
		}
	}



	public static void addMd5Param(JSONObject sendData, String md5) {
		sendData.put("fileMd5", md5);
	}
	
	
	
	
	
	
	
}
