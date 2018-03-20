package taiji.org.tools.http;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.StatusLine;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.cookie.BasicClientCookie;

import taiji.org.tools.AccessUtil;
import taiji.org.tools.ComplexUtil;
import taiji.org.tools.EmptyUtil;
import taiji.org.tools.file.DFile;
import taiji.org.tools.file.FileMemory;
import taiji.org.tools.log.MyLog;


/**
 * @author Archmage
 */
public class HttpByHeader {
	private BasicCookieStore cookieStore = null;
	private CloseableHttpClient httpclient = null;
	private boolean isInit = false;
	
//	private static  Map<String,String> downLoadsMap = ComplexUtil.map();
	
	
	public HttpByHeader(){
		cookieStore = new BasicCookieStore();
		httpclient = HttpClients.custom()
				.setDefaultCookieStore(cookieStore).build();
		isInit = true;
		
		
	}
	
	
	
	private static void addCookies(CookieStore cs, String cookieStr) {
		if(EmptyUtil.isEmptyStr(cookieStr))
			return;
		String [] ss = cookieStr.split(";");
		
		for(int i = 0 ; i< ss.length; i++){
			String c = ss[i].trim();
			if(EmptyUtil.isEmptyStr(c))
				continue;
			int d = c.indexOf("=");
			if(d <=0)
				continue;
			cs.addCookie(new BasicClientCookie(c.substring(0, d),c.substring(d+1)));
		}
	
	}
	
	public String cc = null;
	/**
	 * 访问http的方法
	 * @param isPost
	 * @param uri
	 * @param params
	 * @param callback
	 */
	public boolean  testCookieLogin(boolean isPost,String uri,String cookieStr,GetCallBack callback)
			 {
		if(EmptyUtil.isEmptyStr(cookieStr)){
			return false;
		}
		reset();
		CloseableHttpResponse resp = null;
		try{
			RequestBuilder builder = send(isPost,uri,null);
			final HttpUriRequest r = builder.build();
			r.addHeader("Connection","keep-alive");
	//		JSESSIONID=E841AA8017AA8FAF76CC51908C500A7E; _ias_client_token=_FF80808153C2ABB40153C5643F1205BF; _pk_id.193.dc37=317090989fa0a724.1459306634.1.1459309956.1459306634.; _pk_ses.193.dc37=*
			cookieStr = 	cookieStr.trim();
			r.addHeader("Cookie",cookieStr);
			cc = cookieStr;
	//		addCookies(cookieStore,cookieStr);
			
			MyLog.debug("Cookie=" +cookieStr.trim());
			/*ComplexUtil.eachMap(MainMemory.header.headerMap, new ComplexUtil.Each<String, String>() {
				public void each(String k, String v) {
					r.addHeader(k,v);
					sb.append(k+":" + v).append("\r\n");
				}
			});*/
			resp = httpclient.execute(r);
			StatusLine statusLine = resp.getStatusLine();
			String str = HttpUtils.getRespStr(resp);
			MyLog.debug("返回结果\r\n" + str);
			if(200  == statusLine.getStatusCode()){
				resp.close();
				callback.callback(true,str);
			    List<Cookie> cookies = cookieStore.getCookies();
                if (cookies.isEmpty()) {
                   MyLog.debug("cookies None");
                } else {
                	MyLog.debug("cookies:");
                    for (int i = 0; i < cookies.size(); i++) {
                    	MyLog.debug("- " + cookies.get(i).toString());
                    }
                }
				return true;
			}else{
				resp.close();
				callback.callback(false,str);
				return false;
			}
		}catch(Exception err){
			
		}finally{
			try {
				if(resp!=null)
					resp.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * 访问http的方法
	 * @param isPost
	 * @param uri
	 * @param params
	 * @param callback
	 */
	public void doSend(boolean isPost,String uri, Map<String, String> params,GetCallBack callback)
			 {
		MyLog.debug("sendUrl:" + uri);
		CloseableHttpResponse resp = null;
		try{
			Thread.sleep(500);
			RequestBuilder builder = send(isPost,uri,params);
			final HttpUriRequest r = builder.build();
			if(!EmptyUtil.isEmptyStr(cc)){
				r.addHeader("Connection","keep-alive");
				r.addHeader("Cookie",cc);
			}
			resp = httpclient.execute(r);
			
			StatusLine statusLine = resp.getStatusLine();
			String str = HttpUtils.getRespStr(resp);
			MyLog.debug("返回结果\r\n" + str);
			if(200  == statusLine.getStatusCode()){
				resp.close();
		
				callback.callback(true,str);
			}else{
				resp.close();
				callback.callback(false,str);
			}
		}catch(Exception err){
			err.printStackTrace();
			
		}finally{
			try {
				resp.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void downLoadFile(boolean isPost,String uri,String suf,GetCallBack callback){
		
		CloseableHttpResponse resp = null;
		try{
			if(suf == null){
				int l = uri.lastIndexOf(".");
				suf  = uri.substring(l + 1);
			}
			RequestBuilder builder = send(isPost,uri,null);
			final HttpUriRequest r = builder.build();
			if(!EmptyUtil.isEmptyStr(cc)){
				r.addHeader("Connection","keep-alive");
				r.addHeader("Cookie",cc);
			}
			resp = httpclient.execute(r);
			StatusLine statusLine = resp.getStatusLine();
			if(200  == statusLine.getStatusCode()){
				String access = AccessUtil.saveAccess(resp.getEntity().getContent(), suf);
				resp.close();
				callback.callback(true, uri);
			}else{
				resp.close();
				callback.callback(false, "");
			}
		}catch(Exception err){
			
		}finally{
			try {
				resp.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public void downLoadFile(boolean isPost,String uri,GetCallBack callback){
		
		CloseableHttpResponse resp = null;
		try{
			int l = uri.lastIndexOf(".");
			String suf  = uri.substring(l + 1);
			RequestBuilder builder = send(isPost,uri,null);
			final HttpUriRequest r = builder.build();
			if(!EmptyUtil.isEmptyStr(cc)){
				r.addHeader("Connection","keep-alive");
				r.addHeader("Cookie",cc);
			}
			resp = httpclient.execute(r);
			StatusLine statusLine = resp.getStatusLine();
			if(200  == statusLine.getStatusCode()){
				String access = AccessUtil.saveAccess(resp.getEntity().getContent(), suf);
				addToDownLoadsMap(uri,access);
				resp.close();
				callback.callback(true, uri);
			}else{
				resp.close();
				callback.callback(false, "");
			}
		}catch(Exception err){
			
		}finally{
			try {
				resp.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public RequestBuilder send(boolean isPost,String uri, Map<String, String> params) {
		RequestBuilder builder = null;
		if(isPost){
			builder = RequestBuilder.post();
		}else{
			builder = RequestBuilder.get();
		}
		try {
			builder.setUri(new URI(uri));
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		final StringBuilder sb = new StringBuilder("addParams...:");
		if (params != null && params.size() > 0 ) {
			Set<Map.Entry<String, String>> set = params.entrySet();
			Iterator<Map.Entry<String, String>> it = set.iterator();
			while (it.hasNext()) {
				Map.Entry<String, String> entry = it.next();
				String key = entry.getKey();
				builder.addParameter(entry.getKey() , String.valueOf(entry.getValue()));
				
				sb.append(entry.getKey()+"=" + String.valueOf(entry.getValue())).append("\r\n");
			}
		}
		MyLog.debug(sb.toString());

		return builder;
	}
	
	
	
	
	public void clearCookie() {
		cookieStore.clear();
	}

	public void reset() {
		isInit = false;
		try {
			if (httpclient != null)
				httpclient.close();
		} catch (Exception e) {
		}
		cookieStore = new BasicCookieStore();
		httpclient = HttpClients.custom()
				.setDefaultCookieStore(cookieStore).build();
		isInit = true;
	}
	
	public void close() throws IOException{
		cookieStore.clear();
		if (httpclient != null)
			httpclient.close();
	}
	

	public BasicCookieStore getCookieStore() {
		return cookieStore;
	}

	public CloseableHttpClient getHttpclient() {
		return httpclient;
	}
	
	public interface GetCallBack{
		void callback(boolean isSuccess, String str);
	}

	public static String getUriParams(Map<String, String> params) {
		final StringBuilder sb = new StringBuilder("");
		ComplexUtil.eachMap(params, new ComplexUtil.Each<String, String>() {
			public void each(String k, String v) {
				sb.append("&").append(k).append("=");
				if(EmptyUtil.isEmptyStr(v) || "null".equalsIgnoreCase(v)){
					v = "";
				}
				if(k.contains("Time")){
					//应该使用urlencode
					try{
						v =  java.net.URLEncoder.encode(v,"utf-8");
					}catch(Exception err){
						//i
					}
				}
				sb.append(v);
			}
			
		});
		return sb.toString();
	}
	
	private static void addToDownLoadsMap(String url,String path){
		if(EmptyUtil.isEmptyStr(url)){
			return;
		}
		if(FileMemory.hasUrl(url)){
			return;
		}
		DFile dfile = FileMemory.addFile(url, path);
		
		//不再记录到db
	//	dfile.saveToDB();
		
	}
	
	public static void main(String [] args)throws Exception {
			
		
	}
}
