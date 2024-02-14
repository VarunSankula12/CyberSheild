package com.codebook.admin;
import com.codebook.Connections.ConnectionFactory;
import com.codebook.bean.Bean;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

public class adminDao {
    
    public static ResultSet Retrieve(String query){
        ResultSet rs=null;
        try{
            ConnectionFactory.BuildConnection();
            Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        rs=ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
     public static String imageConversion(Blob pic){
        String Profilepic="";
        try{
            InputStream inputStream = pic.getBinaryStream();

                     ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                     byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                         outputStream.write(buffer, 0, bytesRead);
                                         }
                        Profilepic= Base64.getEncoder().encodeToString(outputStream.toByteArray());
        }catch(Exception e){
            e.printStackTrace();
        }
        return Profilepic;
    }
     
}
