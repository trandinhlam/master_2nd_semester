package lamtd.utils;

import lombok.extern.java.Log;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class HttpUtils {
    public static String getContentFromURL(String url) throws IOException {
        URL urlObj = new URL(url);
        URLConnection conn = urlObj.openConnection();
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        String rs = "";
        while ((inputLine = br.readLine()) != null) {
            rs += inputLine;
        }
        br.close();
        return rs;
    }

    public static String downloadCSVFile(String url) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpGet httpget = new HttpGet("https://portal.sun.com/portal/dt");
        httpget.setHeader("Cookie", "PHPSESSID=o98o1kk49snls5hdmuainiids1;cophieu68username=dHJhbnRoaWVuaG9hbmcxNEBnbWFpbC5jb20%3D; cophieu68password=ZDQwOGE5ZjQ2NjExZDhjMWEzMWE2OTEzZDkwY2U5Njc%3D");
        HttpResponse response = client.execute(httpget);
        HttpEntity entity = response.getEntity();
        System.out.println(entity);
        return "";

    }

    public static void main(String[] args) throws IOException {
        try{

        downloadCSVFile("http://www.cophieu68.vn/export/excelfull.php?id=^vnindex");
        }catch (Exception ex){
            ex.printStackTrace();
        }

    }
}
