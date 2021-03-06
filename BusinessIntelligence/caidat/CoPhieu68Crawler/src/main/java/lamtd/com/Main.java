package lamtd.com;

import lamtd.com.entity.StockInfo;
import lamtd.com.utils.DateUtils;
import lamtd.com.utils.FileUtils;
import lamtd.com.utils.HttpUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class Main {
    private static final Logger LOG = Logger.getLogger(Main.class);

    static {
        PropertyConfigurator.configure("resources/log4j.properties");
    }

    public static void main(String[] args) throws IOException, SQLException, ClassNotFoundException {
//        executeDownloadFromCoPhieu68Daily();
//        FetchStockInfoAll.main(args);
        _dumpStockToDB();
    }

    private static void _dumpStockToDB() throws IOException, SQLException, ClassNotFoundException {
        String path = System.getProperty("user.dir");
        int count = 0;
        List<StockInfo> remaims = new ArrayList<>();
        while (++count < 35) {
            String file = path + "/data/info2/" + count + ".json";
            remaims.addAll(DumpStockInfoToDataSourceDB.dump(file));
        }
        FileUtils.writeExportEntityToFile("/data/source_cophieu",remaims);
    }

    private static void executeDownloadFromCoPhieu68Daily() {
        try {
            long _01072021 = 1625072400_000l;
            long current = System.currentTimeMillis();
            long ago = TimeUnit.DAYS.toMillis(1);
            while (current > _01072021) {
                current -= ago;
                String dateStr = DateUtils.formatDD_MM_YYYY(current);
                String filePath = "data/date/" + dateStr + ".csv";
                HttpUtils.downloadCoPhieu68CSVFile(Config.DOWNLOAD_BY_DATE + dateStr, filePath);
                Thread.sleep(100l);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
