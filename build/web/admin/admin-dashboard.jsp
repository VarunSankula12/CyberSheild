
<%@page import="com.codebook.admin.adminDao,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <title>Admin</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
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
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">
    
    <div class="d-flex align-items-center justify-content-between">
        <a href="admin-dashboard.jsp" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Admin</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    
    
    
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">
          
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
              <img src="assets/img/admin-police.avif" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">Admin</span>
          </a><!-- End Profile Iamge Icon -->
          
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            
            <li>
                <a class="dropdown-item d-flex align-items-center" href="../admin-login.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
            
          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
        
      </ul>
    </nav><!-- End Icons Navigation -->
    
  </header><!-- End Header -->
  
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
    
    <ul class="sidebar-nav" id="sidebar-nav">
  
  <li class="nav-item">
      <a class="nav-link " href="admin-dashboard.jsp">
      <i class="bi bi-grid"></i>
      <span>Dashboard</span>
    </a>
  </li>

  <li class="nav-item">
      <a class="nav-link collapsed" href="authentication.jsp">
      <i class="bi bi-book"></i><span>Authentications</span>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link collapsed"  href="users.jsp">
      <i class="bi bi-check2"></i><span>All Users</span>
    </a>
  </li>

</ul>

    
  </aside><!-- End Sidebar-->
  
  <main id="main" class="main">
    
    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin-dashboard.jsp">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
       
    <%
        int count=0;
        int posts=0;
        int pend=0;
        String query="SELECT * FROM user";
        ResultSet rs=adminDao.Retrieve(query);
        while(rs.next()){
            count++;
        }
        String query1="SELECT * FROM posts";
        ResultSet rs1=adminDao.Retrieve(query1);
        while(rs1.next()){
            posts++;
        }
        String query2="SELECT * FROM user WHERE status='Pending'";
        ResultSet rs2=adminDao.Retrieve(query2);
        while(rs2.next()){
            pend++;
        }        
    %>
    <section class="section dashboard">
      <div class="row">
        <!-- Left side columns -->
        <div class="col-md-12">
          <div class="row">
            <!-- Sales Card -->
            <div class="col-md-4">
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title">No of Users </h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=count%></h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>      
   <!-- Revenue Card -->
            <div class="col-md-4">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">No of Pending Users</h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=pend%></h6>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Revenue Card -->
   
  
            <!-- Customers Card -->
            <div class="col-md-4">
              <div class="card info-card customers-card">
               
                <div class="card-body">
                  <h5 class="card-title">No of Posts</h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-person-fill-exclamation"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=posts%></h6>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Customers Card -->
          </div>
          
         
        </div><!-- End Left side columns -->
        
        
      </div>
    </section>
    
  </main><!-- End #main -->
  
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>Codebook</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://codebook.in/" target="_blank">Codebook</a>
    </div>
  </footer><!-- End Footer -->
  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
</body>

</html>