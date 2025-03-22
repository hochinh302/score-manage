package ptit.utils;

import ptit.common.Constant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnectUtil {
    public static Connection connection() {
        try {
            Class.forName(Constant.DRIVE);
            Connection sqlConn = DriverManager.getConnection(Constant.URL, Constant.USER, Constant.PASS);
            return sqlConn;
        }
        catch(Exception e) {
            e.printStackTrace();
            System.out.printf("Xãy ra lỗi khi thực hiện kết nối DB: {}", e.getMessage());
        }
        return null;
    }
}
