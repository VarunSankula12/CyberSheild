<%@page import="com.codebook.user.userDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    Bean b=new Bean();
    String msgfrom=request.getParameter("msgfrom");
    String msgto=request.getParameter("msgto");
    String msg=request.getParameter("msg");
    b.setEmail(msgfrom);
    b.setDistName(msgto);
    b.setTemp(msg);
    if(msg.length()!=0){
        String query="INSERT INTO chat(msgfrom,msgto,message) VALUES (?,?,?)";
        int rowCount=userDao.SendingMessage(b, query);
        if(rowCount>0){
            response.sendRedirect("Messages.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to deliver message!");
            response.sendRedirect("Messages.jsp");
        }
    }
%>
