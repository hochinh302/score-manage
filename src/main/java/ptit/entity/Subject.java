package ptit.entity;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Subject {
    private int id;
    private String name;
    private String session;
    private int status;
    private int maxScore;

    public Subject(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.name = resultSet.getString("name");
        this.maxScore = resultSet.getInt("maxScore");
        this.session = resultSet.getString("session");
        this.status = resultSet.getInt("status");
    }
}
