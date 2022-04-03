<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ sessionScope.totalProgress < 4 }"><c:set var="tp" value="4" /></c:if>
<c:if test="${ sessionScope.totalProgress >= 4 }"><c:set var="tp" value="${ sessionScope.totalProgress }" /></c:if>
<!DOCTYPE html>
<html lang="kr">
<head>
  <link rel="icon" type="image/x-icon" href="/hwabo/resources/assets/img/favicon.png" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HWABO</title>

  <!-- Custom fonts for this template-->
  <link href="/hwabo/resources/css/calendar.css" rel="stylesheet" type="text/css">
  <link href="/hwabo/resources/maincss/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/hwabo/resources/maincss/css/sb-admin-2.css" rel="stylesheet">
<!-- 달력css시작 -->

<!-- 달력css끝 -->
</head>
<body>
<!-- 1.topbar추가 -->
<!-- Topbar2 -->
     <c:import url="/WEB-INF/views/suugit/topbar.jsp"></c:import>
<!-- End of Topbar -->

<!-- 2.바로아래div추가 및 임포트 추가  -->
<div style="height:100%;width:100%;display:flex;justify-content:center;align-item:center;">
<!-- Sidebar2right -->
     <c:import url="/WEB-INF/views/red/sideFixedCalendar.jsp"></c:import>
<!-- End of Sidebar2right -->
 
<!-- 3. id="wrapper" 스타일 1300px설정 -->
  <!-- Page Wrapper -->
  <div id="wrapper" style="width:1300px;height:100%;">

<!-- 4. Sidebar 사이드바 영역 width:17%추가 -->
    <!-- Sidebar -->
    <div style="width:17%"></div>
    <!-- End of Sidebar -->

<!-- 5. class="d-flex flex-column bg-white" 그리고 style="width:62%;" -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column bg-white" style="width:83%;height:100%;">

      <!-- Main Content -->
      <div id="content" style="height:100%;">

<!-- 6. 탑바<br>4개  -->
        <!-- Topbar -->
        <br><br><br>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid" style="height:100%;">

<!-- 진행률시작 -->
<div class="card-body">
                  <div class="mb-1 small">프로젝트 진행률 ${ sessionScope.totalProgress }%</div>
                  <div class="progress progress-sm mb-2">
                    <div class="progress-bar" role="progressbar" style="width: ${ tp }%" aria-valuenow="${ tp }" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
<!-- 진행률끝 -->
         <!-- 달력시작  -->
         
<c:import url="/WEB-INF/views/red/calendar.jsp"></c:import>
         <!-- 달력끝 -->

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->
    
<!-- 7번  -->
</div>
</div><!-- flex -->
<!-- 7번끝 -->
<!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <!-- 8.로그아웃모달 -->
        <c:import url="/WEB-INF/views/red/logoutModal.jsp"></c:import>
  <!-- 8끝 -->

  <!-- Bootstrap core JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery/jquery.min.js"></script>
  <script src="/hwabo/resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/hwabo/resources/maincss/js/sb-admin-2.min.js"></script>
  
  <!-- calendar.js -->
  <script src="/hwabo/resources/js/calendar.js"></script>
	
</body>

</html>
