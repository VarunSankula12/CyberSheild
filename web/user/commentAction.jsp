<%@page import="com.codebook.user.userDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    String postid=request.getParameter("id");
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String comment=request.getParameter("comment");
    Bean b=new Bean();
    b.setOrder(postid);
    b.setName(name);
    b.setEmail(email);
    b.setTemp(comment);
    String query="INSERT INTO comments(id,name,email,comment) VALUES (?,?,?,?)";
    int rowCount=userDao.PostComment(b, query);
       if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Commented Successfully posted!");
            response.sendRedirect("user-dashboard.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Comment!");
            response.sendRedirect("user-dashboard.jsp");
      }
%>
