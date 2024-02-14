package cred;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class login {
    public static void insertRecord(int S_num, String Name, String Email,String password) throws SQLException, ClassNotFoundException {
        data connect = new data();
        try {
            String insertQuery = "INSERT INTO details.final(S_num, Name,Email,password,date) VALUES (?, ?, ?, ?,?)";
            PreparedStatement preparedStatement = connect.con.prepareStatement(insertQuery);
            preparedStatement.setInt(1,S_num);
            preparedStatement.setString(2, Name);
            preparedStatement.setString(3, Email);
            preparedStatement.setString(4, password);
            preparedStatement.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
} finally {
            connect.con.close();

        }
    }
}
