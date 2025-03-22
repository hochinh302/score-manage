package ptit.entity;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private int id;
    private String name;
    private String email;
    private String password;
    private String token;

    public Admin(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.name = resultSet.getString("name");
        this.email = resultSet.getString("email");
        this.password = resultSet.getString("password");
        this.token = resultSet.getString("token");
    }
}
