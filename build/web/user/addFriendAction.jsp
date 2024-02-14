<%@page import="com.codebook.bean.Bean"%>
<%@page import="com.codebook.user.userDao,java.sql.*"%>
<%
    Bean b=new Bean();
    
    String toemail=request.getParameter("email");
    String fromemail=(String)session.getAttribute("email");
    b.setTemp(toemail);
    b.setOrder(fromemail);
    String query="SELECT * FROM friendreq WHERE toemail='"+toemail+"' && fromemail='"+fromemail+"' OR toemail='"+fromemail+"' && fromemail='"+toemail+"'";
    ResultSet rs=userDao.Retrieve(query);
    if(rs.next()){
        String status=rs.getString("status");
        if(status.equalsIgnoreCase("pending")){
         request.getSession();
            session.setAttribute("failed", "Already requested and it's pending!");
            response.sendRedirect("user-dashboard.jsp");
        }else if(status.equalsIgnoreCase("rejected")){
            request.getSession();
            session.setAttribute("failed", "Request has been rejected!");
            response.sendRedirect("user-dashboard.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "You guys are already friends!");
            response.sendRedirect("user-dashboard.jsp");
        }
    }else{
        String q1="INSERT INTO friendreq(fromemail,toemail) VALUES (?,?)";
        int rowCount=userDao.FreindReq(b, q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Friend request sent successfully!");
            response.sendRedirect("user-dashboard.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to send fried request!");
            response.sendRedirect("user-dashboard.jsp");
        }
    }
%>