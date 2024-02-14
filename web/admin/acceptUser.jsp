<%@page import="com.codebook.admin.adminDao,java.sql.*"%>
<%
    String email=request.getParameter("email");
    String query="SELECT * FROM user WHERE email='"+email+"'";
    ResultSet rs=adminDao.Retrieve(query);
    if(rs.next()){
        String q1="UPDATE user SET status='Accepted' WHERE email='"+email+"'";
        int rowCount=adminDao.UpdateComplaint(q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "User Accepted..!");
            response.sendRedirect("authentication.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Accept User..!");
            response.sendRedirect("authentication.jsp");
        }
    }else{
            request.getSession();
            session.setAttribute("failed", "User not Exists...!");
            response.sendRedirect("authentication.jsp");
    }
    
%>