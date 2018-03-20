package taiji.org.tools;


/**
 * 字符串工具类
 * @author zhouxl
 * @version 1.0 2016/07/26
 *
 */
public class StringUtils {

	/**
	 * 将字符创中的大写字母替换成 ‘_’加上这个字符的小写形式
	 * @param value
	 * @return
	 */
	public static String replaceUpperCase2_(String value) {
		for (int i = 0; i < value.length(); i++) {
			char i_char = value.charAt(i);
			if (Character.isUpperCase(i_char)) {
				if (i > 0) {
					i_char = Character.toLowerCase(i_char);
					value = value.substring(0, i) + "_" + i_char + value.substring(i+1, value.length());
					i++;
				}else {
					i_char = Character.toLowerCase(i_char);
					value = value.substring(0, i) + i_char + value.substring(i+1, value.length());
				}
			}
		}
		return value;
	}
	
	/**
	 * 将字符创中的‘_’加上这个字符的小写形式替换成大写字母 
	 * @param value
	 * @return
	 */
	public static String replace_2UpperCase(String value) {
		for (int i = 0; i < value.length(); i++) {
			char i_char = value.charAt(i);
			
			if (i_char == '_' && i > 0) {
				
				if (i < value.length() - 1) {
					char i1_char = value.charAt(i + 1);
					
					i1_char = Character.toUpperCase(i1_char);
					value = value.substring(0, i) + i1_char + value.substring(i+2, value.length());
					i--;
				}
				
			}
		}
		return value;
	}
	
	
	
	/**
	 * 文字太长了，就换成...
	 * @param src
	 * @param maxMarkLenth
	 * @param decLen
	 * @return
	 */
	public static String getShortString(String src,int maxMarkLenth,int decLen){
		if(EmptyUtil.isEmptyStr(src)){
			return "";
		}
		if(src.length() <=maxMarkLenth){
			return src;
		}
		int end = maxMarkLenth - decLen;
		if(end <=0)
			end = 1;
		return new StringBuffer(src.substring(0, end)).append("...").toString();
	}
	
}
