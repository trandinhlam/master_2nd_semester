package lamtd.com;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import lamtd.com.entity.StockInfo;
import lamtd.com.utils.MySqlUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class DumpStockInfoToDataSourceDB {
    private static ObjectMapper mapper = new ObjectMapper();

    public static void dump(String sourceFile) throws IOException, SQLException, ClassNotFoundException {
        File file = new File(sourceFile);
        String json = _getFromFile(file);
        JsonArray stocks = new Gson().fromJson(json, JsonArray.class);
        for (int i = 0; i < stocks.size(); i++) {
            JsonObject item = stocks.get(i).getAsJsonObject();

            StockInfo stock = new StockInfo(item);
            boolean b = MySqlUtils.insertData(stock);
        }
    }

    private static String _getFromFile(File file) throws IOException {
        List<String> lines = Files.readAllLines(file.toPath(), Charset.defaultCharset());
        return lines.stream().collect(Collectors.joining());
    }

}
