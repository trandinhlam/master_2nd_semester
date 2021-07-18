package lamtd.com.utils;

import lamtd.com.entity.StockInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MySqlUtils {
    private static Connection connect = null;
    private static PreparedStatement preStatement = null;

    public static boolean insertData(StockInfo stock) throws ClassNotFoundException, SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/source_doanhnghiep?" +
                    "useUnicode=true&useSSL=false&characterEncoding=UTF-8" +
                    "&user=root1&password=root1");
            String sql = String.format("insert into source_doanhnghiep.src_cophieu(ID,CatID,Exchange,IndustryName,Code,Name,TotalShares)" +
                    " values (?,?,?,?,?,?,?)");

            preStatement = connect.prepareStatement(sql);
            preStatement.setInt(1, stock.getID());
            preStatement.setInt(2, stock.getCatID());
            preStatement.setString(3, stock.getExchange());
            preStatement.setString(4, stock.getIndustryName());
            preStatement.setString(5, stock.getCode());
            preStatement.setString(6, stock.getName());
            preStatement.setInt(7, stock.getTotalShares());
            return preStatement.execute();
        } finally {
            connect.close();
        }
    }
}
