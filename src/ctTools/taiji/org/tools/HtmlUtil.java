package taiji.org.tools;

import java.util.List;


/**
 * @author Archmage
 */
public class HtmlUtil {

	public static int skipMark(String src, String mark, int start,int end) {
		//test by tr
		String startMark = "<" + mark;  // <tr
		String endMark = "</" + mark + ">"; // </tr>
		
		int i = src.indexOf(endMark, start);
		if(end >0 && i > end){
			return -1;
		}
		if(i <=0){
			return -1;
		}
		
		return i +endMark.length();
	}
	public static CatchString catchMarkByAttr(String src, String mark,String attr,String attrVal ,int start,
			int end) {
		int markLen = mark.length();
		CatchString result = new CatchString();
		String attrAll = attr + "=\"" + attrVal + "\""; 
		//id="caseCode_txt"
		
		int s = -1;
		if(start >0){
			s = src.indexOf(attrAll,start);
		}else{
			s = src.indexOf(attrAll);
		}
		while(s >0){
			int markStart = src.lastIndexOf("<",s);
			String markFind = src.substring(markStart + 1, markStart + 2 + markLen).trim();
			if(mark.equals(markFind)){
				return catchMark(src,mark,markStart - 1,end);
			}
			s = src.indexOf(attrAll, s + attrAll.length());
		}
		return result;
	}

	public static CatchString catchMarkByCenterName(String html,String centerName, String mark,int next) {
		CatchString cs = new CatchString();
		if(next <=0){
			next = 0;
		}
		while(!cs.isSuccess){
			int centerIndex =  html.indexOf(centerName,next);
			if(centerIndex <=0){
				break;
			}
			cs = HtmlUtil.catchMark(html, centerIndex);
			if(cs.isSuccess && !mark.equals(cs.mark)){
				cs.isSuccess = false;
			}
			next = centerIndex + centerName.length();
		}
	
		return cs;
	}
	
	public static CatchString catchMark(String src,int center){
		CatchString result = new CatchString();
		int s = src.lastIndexOf("<",center);
		if(s <= 0){
			return result;
		}
		int e = src.indexOf(">", center);
		if(e <= 0){
			return result;
		}
		int endMarkStart = src.lastIndexOf("</",e);
		if(endMarkStart <= 0){
			return result;
		}
		String mark = src.substring(endMarkStart + 2 ,e); 
		result.mark = mark;
		result.str = src.substring(s, e +1);
		if(result.str.startsWith("<" + mark)){
			result.isSuccess = true;
		}
		result.e = e;
		result.s = s;
		return result;
		
	}
	
	public static CatchString catchMark(String src, String mark, int start,
			int end) {
		CatchString result = new CatchString();
		result.mark = mark;
		//test by tr
		String startMark = "<" + mark;  // <tr
		String endMark = "</" + mark + ">"; // </tr>
		
		int s = src.indexOf(startMark, start);
		if(end >0 && s > end){
			return result;
		}
		if(s <=0){
			return result;
		}
		int e = src.indexOf(endMark,s);
		
		if(end >0 && e > end){
			return result;
		}
		if(e <=0){
			return result;
		}
		e = e + endMark.length();
		result.str = src.substring(s, e);
		result.s = s;
		result.e = e;
		result.isSuccess = true;
		return result;
	}

	
	public static String getText(String str){
		int start = str.indexOf(">");
		int end = str.lastIndexOf("</");
		if(start <=0 || end <=0 ||start >=end){
			return "";
		}
		
		return str.substring(start + 1, end).trim();
	}
	
	public static String getAttr(String src,String attr){
		String sMark =attr + "=\"";
		int s = src.indexOf(sMark);
		if(s <=0){
			return "";
		}
		int e = src.indexOf("\"",s + sMark.length());
		if(s <=0 || e <=0 ||s >=e){
			return "";
		}
		return src.substring(s + sMark.length(), e);
	}
	
	public static class CatchString{
		public String str;
		public String mark;
		public int s;
		public int e;
		public boolean isSuccess = false;
		public String getText() {
			return HtmlUtil.getText(str);
		}
		public String getAttr(String attr) {
			return HtmlUtil.getAttr(str,attr);
			
		}
		@Override
		public String toString() {
			return "CatchString [str=" + str + ", mark=" + mark
					+ ", isSuccess=" + isSuccess + "]";
		}
		public List<String> getInnerText(String mark) {
			List<String> list = ComplexUtil.list();
			
			CatchString cs = catchMark(str,mark,0,-1);
			
			while(cs.isSuccess){
				list.add(cs.getText());
				cs = catchMark(str,mark,cs.e,-1);
			}
			
			return list;
		}
	
		
	}
	
	
}
