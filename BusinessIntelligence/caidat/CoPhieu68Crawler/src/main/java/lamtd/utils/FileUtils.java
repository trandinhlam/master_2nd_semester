package lamtd.utils;

import lamtd.entity.CoPhieuLink;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

public class FileUtils {
    public static void writeToFile(List<CoPhieuLink> list) throws IOException {
        FileWriter writer = new FileWriter("links.txt");
        for (CoPhieuLink link : list) {
            writer.write(link.getId() + System.lineSeparator());
        }
        writer.close();
    }

    public static List<CoPhieuLink> readFromFile() throws IOException {
        FileReader reader = new FileReader("links.txt");
        BufferedReader br = new BufferedReader(reader);
        List<CoPhieuLink> rs = br.lines().map(CoPhieuLink::fromStr).collect(Collectors.toList());
        reader.close();
        return rs;
    }

}
