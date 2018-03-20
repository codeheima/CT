package taiji.org.tools;




public class Access {
	public String url = null;
	public String path = null;
	
	public Access(String url, String path) {
		super();
		this.url = url;
		this.path = path;
	}

	public static Access saveAccess(String url,String path){
		Access a = new Access(url,path);
		//TODO save Access
		
		return a ;
	}
}
