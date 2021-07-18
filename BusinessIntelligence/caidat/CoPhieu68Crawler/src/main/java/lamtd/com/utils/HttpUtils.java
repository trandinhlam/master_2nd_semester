package lamtd.com.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public static String downloadCoPhieu68CSVFile(String url, String filePath) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpGet httpget = new HttpGet(url);
        httpget.setHeader("Cookie", "cp68screenwidth=1599; PHPSESSID=01c8mj8934lhpnvde6masmaeu1; _ga=GA1.2.1984893556.1621744974; cp68screenwidth=1599; cp68screenheight=798; _gid=GA1.2.17546607.1626572752; cophieu68username=dHJhbnRoaWVuaG9hbmcxNEBnbWFpbC5jb20%3D; cophieu68password=ZDQwOGE5ZjQ2NjExZDhjMWEzMWE2OTEzZDkwY2U5Njc%3D");
        HttpResponse response = client.execute(httpget);
        _saveFile(filePath, response);
        return filePath;
    }

    private static void _saveFile(String filePath, HttpResponse response) throws IOException {
        HttpEntity entity = response.getEntity();
        System.out.println(entity);
        BufferedInputStream bis = new BufferedInputStream(entity.getContent());
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
        int inByte;
        while ((inByte = bis.read()) != -1) bos.write(inByte);
        bis.close();
        bos.close();
    }

    public static void fetchJsonFromVietStockVN(String api, Map<String, String> body, String filePath) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(api);
        post.setHeader("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36");
        post.setHeader("Cookie", "ASP.NET_SessionId=ub1gxkzkpixs52vkpelaxyfb; __RequestVerificationToken=5rUvPJzNZcIcfCqYcth0oe72eYLOdmUSLnXyiBPP54VHIHH92G_d3kVGYh0QFBaSZ6xXf5KgYuvX33FOhr8-fwy65LCihJx0L2kTpagD1XI1; _ga=GA1.2.91124367.1621745811; _ga=GA1.3.91124367.1621745811; language=vi-VN; Theme=Light; AnonymousNotification=; isShowLogin=true; _gid=GA1.2.155431976.1625311103; _gid=GA1.3.155431976.1625311103; vts_usr_lg=1B65E892B2D43DB7E6C4C636EEB74321439158AE08D7BE869DBA7DAF597C21D2F5BBE2D3600D6FEE8CDD2E00635CA2BAAFC642235D2A1301CB10B6666DC89F12D4D7D26E051309F8E6857E8A7D33655261BDFFF9E19716D1321FE8D72D73A88FCBED589ED522877F88AC806EC87DD358BDF090FDD72D14723448DBF01F073019; vst_usr_lg_token=9klcOeCOYEG/+maQ4bsbWQ==; ats_referrer_history=%5B%22www.facebook.com%22%5D");
        post.setHeader("Content-type", "application/x-www-form-urlencoded");

        List<NameValuePair> params = new ArrayList<>();
        body.forEach((k, v) -> params.add(new BasicNameValuePair(k, v)));
        post.setEntity(new UrlEncodedFormEntity(params));
        HttpResponse response = client.execute(post);
        _saveFile(filePath, response);
    }
}
