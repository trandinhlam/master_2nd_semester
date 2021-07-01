package lamtd;

import lamtd.entity.CoPhieuLink;
import lamtd.utils.FileUtils;
import lamtd.utils.HttpUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    private static final Logger LOG = Logger.getLogger(Main.class);

    static {
        PropertyConfigurator.configure("log4j.properties");
    }

    public static void main(String[] args) throws IOException {
        //fetch list
//        _fetchList();
        //pull list
        _pullList();
    }

    private static void _pullList() throws IOException {
        List<CoPhieuLink> links = FileUtils.readFromFile();
        LOG.info(links);

    }

    private static void _fetchList() throws IOException {
        String contentFromURL = HttpUtils.getContentFromURL("http://www.cophieu68.vn/export.php");
        System.err.println(contentFromURL);
        List<CoPhieuLink> list = _getListHistorycalLinks(contentFromURL);
        FileUtils.writeToFile(list);
    }


    private static Pattern LINK_PATTERN = Pattern.compile("export\\/excelfull\\.php\\?id=([a-zA-Z0-9\\^]+)");

    private static List<CoPhieuLink> _getListHistorycalLinks(String contentFromURL) {
        String[] lines = contentFromURL.split("<td");
        List<CoPhieuLink> links = new ArrayList<>();
        for (String line : lines) {
            Matcher matcher = LINK_PATTERN.matcher(line);
            if (matcher.find()) {
                String link = matcher.group(1);
                CoPhieuLink coPhieuLink = new CoPhieuLink();
                coPhieuLink.setLinkExportHistory(link);
                coPhieuLink.setId(link);
                links.add(coPhieuLink);
            }
        }
        return links;
    }

}
