package com.codebook.Connections;
import java.sql.*;
public class ConnectionFactory {
    private static Connection connection=null;
    public static void BuildConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/cybershield", "root", "");
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    public static Connection getConnection(){
        return connection;
    }
    public static void closeConnection(){
        try{
            connection.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
}
