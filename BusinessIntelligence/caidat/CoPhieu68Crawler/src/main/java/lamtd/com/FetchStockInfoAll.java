package lamtd.com;

import lamtd.com.utils.HttpUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static lamtd.com.Config.VIETSTOCK_INFO_API;

public class FetchStockInfoAll {
    public static void main(String[] args) throws IOException {
        int page = 1;
        int size = 50;
        int maxPage = 1657 / size;
        Map<String, String> body = new HashMap<>();
        body.put("catID", "0");

        body.put("pageSize", "50");
        body.put("type", "1");
        body.put("industryID", "0");
        body.put("code", "");
        body.put("orderBy", "code");
        body.put("businessTypeID", "0");
        while (maxPage > page) {
            body.put("page", String.valueOf(page));
            String filename = "data/info2/" + page + ".json";
            HttpUtils.fetchJsonFromVietStockVN(VIETSTOCK_INFO_API, body, filename);
            page++;
        }
    }
}
