<%@page import="com.codebook.admin.Blockchain"%>
<%@page import="com.codebook.admin.Block"%>
<%@page import="com.codebook.user.userDao,java.sql.*"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    String flag="";
    String dpo[]=request.getParameterValues("organ[]");
    for(String val:dpo){
             flag=flag+val+",";
    }
   String name=request.getParameter("name");
   String fname=request.getParameter("fname");
   String email=request.getParameter("email");
   String gender=request.getParameter("gender");
   String mobile=request.getParameter("mobile");
   String address=request.getParameter("address");
   String dob=request.getParameter("dob");
   String self_disease=request.getParameter("self_disease");
   Bean b=new Bean();
   b.setName(name);
   b.setFlag(fname);
   b.setEmail(email);
   b.setMobile(mobile);
   b.setGender(gender);
   b.setAddress(address);
   b.setDob(dob);
   b.setDistName(self_disease);
   b.setOrder(flag);
   
   Blockchain myDataBlockchain = (Blockchain) application.getAttribute("myDataBlockchain");

if (myDataBlockchain == null) {
    myDataBlockchain = new Blockchain();
    application.setAttribute("myDataBlockchain", myDataBlockchain);
}

myDataBlockchain.addBlock( b.getEmail() + b.getDistName() + b.getOrder());
String total="";
Block latestBlock = myDataBlockchain.getLatestBlock();
if (latestBlock != null) {
    b.setCpassword(latestBlock.getHash());
    b.setPassword(latestBlock.getPreviousHash());
    b.setTemp(latestBlock.calculateHashForField("email"));
    b.setTemp2(latestBlock.calculateHashForField("selfdisease"));
    b.setTemp3(latestBlock.calculateHashForField("organsdonated"));
}else {
        request.getSession();
            session.setAttribute("failed", "Blockchain is empty.!");
            response.sendRedirect("DonateOrgan.jsp");
    }
    String q1="SELECT * FROM donation WHERE email='"+email+"'";
    ResultSet rs=userDao.Retrieve(q1);
    if(rs.next()){
        String q3="DELETE FROM donation WHERE email='"+email+"'";
        int ro=userDao.DeleteDonation(q3);
        if(ro>0){
            String query="INSERT INTO donation(name,fathername,email,mobile,gender,address,dob,selfdisease,organsdonated,emailHash,sdHash,odHash,appHash,prevhash) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
   int rowCount=userDao.DonateOrgans(b, query);
   if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Form Submission Successful!");
            response.sendRedirect("DonateOrgan.jsp");
    }else{
            request.getSession();
            session.setAttribute("failed", "Failed to submit the form!");
            response.sendRedirect("DonateOrgan.jsp");
    }
        }
        
    }else{
   String query="INSERT INTO donation(name,fathername,email,mobile,gender,address,dob,selfdisease,organsdonated,emailHash,sdHash,odHash,appHash,prevhash) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
   int rowCount=userDao.DonateOrgans(b, query);
   if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Form Submission Successful!");
            response.sendRedirect("DonateOrgan.jsp");
    }else{
            request.getSession();
            session.setAttribute("failed", "Failed to submit the form!");
            response.sendRedirect("DonateOrgan.jsp");
    }
    }
%>
