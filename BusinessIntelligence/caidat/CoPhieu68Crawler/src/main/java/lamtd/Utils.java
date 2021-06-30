package lamtd;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class Utils {
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
}
