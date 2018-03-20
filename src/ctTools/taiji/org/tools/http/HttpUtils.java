package taiji.org.tools.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.client.methods.CloseableHttpResponse;


/**
 * @author Archmage
 */
public class HttpUtils {

	public static String getRespStr(CloseableHttpResponse resp) throws IllegalStateException, IOException {
		InputStream is = resp.getEntity().getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		StringBuilder sb = new StringBuilder();
		String str = null;
		while((str = br.readLine()) != null){
			sb.append(str);
		}
		return sb.toString();
		
	}

}
