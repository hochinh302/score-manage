package ptit.entity;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private String id;
    private String name;
    private int status;
    private int sex;
    private int classId;
    private String birthday;
    private String className;

    public Student(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getString("id");
        this.name = resultSet.getString("name");
        this.status = resultSet.getInt("status");
        this.sex = resultSet.getInt("sex");
        this.classId = resultSet.getInt("classId");
        this.birthday = resultSet.getString("birthday");
        this.className = resultSet.getString("className");
    }
}
