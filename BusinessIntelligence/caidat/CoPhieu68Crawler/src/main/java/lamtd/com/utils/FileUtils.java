package lamtd.com.utils;

import lamtd.com.entity.CoPhieuLink;
import lamtd.com.entity.StockInfo;

import java.io.*;
import java.util.List;
import java.util.stream.Collectors;

public class FileUtils {
    public static void writeExportEntityToFile(String fileName, List<StockInfo> listValue) {
        int ID;
        int CatID;
        String Exchange;
        String IndustryName;
        String Code;
        String Name;
        int TotalShares;
        int maNganh;
        int maPhanNganh;
        try {
            String fullName = (fileName.indexOf(".") < 0) ? fileName + ".csv" : fileName;
            PrintWriter writer = new PrintWriter(fullName, "UTF-8");
            writer.println("\"ID\";\"CatID\";\"ExchangeName\";\"IndustryName\";\"Code\";\"Name\";\"TotalShares\";\"maNganh\";\"maPhanNganh\"");
            for (int i = 0; i < listValue.size(); i++) {
                StockInfo item = listValue.get(i);
                writer.print(item.getID());
                writer.print(";");
                writer.print(item.getCatID());
                writer.print(";");
                writer.print(item.getExchange());
                writer.print(";");
                writer.print(item.getIndustryName());
                writer.print(";");
                writer.print(item.getCode());
                writer.print(";");
                writer.print(item.getName());
                writer.print(";");
                writer.print(item.getTotalShares());
                writer.print(";");
                writer.print(item.getMaNganh());
                writer.print(";");
                writer.print(item.getMaPhanNganh());
                writer.println();
            }
            writer.close();

        } catch (IOException ex) {
        }
    }

}
