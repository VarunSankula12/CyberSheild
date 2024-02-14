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
        var gender=document.myform.gender.value;
        var dob=document.myform.dob.value;
        var password=document.myform.password.value;
        var file=document.myform.file.value;
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
        if (gender===""){
           Swal.fire("Gender cannot be blank");            
            return false;
        }
        
        if (password===''){
           Swal.fire("password should not be empty");          
            return false;
            }
        
        if (!letter.test(password)) {
            Swal.fire("Please make sure password includes a lowercase letter.");
                return false;
            }
        if (!number.test(password)) {
            Swal.fire("Please make sure Password Includes a Digit");
                return false;
            }
        if (!upper.test(password)) {
            Swal.fire("Please make sure password includes an uppercase letter.");
                return false;
            } 
         if (file===''){
           Swal.fire("please upload the file it should not be empty");          
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
                                                <a href="index.jsp" title="" class="folow-me">Connect now</a>
					</div>	
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="login-reg-bg">
					<div class="log-reg-area sign">
						<h2 class="log-title">Register</h2>
                                                <form action="user-regAction.jsp" method="POST" id="myform" onsubmit="return validateuser()" name="myform" class="contactForm" enctype="multipart/form-data">
                                               
							<div class="form-group">	
                                                            <input type="text" placeholder="First & Last Name" name="name" id="name"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
                                                            <input type="text" placeholder="Email" name="email" id="email"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
                                                        <div class="form-group">	
                                                            <input type="text" placeholder="Mobile" name="mobile" id="mobile"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
							
                                                        <div class="form-group">	
                                                            <input type="date" name="dob" id="dob"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
                                                        <div class="form-group">	
                                                            <input type="text" placeholder="Address" name="address" id="address"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
							<div class="form-radio">
                                    <select class="form-select custom-dropdown" name="gender" id="gender">
                                        <option disabled selected>Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                                                    <div class="form-group">	
                                                            <input type="password" placeholder="Password" name="password" id="password"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
                                                        <div class="form-group">	
                                                            <input type="file" name="file" id="file"/>
							  <label class="control-label" for="input"></label><i class="mtrl-select"></i>
							</div>
                                                    
							<div class="submit-btns">
                                                            <input type="submit" class="btn btn-primary" value="Register"> &nbsp; &nbsp;
                                                                <a href="index.html" title="" style="text-decoration: underline; color: blue;">Already have an account ?</a>
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