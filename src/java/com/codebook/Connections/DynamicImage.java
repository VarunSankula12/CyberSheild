package com.codebook.Connections;
import org.apache.commons.fileupload.FileItem;
 import java.io.*;
import java.sql.*;

public class DynamicImage {
      public static Blob getBlobProfile(FileItem items){
        Blob blob=null;
         byte[] fileData=null;
        try {
            
                if (!items.isFormField()) {
                        
                        InputStream inputStream = items.getInputStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                         fileData = outputStream.toByteArray();
          
                        // Create a Blob object from the byte array
                         blob= new javax.sql.rowset.serial.SerialBlob(fileData);
                }
                
            }catch(Exception e){
                    e.printStackTrace();
                   }
                    return blob;
            }
}
