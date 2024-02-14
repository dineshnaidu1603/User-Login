package cred;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


// This class is used to connect to the database
public class data {
    Connection con;
    data() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/details", "root", "Dinesh@1603");
    }
}
