/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.sql.*;
import org.apache.jasper.tagplugins.jstl.core.Catch;

public class ConnectionProvider {

    public static Connection con;

    public static Connection getConnection() {
        try {
           
             Class.forName("com.mysql.cj.jdbc.Driver");
             System.out.println("driver loaded");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/publicdaybook","root","root");
             System.out.println("connection created");
             System.out.println(con);
             return con;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
