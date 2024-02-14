<%@page import="com.codebook.user.userDao"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String query="SELECT * FROM user WHERE email='"+email+"' && password='"+password+"'";
    ResultSet rs=userDao.Retrieve(query);
    if(rs.next()){
     String status=rs.getString("status");
     if(status.equalsIgnoreCase("Accepted")){
         session.setAttribute("email", email);
    request.getSession();
    session.setAttribute("success", "Login Successful!");
    response.sendRedirect("user/user-dashboard.jsp");
    }else if(status.equalsIgnoreCase("Rejected")){
        request.getSession();
    session.setAttribute("failed", "Login Failed because Your account is Rejected!");
    response.sendRedirect("register.jsp");
    }else{
        request.getSession();
    session.setAttribute("failed", "Login Failed beacuse your account is still pending!");
    response.sendRedirect("register.jsp");
    }
   
    }else{
        request.getSession();
    session.setAttribute("failed", "Login Failed! You may Entered Wrong Credentials or You may not have a Account..!");
    response.sendRedirect("register.jsp");
    }
    
%>
