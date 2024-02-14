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
    <style>
    .love-container {
        position: relative; /* Make the container position relative */
        margin-bottom: 20px;
    }
    
    .love-symbol {
        position: absolute; /* Position the love symbol absolutely */
        top: 50%; /* Position at 50% from top */
        left: 50%; /* Position at 50% from left */
        transform: translate(-50%, -50%); /* Center the symbol */
        font-size: 120px; /* Set font size to 40px */
        color: red; /* Set color to red */
    }
</style>
<style>
    /* Custom styles to replicate the appearance */
    .custom-post-comt-box {
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        overflow: hidden; /* Clear float */
    }

    .comment-container {
        overflow: hidden; /* Clear float */
    }

    .image-container {
        float: left;
        margin-right: 10px;
    }

    .image-container img {
        max-width: 50px; /* Set max width for the image */
        height: auto;
    }

    .comment-container textarea {
        width: calc(100% - 60px); /* Adjust width to accommodate image width and margin */
        min-height: 100px;
        resize: vertical;
    }

    .comment-container .submit-container {
        text-align: center; /* Center align the content */
        margin-top: 10px; /* Adjust margin as needed */
    }
</style>
 <script type="text/javascript">  
            
        function validateuser(){  
            
        var file=document.myform.file.value;
        var desc=document.myform.desc.value;

        if (desc===""){ 
            Swal.fire('Description Cannot be empty');
          return false;  
        }
        if (file===""){ 
            Swal.fire('Upload a image, It Cannot be empty');
          return false;  
        }
    }  
    </script>
</head>
<body>
    <script>
        var successMessage = '${sessionScope.success}';
        if (successMessage !== '') {
           swal ({
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
                                                                                        String q1="SELECT * FROM user WHERE email!='"+email+"' && status='Accepted'";
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
                                                            <%
                                                                String nam="";
                                                            String img="";
                                                            Blob pic=null;
                                                            String q2="SELECT * FROM user WHERE email='"+email+"'";
                                                            ResultSet rs=userDao.Retrieve(q2);
                                                            if(rs.next()){
                                                                nam=rs.getString("name");
                                                                pic=rs.getBlob("image");
                                                                img=adminDao.imageConversion(pic);
                                                        %>
								<div class="central-meta">
									<div class="new-postbox">
										<figure>
											<img src='data:image/jpeg;base64, <%=img%>'>
										</figure>
										<div class="newpst-input">
                                                                                    <form action="postAction.jsp" method="POST" id="myform"onsubmit="return validateuser()" name="myform" class="contactForm" enctype="multipart/form-data">
												<textarea rows="2" name="desc" id="desc" placeholder="write something"></textarea>
												<div class="attachments">
													<ul>
                                                                                                                
														<li>
															<i class="fa fa-camera"></i>
															<label class="fileContainer">
                                                                                                                            <input type="file" name="file" id="file">
															</label>
														</li>
														<li>
															<button type="submit">Post</button>
														</li>
													</ul>
												</div>
											</form>
										</div>
									</div>
								</div><!-- add post new box -->
                                                                <div class="loadMore">
                                                                    <p class="text-danger text-center"><b>Note: * If your unable to see your post please click on refresh button displayed at bottom of all posts. Click till you see it.. So that it load's more posts *</b></p>
                                                                <%
                                                                    }
                                                                        String img3="";
                                                                        Blob pic3=null;
                                                                        String img1="";
                                                                        Blob pic1=null;
                                                                        String q3="SELECT * FROM posts";
                                                                        ResultSet rs2=userDao.Retrieve(q3);
                                                                        while(rs2.next()){
                                                                            String em=rs2.getString("email");
                                                                            String q4="SELECT * FROM user WHERE email='"+em+"'";
                                                                            ResultSet rs3=userDao.Retrieve(q4);
                                                                            if(rs3.next()){
                                                                                  pic3=rs3.getBlob("image");
                                                                                  img3=adminDao.imageConversion(pic3);
                                                                            pic1=rs2.getBlob("image");
                                                                            img1=adminDao.imageConversion(pic1);
                                                                %>
								
								<div class="central-meta item">
									<div class="user-post">
										<div class="friend-info">
											<figure>
												<img src='data:image/jpeg;base64, <%=img3%>'>
											</figure>
											<div class="friend-name">
												<ins><a href="#" title=""><%=rs3.getString("name")%></a></ins>
												<span>published: <%=rs2.getString("Date & Time")%></span>
											</div>
											<div class="post-meta">
                                                                                            <li>
        <span class="love-symbol">&hearts;</span>
    </li>
												<div class="we-video-info">
													<ul>
														  <div class="love-container"> <!-- Added container for post content -->
        <span id="love-symbol" class="love-symbol" style="display: none;">&hearts;</span>
        <img src='data:image/jpeg;base64, <%=img1%>' style="width: 800px; height: 600px;">
        <!-- Other post content -->
    </div>
                                                                                                                 <li>
        <span class="like" data-toggle="tooltip" title="like">
            <i class="ti-heart"></i>
        </span>
    </li>
                                                                                                                
                                                                                                                <script>
    // Add an event listener to the like button
    document.querySelectorAll('.like').forEach(button => {
        button.addEventListener('click', function() {
            // Toggle the display property of the love symbol
            const loveSymbol = button.parentElement.parentElement.querySelector('#love-symbol');
            loveSymbol.style.display = 'inline';
            // Hide the love symbol after 1 second
            setTimeout(() => {
                loveSymbol.style.display = 'none';
            }, 1000);
        });
    });
</script>
														<li>
															<span class="comment" data-toggle="tooltip" title="Comments">
																<i class="fa fa-comments-o"></i>
															</span>
														</li>
														<li class="social-media">
															<div class="menu">
															  <div class="btn trigger"><i class="fa fa-share-alt"></i></div>
															  <div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-html5"></i></a></div>
															  </div>
															  <div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-facebook"></i></a></div>
															  </div>
															  <div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-google-plus"></i></a></div>
															  </div>
															  <div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-twitter"></i></a></div>
															  </div>
															  <div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-css3"></i></a></div>
															  </div>
															  <div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-instagram"></i></a>
																</div>
															  </div>
																<div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-dribbble"></i></a>
																</div>
															  </div>
															  <div class="rotater">
																<div class="btn btn-icon"><a href="#" title=""><i class="fa fa-pinterest"></i></a>
																</div>
															  </div>

															</div>
														</li>
													</ul>
												</div>
												<div class="description">
													
													<p>
														<%=rs2.getString("description")%>
													</p>
												</div>
											</div>
										</div>
										<div class="coment-area">
											<ul class="we-comet">
                                                                                            <%
                                                                                                    String uimg="";
                                                                                                    Blob upic=null;
                                                                                                    String m="";
                                                                                                    String id=rs2.getString("id");
                                                                                                    String q6="SELECT * FROM comments WHERE id='"+id+"'";
                                                                                                    ResultSet result=userDao.Retrieve(q6);
                                                                                                    while(result.next()){
                                                                                                    m=result.getString("email");
                                                                                                    String q7="SELECT * FROM user WHERE email='"+m+"'";
                                                                                                    ResultSet result1=userDao.Retrieve(q7);
                                                                                                    if(result1.next()){
                                                                                                     upic=result1.getBlob("image");
                                                                                                        uimg=adminDao.imageConversion(upic); 
                                                                                            %>
												<li>
													<div class="comet-avatar">
														<img src='data:image/jpeg;base64, <%=uimg%>'>
													</div>
													<div class="we-comment">
														<div class="coment-head">
															<h5><a href="#" title=""><%=result.getString("name")%></a></h5>
															<span><%=result.getString("Date & Time")%></span>
															<a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
														</div>
														<p><%=result.getString("comment")%></p>
													</div>
												</li>
                                                                                                <%
                                                                                                    }
                                                                                                    }
                                                                                                %>

												<li class="post-comment">
													<div class="custom-post-comt-box">
    <form method="post" action="commentAction.jsp" onsubmit="return submitForm();">
        <div class="comment-container">
            <div class="image-container">
                <!-- Image (replace "your_image_url_here" with the actual URL) -->
                <img src='data:image/jpeg;base64, <%=img%>'>
            </div>
            <div>
                <textarea class="form-control" placeholder="Post your comment" name="comment" id="comment"></textarea>
                <input type="hidden" name="id" id="id" value="<%=rs2.getString("id")%>">
                <input type="hidden" name="name" id="name" value="<%=nam%>">
                <input type="hidden" name="email" id="email" value="<%=email%>">
                <div class="submit-container">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </form>
</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								
								
								
                                                                 <%
                                                                        }
                                                                        }
                                                                 %>                               
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
													 <li class="nav-item"><a class="" href="#link2" data-toggle="tab">Your posts</a></li>
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
								</aside>
							</div><!-- sidebar -->
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>

	
</div>
			
	
	<script src="js/main.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/map-init.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>

</body>	
</html>