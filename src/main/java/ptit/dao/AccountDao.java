package ptit.dao;

import ptit.common.Constant;
import ptit.entity.Admin;
import ptit.enums.ProcedureEnum;
import ptit.utils.DataProviderUtil;
import java.sql.ResultSet;

public class AccountDao {

    private ResultSet resultSet = null;
    private static AccountDao instance;

    private AccountDao() {

    }

    public static AccountDao getInstance() {
        if (instance == null) {
            instance = new AccountDao();
        }
        return instance;
    }

    public boolean add(Admin entity) {
        return DataProviderUtil.excuteUpdate(ProcedureEnum.REGISTER_ADMIN.getSql(),
                entity.getName(), entity.getEmail(), entity.getPassword()) > 0;
    }

    public boolean update(Admin entity) {
        return DataProviderUtil.excuteUpdate(ProcedureEnum.UPDATE_TOKEN.getSql(),
                entity.getId(), entity.getToken()) > 0;
    }

    public Admin findByToken(String token) {
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.FIND_BY_TOKEN.getSql(), token);
            while (resultSet.next()) {
                Admin admin = new Admin(resultSet);
                return admin;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Admin findByInfo(String uEmail, String uPass) {
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.FIND_BY_INFO.getSql(), uEmail, uPass);
            while (resultSet.next()) {
                Admin admin = new Admin(resultSet);
                return admin;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
