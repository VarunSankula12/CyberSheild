<%@page import="com.codebook.user.userDao,java.sql.*"%>
<%
    String fromemail=request.getParameter("fromemail");
    String toemail=(String)session.getAttribute("email");
    String query="SELECT * FROM friendreq WHERE fromemail='"+fromemail+"' && toemail='"+toemail+"' && status='Pending'";
    ResultSet rs=userDao.Retrieve(query);
    if(rs.next()){
        String q1="UPDATE friendreq SET status='Rejected' WHERE fromemail='"+fromemail+"' && toemail='"+toemail+"'";
        int rowCount=userDao.AcceptReq(q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Friend Request Rejection Successful...!");
            response.sendRedirect("friendReq.jsp");
            out.println("");
        }else{
            request.getSession();
            session.setAttribute("success", "Failed to Reject Friend Request...!");
            response.sendRedirect("friendReq.jsp");
        }
    }
%>
