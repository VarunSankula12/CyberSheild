<%@page import="com.codebook.admin.adminDao"%>
<%@page import="com.codebook.user.userDao,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>Cyber Shield</title>
    <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
    
    <link rel="stylesheet" href="css/main.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/color.css">
    <link rel="stylesheet" href="css/responsive.css">

</head>
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	
	<div class="responsive-header">
		<div class="mh-head first Sticky">
			<span class="mh-btns-left">
				<a class="" href="#menu"><i class="fa fa-align-justify"></i></a>
			</span>
			<span class="mh-text">
                            <a href="user-dashboard.jsp" title=""><img src="images/logo (3).png" alt="" width="150px"></a>
			</span>
			<span class="mh-btns-right">
				<a class="fa fa-sliders" href="#shoppingbag"></a>
			</span>
		</div>
		<div class="mh-head second">
			<form class="mh-form">
				<input placeholder="search" />
				<a href="#/" class="fa fa-search"></a>
			</form>
		</div>
		
	</div><!-- responsive header -->
	
	<div class="topbar stick">
		<div class="logo">
                    <a title="" href="user-dashboard.jsp"><img src="images/logo (3).png" alt="" width="150px"></a>
		</div>
		
		<div class="top-area">
			<div class="top-search">
				<form method="post" class="">
					<input type="text" placeholder="Search Friend">
					<button data-ripple><i class="ti-search"></i></button>
				</form>
			</div>
			<ul>
                            <li><a href="user-dashboard.jsp" title="Home"><i class="ti-home"></i></a></li>
				
				<li>
                                    <a href="InboxMessages.jsp" title="Messages" data-ripple=""><i class="ti-comment"></i></a>
					
				</li>
                                <li>
                                    <a href="friends.jsp" title="Friends"><i class="ti-themify-favicon"></i></a>
                                </li>
                                <li>
                                    <a href="profile.jsp" title="Profile"><i class="ti-user"></i></a>
                                </li>
                                <li>
                                    <a href="../index.html" title="Logout"><i class="ti-power-off"></i></a>
                                </li>
			</ul>
			<div class="user-img">
				<%
                            String hu="";
                            Blob ik=null;
                            String nu=(String)session.getAttribute("email");
                            String qp="SELECT * FROM user WHERE email='"+nu+"'";
                            ResultSet pro=userDao.Retrieve(qp);
                            if(pro.next()){
                                ik=pro.getBlob("image");
                                hu=adminDao.imageConversion(ik);
                    %>
				<img src='data:image/jpeg;base64, <%=hu%>' style="height: 45px; width: 45px">
                                <%
                        }
                    %>
				<span class="status f-online"></span>
				<div class="user-setting">
                                    
				</div>
			</div>
		</div>
	</div><!-- topbar -->
	
	
	
	<div class="fixed-sidebar left">
		<div class="menu-left">
			<ul class="left-menu">
                            <li><a href="user-dashboard.jsp" title="Newsfeed Page" data-toggle="tooltip" data-placement="right"><i class="ti-magnet"></i></a></li>
                            <li><a href="profile.jsp" title="Profile" data-toggle="tooltip" data-placement="right"><i class="ti-user"></i></a></li>
                            <li><a href="InboxMessages.jsp" title="Messages" data-toggle="tooltip" data-placement="right"><i class="ti-comment-alt"></i></a></li>
                            <li><a href="friends.jsp" title="Friends" data-toggle="tooltip" data-placement="right"><i class="ti-themify-favicon"></i></a></li>
                                <li><a href="../index.html" title="Logout" data-toggle="tooltip" data-placement="right"><i class="ti-power-off"></i></a></li>
			</ul>
		</div>
	</div><!-- left sidebar menu -->
		
	<section>
		<div class="gap2 gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row merged20" id="page-contents">
							<div class="col-lg-3">
								<aside class="sidebar static left">
									<div class="widget">
										<h4 class="widget-title">Shortcuts</h4>
										<ul class="naves">
											<li>
												<i class="ti-clipboard"></i>
                                                                                                <a href="user-dashboard.jsp" title="">News feed</a>
											</li>
											<li>
												<i class="ti-files"></i>
                                                                                                <a href="profile.jsp" title="">My Profile</a>
											</li>
											<li>
												<i class="ti-user"></i>
												<a href="friends.jsp" title="">friends</a>
											</li>
											<li>
												<i class="ti-comments-smiley"></i>
                                                                                                <a href="InboxMessages.jsp" title="">Messages</a>
											</li>
											<li>
												<i class="ti-power-off"></i>
                                                                                                <a href="../index.html" title="">Logout</a>
											</li>
										</ul>
									</div><!-- Shortcuts -->
									
									<div class="widget stick-widget">
										<h4 class="widget-title">Suggestion's</h4>
										<ul class="followers">
                                                                                    <%
                                                                                        String check="";
                                                                                        String email=(String)session.getAttribute("email");
                                                                                        String i="";
                                                                                        Blob p=null;
                                                                                        String q1="SELECT * FROM user WHERE email!='"+email+"'";
                                                                                        ResultSet rs1=userDao.Retrieve(q1);
                                                                                        while(rs1.next()){
                                                                                            check=rs1.getString("email");
                                                                                            String hk="SELECT * FROM friendreq WHERE (fromemail='" + email + "' && toemail='"+check+"') OR (fromemail='" + check + "' && toemail='"+email+"')";
                                                                                            ResultSet yt=userDao.Retrieve(hk);
                                                                                            if(!(yt.next())){
                                                                                            p=rs1.getBlob("image");
                                                                                            i=adminDao.imageConversion(p);
                                                                                    %>
											<li>
												<figure><img src='data:image/jpeg;base64, <%=i%>'></figure>
												<div class="friend-meta">
													<h4><a href="#" title=""><%=rs1.getString("name")%></a></h4>
													 <a href="addFriendAction.jsp?email=<%=rs1.getString("email")%>" title="" class="underline">Add Friend</a>
												</div>
											</li>
                                                                                        <%
                                                                                            }
                                                                                            }
                                                                                        %>
											
										</ul>
                                                                                         <div class="pagination-buttons text-center" style="margin-bottom: 20px;">
                                                                                            <button id="prev-page" class="text-center btn btn-primary">prev</button>&nbsp&nbsp
                                                                                            <button id="next-page" class="text-center btn btn-primary">next</button>
                                                                                         </div>
									</div><!-- who's following -->
                                                                        <script>
  document.addEventListener('DOMContentLoaded', function () {
    const tableRows = document.querySelectorAll('.followers li');
    const itemsPerPage = 4; // Change this to the desired number of items per page.
    let currentPage = 1;

    function showPage(page) {
      tableRows.forEach((row, index) => {
        if (index >= (page - 1) * itemsPerPage && index < page * itemsPerPage) {
          row.style.display = 'block'; // Use 'block' to display list items
        } else {
          row.style.display = 'none';
        }
      });
    }

    // Initial page display
    showPage(currentPage);

    document.getElementById('prev-page').addEventListener('click', function (e) {
      e.preventDefault();
      if (currentPage > 1) {
        currentPage--;
        showPage(currentPage);
      }
    });

    document.getElementById('next-page').addEventListener('click', function (e) {
      e.preventDefault();
      const maxPage = Math.ceil(tableRows.length / itemsPerPage);
      if (currentPage < maxPage) {
        currentPage++;
        showPage(currentPage);
      }
    });
  });
</script>
								</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta">
									<div class="messages">
										<h5 class="f-title"><i class="ti-bell"></i>All Messages <span class="more-options"><i class="fa fa-ellipsis-h"></i></span></h5>
										<div class="message-box">
											<ul class="peoples">
                                                                                           <%
                                                                                               String mail="";
                                                                                               String img2="";
                                                                                               Blob pic2=null;
                                                                                               String query="SELECT * FROM friendreq WHERE status='Accepted' AND (fromemail='" + email + "' OR toemail='" + email + "')";
                                                                                               ResultSet rs=userDao.Retrieve(query);
                                                                                               while(rs.next()){
                                                                                                    if(rs.getString("fromemail").equalsIgnoreCase(email)){
                                                                                                        mail=rs.getString("toemail");
                                                                                                    }else{
                                                                                                        mail=rs.getString("fromemail");
                                                                                                    }
                                                                                                    String q2="SELECT * FROM user WHERE email='"+mail+"'";
                                                                                                    ResultSet rs2=userDao.Retrieve(q2);
                                                                                                    if(rs2.next()){
                                                                                                        pic2=rs2.getBlob("image");
                                                                                                        img2=adminDao.imageConversion(pic2);
                                                                                           %>
												<li>
													<figure>
														<img src='data:image/jpeg;base64, <%=img2%>'>
														<span class="status f-online"></span>
													</figure>
													<div class="people-name">
                                                                                                            <a href="Messages.jsp?email=<%=mail%>"><span><%=rs2.getString("name")%></span></a>
													</div>
												</li>
                                                                                                <%
                                                                                                    }
                                                                                                    }
                                                                                                %>
												
											</ul>
										</div>
									</div>
								</div>	
							</div><!-- centerl meta -->
                                                        
                                                        
                                                        
							<div class="col-lg-3">
								<aside class="sidebar static right">
									<div class="widget">
										<h4 class="widget-title">Your page</h4>	
										<div class="your-page">
											<figure>
                                                                                            <a href="#" title=""><img src='data:image/jpeg;base64, <%=hu%>'></a>
											</figure>
											<div class="page-meta">
												<a href="#" title="" class="underline">My page</a>
                                                                                                <span><i class="ti-comment"></i><a href="InboxMessages.jsp" title="">Messages </a></span>
											</div>
											<div class="page-likes">
												<ul class="nav nav-tabs likes-btn">
													<li class="nav-item"><a class="active" href="#link1" data-toggle="tab">Total Posts</a></li>
													 <li class="nav-item"><a class="" href="#link2" data-toggle="tab">Your Posts</a></li>
												</ul>
												<!-- Tab panes -->
												<div class="tab-content">
												  <div class="tab-pane active fade show " id="link1" >
                                                                                                      <%
                                                                                                          int totpost=0;
                                                                                                          String posts="SELECT * FROM posts ";
                                                                                                          ResultSet r=userDao.Retrieve(posts);
                                                                                                          while(r.next()){
                                                                                                            totpost++;
                                                                                                          }
                                                                                                          int your=0;
                                                                                                          String you="SELECT * FROM posts WHERE email='"+nu+"'";
                                                                                                          ResultSet yp=userDao.Retrieve(you);
                                                                                                          while(yp.next()){
                                                                                                            your++;
                                                                                                          }
                                                                                                      %>
													<span><i class="ti-heart"></i><%=totpost%></span>
												  </div>
												  <div class="tab-pane fade" id="link2" >
													  <span><i class="ti-eye"></i><%=your%></span>
												  </div>
												</div>
											</div>
										</div>
									</div><!-- page like widget -->
									
									<div class="widget stick-widget">
										<h4 class="widget-title">Cyber Shield</h4>
										<ul class="short-profile">
											<li>
												<span>about</span>
												<p> Cyber Shield is an application which matters your's privacy. </p>
											</li>
											<li>
												<span>Post Your Content</span>
												<p>Photos, Videos , Blogs..</p>
											</li>
											<li>
												<span>Protects Your Data</span>
												<p>You will be updated by admin if any anonymous actions takes place in your account...</p>
											</li>
										</ul>
									</div>
	
	<script src="js/main.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/map-init.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>

</body>	
</html>