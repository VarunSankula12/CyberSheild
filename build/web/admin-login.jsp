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
        /* Add custom styles for the navigation bar */
        .navbar {
            background-color: #ffffff; /* White background color */
            overflow: hidden;
            position: fixed;
            top: 0;
            right: 0;
            left: auto; /* Reset left property */
            width: 50%; /* Make the navbar take up half of the width */
            display: flex;
            justify-content: flex-end; /* Align items to the right side */
            z-index: 1000;
            padding: 10px; /* Adjust padding as needed */
        }

        /* Add a style for the admin login button */
        .admin-login-btn {
            background-color: #338FC9; /* Green color for the button */
            color: white;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
        }
    </style>
    <script type="text/javascript">  
        function validateuser(){   
        
        var email=document.myform.email.value;
       
        var password=document.myform.password.value;   
        var submit=document.myform.submit.value;
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;

        if (email===""){
            Swal.fire("Email cannot be blank");            
            return false;
        }
       
        if (password===''){
            Swal.fire("password should not be empty");          
            return false;
            }
    }  
    </script>
</head>
<body>
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
    
    <div class="navbar">
        <a href="index.html" title="" class="admin-login-btn">User Login</a>
        </div>
	<div class="container-fluid pdng0">
		<div class="row merged">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="land-featurearea">
					<div class="land-meta">
						<h1>Cyber Shield</h1>
						<p>
							Cyber Shield is an application for Connecting with people.
						</p>
						<div class="friend-logo">
							<span><img src="images/wink.png" alt=""></span>
						</div>
                                                <a href="index.html" title="" class="folow-me">Connect now</a>
					</div>	
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="login-reg-bg">
					<div class="log-reg-area sign">
						<h2 class="log-title">Admin Login</h2>
                                                <form action="admin-loginAction.jsp" method="POST" id="myform" onsubmit="return validateuser()" name="myform" class="contactForm">
                                               
							<div class="form-group">	
                                                            <input type="text" id="email" placeholder="Username" name="email"/>
                                                            <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
                                                            <input type="password" placeholder="Password" name="password" id="password"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
							<div class="submit-btns">
								<button class="mtr-btn signin" type="submit"><span>Login</span></button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
	
	<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/main.min.js"></script>
	<script src="js/script.js"></script>

</body>	

</html>