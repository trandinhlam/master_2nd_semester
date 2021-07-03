package lamtd;

import lamtd.utils.DateUtils;
import lamtd.utils.HttpUtils;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class Main {
    private static final Logger LOG = Logger.getLogger(Main.class);

    static {
        PropertyConfigurator.configure("./log4j.properties");
    }

    public static void main(String[] args) throws IOException {
//        executeDownloadFromCoPhieu68Daily();
//        FetchStockInfoAll.main(args);
    }

    private static void executeDownloadFromCoPhieu68Daily() {
        try {
            long _01012016 = 1451581200_000l;
            long _14122016 = 1481648400_000l;
            long current = _14122016;
            long ago = TimeUnit.DAYS.toMillis(1);
            while (current > _01012016) {
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
