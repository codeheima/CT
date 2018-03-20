package taiji.org.tools;

import java.io.File;


/**
 * 获取文件校验码
 * @author Archmage
 */
public class FileCheck {
	
	/**
	 * 获取文件校验码
	 * @param f
	 * @return
	 */
	public static String getFileCheckCode(File f){
		if(null == f || !f.exists()){
			return "";
		}
		try {
			return MD5.md5(f);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	/**
	 * 检查校验码是否一致
	 * @param file
	 * @param target
	 * @return
	 * @throws Exception
	 */
	public static boolean checkEquals(File file,String target)throws Exception{
		if(EmptyUtil.isEmptyFile(file) || EmptyUtil.isEmptyStr(target))
			return false;
		return getFileCheckCode(file).toUpperCase().equals(target.toUpperCase());
	}
	
}		
