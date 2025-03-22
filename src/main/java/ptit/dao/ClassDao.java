package ptit.dao;

import ptit.dao.base.IDao;
import ptit.entity.Class;
import ptit.enums.ProcedureEnum;
import ptit.utils.DataProviderUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClassDao implements IDao<Integer, Class> {

    ResultSet resultSet = null;
    private static ClassDao instance;

    private ClassDao() {

    }

    public static ClassDao getInstance() {
        if (instance == null) {
            instance = new ClassDao();
        }

        return instance;
    }

    @Override
    public List<Class> getAll() {
        List<Class> list = new ArrayList<>();
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.GET_ALL_CLASS.getSql());
            while (resultSet.next()) {
                Class newClass = new Class(resultSet);
                list.add(newClass);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Class findById(Integer id) {
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.FIND_CLASS_BY_ID.getSql(), id);
            while (resultSet.next()) {
                Class newClass = new Class(resultSet);
                return newClass;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean add(Class entity) {
        try {
            return DataProviderUtil.excuteUpdate(ProcedureEnum.ADD_CLASS.getSql(), entity.getName(), entity.getStatus()) > 0;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Class entity) {
        try {
            return DataProviderUtil.excuteUpdate(ProcedureEnum.UPDATE_CLASS.getSql(), entity.getId(), entity.getName(), entity.getStatus()) > 0;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean remote(Integer id) {
        try {
            return DataProviderUtil.excuteUpdate(ProcedureEnum.REMOVE_CLASS.getSql(), id) > 0;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}