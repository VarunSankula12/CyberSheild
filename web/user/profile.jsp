<%@page import="com.codebook.admin.adminDao"%>
<%@page import="com.codebook.user.userDao,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    <script type="text/javascript">  
            
        function validateuser(){  
            
        var name=document.myform.name.value;
        var mobile=document.myform.mobile.value;
        var email=document.myform.email.value;
        var address=document.myform.address.value;
        var dob=document.myform.dob.value;
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; 
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;

        if (name===""){ 
            Swal.fire('Name Cannot be empty');
                     
          return false;  
        }
        if (email===""){
            Swal.fire("E-mail cannot be empty");           
            return false;
        }
        if(!email.match(emailpattern)){
            Swal.fire("Invalid Email format");             
            return false;
        }
        if(mobile===""){
            Swal.fire("Provide Mobile number");
            return false;
        }
        if(mobile.length!==10){
            Swal.fire("Missing length of Mobile number");
            return false;
        }
         if(isNaN(mobile)){
            Swal.fire("Invalid Mobile number");
            return false;
        }
       
        if (dob===""){
            Swal.fire("Date of Birth cannot be blank");            
            return false;
        }
        if (address===""){
           Swal.fire("Address cannot be blank");            
            return false;
        }
        
    }  
    </script>
</head>
<body>
    <script>
        var successMessage = '${sessionScope.success}';
        if (successMessage !== '') {
            swal({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("success"); %>
        }
          
    </script>
    <script>
        var successMessage = '${sessionScope.failed}';
        if (successMessage !== '') {
            swal({
                icon: 'error',
                title: 'Failed!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("failed"); %>
        }
          
    </script>
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
    
    <div style="margin-bottom: 10px;"></div>
    <h2>&nbsp &nbsp <b>Profile</b></h2>
<div class="container-xl px-4 mt-4">
       <%
           String img="";
           Blob pic=null;
             String query="SELECT * FROM user WHERE email='"+email+"'";
             ResultSet rs=userDao.Retrieve(query);
             if(rs.next()){
             pic=rs.getBlob("image");
             img=adminDao.imageConversion(pic);
         %>
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header"></div>
                    <div class="card-body text-center">
                        <img src='data:image/jpeg;base64, <%=img%>'height="235px",width="100px">
                        
                    </div>
                </div>
            </div>
            
         
            
            <div class="col-xl-8">
                <div class="card mb-4">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <form action="updateProfile.jsp" method="POST" id="myform"onsubmit="return validateuser()" name="myform" class="contactForm" enctype="multipart/form-data">
                            <div class="row gx-3 mb-3">
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputUsername">Full Name</label>
                                <input class="form-control" name="name" id="name" type="text"  value="<%=rs.getString("name")%>">
                            </div>
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                <input class="form-control" name="email" id="email" type="email" value="<%=rs.getString("email")%>" readonly>
                            </div>
                        </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputmobile">Mobile</label>
                                    <input class="form-control" name="mobile" id="mobile" type="number" value="<%=rs.getString("mobile")%>" >
                                </div>
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputDate">Date of Birth</label>
                                    <input class="form-control" name="dob" id="dob" type="text" value="<%=rs.getString("dob")%>" >
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                 
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputAddress">Address</label>
                                    <input class="form-control" name="address" id="address" type="text" value="<%=rs.getString("address")%>">
                                </div>
                                 <div class="col-md-6">
                                    <label class="small mb-1" for="file">Upload Image</label>
                                    <input class="form-control" name="file" id="file" type="file">
                                </div>
                            </div>
                            
                            <input type="submit" class="btn btn-primary" value="Update">
                          
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>

<div style="margin-bottom: 100px;"></div>

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