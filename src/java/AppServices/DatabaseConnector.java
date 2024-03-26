/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AppServices;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Kelum
 */
public class DatabaseConnector {
    private static final String dbUrl = "jdbc:mysql://localhost:3306/abc_lab_db?autoReconnect=true&useSSL=false";
    private static final String dbUsername = "abc_lab_user";
    private static final String dbPassword = "Abc@123456789";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex);
        }
        return connection;
    }
}
