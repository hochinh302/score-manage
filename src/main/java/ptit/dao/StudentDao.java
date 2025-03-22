package ptit.dao;

import ptit.dao.base.IDao;
import ptit.entity.Student;
import ptit.enums.ProcedureEnum;
import ptit.utils.DataProviderUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDao implements IDao<String, Student> {

    ResultSet resultSet = null;
    private static StudentDao instance;

    private StudentDao() {

    }

    public static StudentDao getInstance() {
        if (instance == null) {
            instance = new StudentDao();
        }

        return instance;
    }

    public List<Student> findByClass(int id) {
        List<Student> listStu = new ArrayList<>();
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.FIND_STUDENT_BY_CLASS.getSql(), id);
            while (resultSet.next()) {
                Student newStu = new Student(resultSet);
                listStu.add(newStu);
            }
            return listStu;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Student> getAll() {
        List<Student> list = new ArrayList<>();
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.GET_ALL_STUDENT.getSql());
            while (resultSet.next()) {
                Student newStu = new Student(resultSet);
                list.add(newStu);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Student findById(String id) {
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.FIND_STUDENT_BY_ID.getSql(), id);
            while (resultSet.next()) {
                Student newStu = new Student(resultSet);
                return newStu;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean add(Student entity) {
        try {
            return DataProviderUtil.excuteUpdate(ProcedureEnum.ADD_STUDENT.getSql(), entity.getId(), entity.getName(), entity.getSex(), entity.getClassId(), entity.getBirthday(), entity.getStatus()) > 0;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Student entity) {
        try {
            return DataProviderUtil.excuteUpdate(ProcedureEnum.UPDATE_STUDENT.getSql(), entity.getId(), entity.getName(), entity.getSex(), entity.getClassId(), entity.getBirthday(), entity.getStatus()) > 0;
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean remote(String id) {
        try {
            return DataProviderUtil.excuteUpdate(ProcedureEnum.REMOVE_STUDENT.getSql(), id) > 0;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
