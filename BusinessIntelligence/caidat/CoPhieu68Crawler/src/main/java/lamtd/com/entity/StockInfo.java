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

    public StockInfo(JsonObject item) {
        this.setID(item.get("ID").getAsInt());
        this.setCatID(item.get("CatID").getAsInt());
        this.setExchange(item.get("Exchange").getAsString());
        this.setIndustryName(item.get("IndustryName").getAsString());
        this.setCode(item.get("Code").getAsString());
        this.setName(item.get("Name").getAsString());
        this.setTotalShares(item.get("TotalShares").getAsInt());
    }


}
