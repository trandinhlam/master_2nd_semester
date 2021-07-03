package lamtd.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

public class DateUtils {
    public static SimpleDateFormat DD_MM_YYYY = new SimpleDateFormat();

    public static final String formatDD_MM_YYYY(long timestamp) {
        return format(timestamp, "dd-MM-yyyy", "GMT+7");
    }

    public static String format(long milliSeconds, String format, String timezone) {
        final SimpleDateFormat df = new SimpleDateFormat(format);
        df.setTimeZone(TimeZone.getTimeZone(timezone));
        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        cal.setTimeInMillis(milliSeconds);
        return df.format(cal.getTime());
    }
}
