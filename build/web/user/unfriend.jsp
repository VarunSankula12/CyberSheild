<%@page import="com.codebook.user.userDao,java.sql.*"%>
<%
    String myemail=(String)session.getAttribute("email");
    String frndemail=request.getParameter("frndemail");
    String query="SELECT * FROM friendreq WHERE status='Accepted' AND (fromemail='" + myemail + "' && toemail='"+frndemail+"') OR (fromemail='" + frndemail + "' && toemail='"+myemail+"')";
    ResultSet rs=userDao.Retrieve(query);
    if(rs.next()){
        String q1="DELETE FROM friendreq WHERE (fromemail='" + myemail + "' && toemail='"+frndemail+"') OR (fromemail='" + frndemail + "' && toemail='"+myemail+"')";
        int rowCount=userDao.AcceptReq(q1);
        if(rowCount>0){
             request.getSession();
            session.setAttribute("success", "Unfollowed Successfully...!");
            response.sendRedirect("friends.jsp");
        }else{
              request.getSession();
            session.setAttribute("failed", "Failed to Unfriend...!");
            response.sendRedirect("friends.jsp");
        }
    }
%>