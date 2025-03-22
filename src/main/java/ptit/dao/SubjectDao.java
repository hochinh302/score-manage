package ptit.dao;

import ptit.dao.base.IDao;
import ptit.entity.Subject;
import ptit.enums.ProcedureEnum;
import ptit.utils.DataProviderUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SubjectDao implements IDao<Integer, Subject> {
    private ResultSet resultSet = null;
    private static SubjectDao instance;

    private SubjectDao() {

    }

    public static SubjectDao getInstance() {
        if (instance == null) {
            instance = new SubjectDao();
        }
        return instance;
    }

    @Override
    public List<Subject> getAll() {
        List<Subject> list = new ArrayList<>();
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.GET_ALL_SUBJECT.getSql());
            while (resultSet.next()) {
                Subject subject = new Subject(resultSet);
                list.add(subject);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Subject findById(Integer id) {
        try{
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.FIND_SUBJECT_BY_ID.getSql(), id);
            resultSet.next();
                Subject subject = new Subject(resultSet);
                return subject;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean add(Subject entity) {
        return DataProviderUtil.excuteUpdate(ProcedureEnum.ADD_SUBJECT.getSql(), entity.getName(), entity.getMaxScore(), entity.getSession(), entity.getStatus()) > 0;
    }

    @Override
    public boolean update(Subject entity) {
        return DataProviderUtil.excuteUpdate(ProcedureEnum.UPDATE_SUBJECT.getSql(), entity.getId(), entity.getName(), entity.getMaxScore(), entity.getSession(), entity.getStatus()) > 0;
    }

    @Override
    public boolean remote(Integer id) {
        return DataProviderUtil.excuteUpdate(ProcedureEnum.REMOVE_SUBJECT.getSql(), id) > 0;
    }
}
