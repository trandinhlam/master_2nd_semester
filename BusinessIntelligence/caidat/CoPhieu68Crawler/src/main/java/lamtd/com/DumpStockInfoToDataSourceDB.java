package lamtd.com;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import lamtd.com.entity.StockInfo;
import lamtd.com.utils.MySqlUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class DumpStockInfoToDataSourceDB {
    private static ObjectMapper mapper = new ObjectMapper();

    public static List<StockInfo> dump(String sourceFile) throws IOException, SQLException, ClassNotFoundException {
        List<StockInfo> remain = new ArrayList<>();
        File file = new File(sourceFile);
        String json = _getFromFile(file);
        JsonArray stocks = new Gson().fromJson(json, JsonArray.class);
        for (int i = 0; i < stocks.size(); i++) {
            JsonObject item = stocks.get(i).getAsJsonObject();
            StockInfo stock = new StockInfo(item);
            if (stock.getExchange().equals("HOSE")) {
                boolean b = MySqlUtils.insertData(stock);
            }else{
                remain.add(stock);
            }
        }
        return remain;
    }

    private static String _getFromFile(File file) throws IOException {
        List<String> lines = Files.readAllLines(file.toPath(), Charset.defaultCharset());
        return lines.stream().collect(Collectors.joining());
    }

}
