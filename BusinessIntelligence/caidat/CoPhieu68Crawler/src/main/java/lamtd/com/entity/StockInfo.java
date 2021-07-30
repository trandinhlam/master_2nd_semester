package lamtd.com.entity;

import com.google.gson.JsonObject;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class StockInfo {
    int ID;
    int CatID;
    String Exchange;
    String IndustryName;
    String Code;
    String Name;
    int TotalShares;
    int maNganh;
    int maPhanNganh;

    public StockInfo(JsonObject item) {
        this.setID(item.get("ID").getAsInt());
        this.setCatID(item.get("CatID").getAsInt());
        this.setExchange(item.get("Exchange").getAsString());
        try{
        this.setIndustryName(item.get("IndustryName2").getAsString());
        }catch (Exception ex){
            this.setIndustryName("");
        }
        this.setCode(item.get("Code").getAsString());
        this.setName(item.get("Name").getAsString());
        this.setTotalShares(item.get("TotalShares").getAsInt());
        try{

        String TenNganh = item.get("IndustryName1").getAsString();
        this.setMaNganh(getMaNganh(TenNganh));
        }catch (Exception ex){
            this.setMaNganh(0);
        }
    }

    public static int getMaNganh(String industryName) {
        for (Nganh nganh : Nganh.values()) {
            if (nganh.getName().equals(industryName)) {
                return nganh.getId();
            }
        }
        return 0;
    }


}
