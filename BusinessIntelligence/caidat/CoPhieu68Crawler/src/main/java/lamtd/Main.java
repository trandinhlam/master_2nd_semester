package lamtd;

import lamtd.entity.CoPhieuLink;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    public static void main(String[] args) throws IOException {

        String contentFromURL = Utils.getContentFromURL("http://www.cophieu68.vn/export.php");
        System.err.println(contentFromURL);
        List<CoPhieuLink> list = _getListHistorycalLinks(contentFromURL);
        _writeToFile(list);
    }

    private static void _writeToFile(List<CoPhieuLink> list) throws IOException {
        FileWriter writer = new FileWriter("links.txt");
        for (CoPhieuLink link : list) {
            writer.write(link.getId() + System.lineSeparator());
        }
        writer.close();
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
