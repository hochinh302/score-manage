package ptit.entity;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubjectCore {
    private String studentId;
    private int subjectId;
    private int type;
    private int exam;
    private float score;

    private String name;
    private float maxScore;

    public SubjectCore(ResultSet resultSet) throws SQLException {
        this.studentId = resultSet.getString("studentId");
        this.subjectId = resultSet.getInt("subjectId");
        this.type = resultSet.getInt("type");
        this.exam = resultSet.getInt("exam");
        this.score = resultSet.getFloat("score");
        this.name = resultSet.getString("name");
        this.maxScore = resultSet.getFloat("maxScore");
    }
}
