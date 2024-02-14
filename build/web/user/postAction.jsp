<%@page import="com.codebook.user.RandomNumGen"%>
<%@page import="com.codebook.user.userDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%@page import="com.codebook.Connections.DynamicImage"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%@page import="java.sql.*"%>
<%
    Bean b=new Bean();
    b.setEmail((String)session.getAttribute("email"));
     boolean isMultipart = ServletFileUpload.isMultipartContent(request);
     
    if (isMultipart) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        for(FileItem item: items){
        String fieldName=item.getFieldName();
        String fieldValue = item.getString();
         if (fieldName.equals("file")) {
         Blob img=DynamicImage.getBlobProfile(item);
            b.setBlob(img);
            
        }
            if (fieldName.equals("desc")) {
                b.setTemp(fieldValue);
            }  
        }
        
        String id=RandomNumGen.generateNumber();
        b.setOrder(id);
        String query="INSERT INTO posts(id,email,image,description) VALUES(?,?,?,?)";
        int rowCount=userDao.Post(b, query);
        if(rowCount>0){
             request.getSession();
            session.setAttribute("success", "Your Post Uploaded Successfully!");
            response.sendRedirect("user-dashboard.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Upload Post!");
            response.sendRedirect("user-dashboard.jsp");
        }
        
        
    }
%>