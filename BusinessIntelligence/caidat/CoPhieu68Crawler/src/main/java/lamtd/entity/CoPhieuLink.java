package lamtd.entity;

import lamtd.Config;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CoPhieuLink {
    public static final CoPhieuLink fromStr(String id) {
        CoPhieuLink inst = new CoPhieuLink();
        inst.setId(id);
        inst.setLinkExportHistory(Config.COPHIEU68_DOMAIN + "/export/excelfull.php?id=" + id);
        return inst;
    }

    String id;
    String linkExportHistory;
}
