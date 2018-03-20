package taiji.org.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Hex;




/**
 * @author Archmage
 */
public class MD5 {

	private static final  char[] hexDigits = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
	
	
	
	
	public static String md5(String source)throws Exception{
		char[] hexDigits = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
    	MessageDigest md = MessageDigest.getInstance("MD5");
    	md.update(source.getBytes("UTF-8"));
    	byte[] tmp = md.digest();
    	char str[] = new char[16*2];
    	int k=0;
    	for(int i=0;i<16;i++){
    		byte b = tmp[i];
    		str[k++] = hexDigits[b >>> 4 & 0xf];
    		str[k++] = hexDigits[b & 0xf];
    	}
    	return new String(str);
	}
	
	
	/*public static String md5(File file)throws Exception{
    	MessageDigest md = MessageDigest.getInstance("MD5");
    	FileInputStream in = new FileInputStream(file);  
        FileChannel ch = in.getChannel();  
        try{
	        MappedByteBuffer byteBuffer = ch.map(FileChannel.MapMode.READ_ONLY, 0,  
	                 file.length());  
	    	md.update(byteBuffer);
	    	byte[] tmp = md.digest();
	    	char str[] = new char[16*2];
	    	int k=0;
	    	for(int i=0;i<16;i++){
	    		byte b = tmp[i];
	    		str[k++] = hexDigits[b >>> 4 & 0xf];
	    		str[k++] = hexDigits[b & 0xf];
	    	}
	    	return new String(str).toUpperCase();
        }finally{
        	in.close();
        	ch.close();
        }
	}*/
	
	
	 public static String md5(File file) {
		MessageDigest MD5 =null;
		try {
			MD5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}
        FileInputStream fileInputStream = null;
        try {
        	fileInputStream = new FileInputStream(file);
            byte[] buffer = new byte[8192];
            int length;
            while ((length = fileInputStream.read(buffer)) != -1) {
            	MD5.update(buffer, 0, length);
            }

            return new String(Hex.encodeHex(MD5.digest())).toUpperCase();
        } catch (FileNotFoundException e) {
        	e.printStackTrace();
            return "";
        } catch (IOException e) {
        	e.printStackTrace();
            return "";
        } finally {
            try {
                if (fileInputStream != null)
                fileInputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

	 public static boolean md5Check(File file,String target)throws Exception{
		if(EmptyUtil.isEmptyFile(file) || EmptyUtil.isEmptyStr(target))
			return false;
		return md5(file).toUpperCase().equals(target.toUpperCase());
	}
	/**
	 * @param args
	 */
	public static void main(String[] args)throws Exception {
		testFile();
	}
	



	private static void pHex(String src){
		long a = Long.parseLong(src);
		String hex = Long.toHexString(a);
		System.out.println(Long.toBinaryString(a));
		System.out.println( src.length() + ":" + src +"==" + hex.length() + ":" + hex);
	}

	private static void testFile() throws Exception {
		File f = new File("F:\\work\\PMI\\应用\\new\\sqpt_db1.0.0.tar.gz");
		String md5 =  MD5.md5(f);
		System.out.println(md5);
		System.out.println(md5.length());
		f = new File("F:\\work\\PMI\\应用\\new\\sqpt_web1.0.0.tar.gz");
		md5 =  MD5.md5(f);
		System.out.println(md5);
		
		f = new File("F:\\work\\PMI\\应用\\测试\\同步\\5416-010000-Org-All-1449270008-00245.zip");
		md5 =  MD5.md5(f);
		System.out.println(md5);
	}

}
