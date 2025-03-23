package ptit.dao;

import ptit.entity.SubjectCore;
import ptit.enums.ProcedureEnum;
import ptit.utils.DataProviderUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SubScoreDao {
    private ResultSet resultSet = null;
    private static SubScoreDao instance;

    private SubScoreDao() {

    }

    public static SubScoreDao getInstance() {
        if (instance == null) {
            instance = new SubScoreDao();
        }
        return instance;
    }

    //Search Score Home
    public List<SubjectCore> searchScore(String stuId) {
        List<SubjectCore> list = new ArrayList<>();
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.SEARCH_SCORE.getSql(), stuId);
            while (resultSet.next()) {
                SubjectCore newSubScore = new SubjectCore(resultSet);
                list.add(newSubScore);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lay theo dieu kien
    public List<SubjectCore> findByCondition(int classId, int subId, int type) {
        List<SubjectCore> list = new ArrayList<>();
        try {
            resultSet = DataProviderUtil.excuteQuery(ProcedureEnum.FIND_SUBSCORE.getSql(), classId, type, subId);
            while (resultSet.next()) {
                SubjectCore newSubScore = new SubjectCore(resultSet);
                list.add(newSubScore);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean add(SubjectCore entity) {
        return DataProviderUtil.excuteUpdate(ProcedureEnum.ADD_SUBSCORE.getSql(),
                entity.getSubjectId(), entity.getStudentId(), entity.getType(), entity.getExam(), entity.getScore()) > 0;
    }

    public boolean remote(int subId, String stuId) {
        return DataProviderUtil.excuteUpdate(ProcedureEnum.REMOVE_SUBSCORE.getSql(), subId, stuId) > 0;
    }
}
