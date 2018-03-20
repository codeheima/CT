package taiji.org.tools.file;

import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * @author Archmage
 */
public class DFile {
	private final String md5 ;
	private final String url;
	/**
	 * 该createTime仅在中转机上使用
	 */
	private final long createTime ;
	private final String path;
	
	public DFile(){
		this("","",0l,"");
	}
	
	public DFile(ResultSet rs) throws SQLException {
		this(rs.getString("acc_md5"),rs.getString("acc_url"),
				Long.parseLong( rs.getString("acc_createTime")),
				rs.getString("acc_path"));
	}
	
	public DFile(String md5,String url,long createTime,String path){
		this.md5 = md5;
		this.url =url;
		this.createTime = createTime;
		this.path = path;
	}
	

	public String getMd5() {
		return md5;
	}

	public String getUrl() {
		return url;
	}

	public long getCreateTime() {
		return createTime;
	}

	public String getPath() {
		return path;
	}

	/**
	 * 是否同一文件
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean isSameFile(DFile d1,DFile d2){
		if(d2.url.equals(d1.url)){
			return true;
		}else if(d2.md5.equals(d1.md5)){
			return true;
		}else{
			return false;
		}
		
	}

	public void saveToDB() {
		//TODO save access
	}
	
	
}
