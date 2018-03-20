package taiji.org.tools;


/**
 * @author Archmage
 */
public class StringUtil {
	public static String delTag(String str,String sTag, String eTag){
		int i=-1;
		int j=-1;
		String str1="";
		String str2="";
		int size =0;
		while(str.contains(sTag) && str.contains(eTag)){
			size = str.length();
			i= str.indexOf(sTag);
			j=str.indexOf(eTag,i);
			if(j<0) break;
			str1=str.substring(0,i);
			str2 = str.substring(j+eTag.length(),size);
			str=str1+str2;
		}
		return str;
	}
	
	
	
	public static void main(String [] args){
		

	}
}
