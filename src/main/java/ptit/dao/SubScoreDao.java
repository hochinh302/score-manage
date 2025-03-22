package ptit.dao;


import com.bkap.btl_jsp.constants.JSPConstant;
import com.bkap.btl_jsp.entities.SubjectCore;
import com.bkap.btl_jsp.utils.DataProvider;

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
            resultSet = DataProvider.excuteQuery(JSPConstant.searchScore, stuId);
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
            resultSet = DataProvider.excuteQuery(JSPConstant.subScoreFind, classId, type, subId);
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
        return DataProvider.excuteUpdate(JSPConstant.addSubScore,
                entity.getSubjectId(), entity.getStudentId(), entity.getType(), entity.getExam(), entity.getScore()) > 0;
    }

    public boolean remote(int subId, String stuId) {
        return DataProvider.excuteUpdate(JSPConstant.subScoreRemove, subId, stuId) > 0;
    }
}
