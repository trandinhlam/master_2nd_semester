package lamtd.com;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class convertFileToFile {
    public static void main(String[] args) throws IOException {
        String dir = System.getProperty("user.dir");
        File file = new File(dir + "/data/ChiSo/HNX.csv");
        File outfile = new File(dir + "/data/ChiSo/HNX_2.csv");
        InputStream is = new FileInputStream(file);
        InputStreamReader in = new InputStreamReader(is, StandardCharsets.UTF_16);

        Writer out = new OutputStreamWriter(new FileOutputStream(outfile), "UTF-8");

        char cbuf[] = new char[2048];
        int len;
        while ((len = in.read(cbuf, 0, cbuf.length)) != -1) {
            out.write(cbuf, 0, len);
        }

        in.close();
        out.close();
    }
}
