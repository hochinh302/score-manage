package ptit.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class DataProviderUtil {
    private static ResultSet result;
    private static Connection connection = DbConnectUtil.connection();
    private static CallableStatement cs;

    public static ResultSet excuteQuery(String sql, Object... params) {
        try {
            cs = connection.prepareCall(sql);
            if (params != null)
                for (int i = 0; i < params.length; i++) {
                    cs.setObject(i + 1, params[i]);
                }

            result = cs.executeQuery();
            return result;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int excuteUpdate(String sql, Object... params) {
        try {
            cs = connection.prepareCall(sql);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    cs.setObject(i + 1, params[i]);
                }
            }

            return cs.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
