<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="en">

<head>
<link rel="icon" type="image/x-icon"
	href="/hwabo/resources/assets/img/favicon.png" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>HWABO</title>

<!-- Custom fonts for this template -->
<link
	href="/hwabo/resources/maincss/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/hwabo/resources/maincss/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="/hwabo/resources/maincss/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab3b0466fa883da1d7216010325a5bcc&libraries=services"></script>
<!-- 스크립트 모으기 시작 ################################### -->
<c:import url="/WEB-INF/views/red/metaKyu.jsp"></c:import>
<c:import url="/WEB-INF/views/red/metaAbc.jsp"></c:import>
<c:import url="/WEB-INF/views/red/metaSuugit.jsp"></c:import>
<!-- 스크립트 모으기 끝 ##################################### -->

<!-- 1.탑바 임포트 -->
	<c:import url="/WEB-INF/views/suugit/topbar.jsp"></c:import>
	
<!-- 2.바로아래div추가 및 임포트 추가  -->
	<div style="width:100%;display:flex;justify-content:center;align-item:center;">
<!-- Sidebar2right -->
     <c:import url="/WEB-INF/views/red/sideFixed.jsp"></c:import>
<!-- End of Sidebar2right -->



		<!-- Page Wrapper -->
		<div id="wrapper" style="width: 1300px;">

			<!-- Sidebar -->
			<div style="width: 17%"></div>
			<!-- End of Sidebar -->

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column bg-white"
				style="width: 62%;">

				<!-- Main Content -->
				<div id="content" style="width: 100%;">

					<!-- Topbar -->
					<br>
					<br>
					<br>
					<br>
					<!-- End of Topbar -->

					<!-- Begin Page Content -->
					<div class="container-fluid">
					<br>
						<h4 style="text-align:center;  color: #19BFAF;"><strong>나의 화보에 오신 것을 환영합니다</strong></h4>
						<br>

						
						
						
						
						<c:if test="${!empty list }">
						<div class="card shadow mb-4 btn-group" align="center" style=" margin:0px; vertical-align: middle; font-size: 18px;">
							
							<span style="color: #42BBBA; margin-top: 10px;">
							
								<label><button class="btn btn-success" onclick="javascript:location.href='myhwabo.do?ucode=${ucode}&pnum=${pnum}'">&nbsp;<strong>전 체</strong>&nbsp;</button></label>  &nbsp;
								<label><button class="btn btn-success" onclick="onlycpost(); return false;">&nbsp;<strong> 글 </strong>&nbsp;</button></label>	&nbsp;				
								<label><button class="btn btn-success" onclick="onlybpost(); return false;">&nbsp;<strong>업 무</strong>&nbsp;</button></label>		&nbsp;						
								<label><button class="btn btn-success" onclick="onlyspost(); return false;">&nbsp;<strong>일 정</strong>&nbsp;</button></label>
								
							
							</span>	
						</div>
						
							<c:import url="/WEB-INF/views/abc/hwabofeed2.jsp"></c:import>
						</c:if>
						
						
						<c:if test="${empty list }">
							<div class="card shadow mb-4" align="center">
							<br><br><br><br><br><br>
								<h4>작성하신 글이 없습니다</h4>
								<br><br><br>
								<br> <span style="font-size: 20px;"><button class="btn btn-lg btn-outline-warning" onclick="javascript:location.href='ftables2.do?ucode=${sessionScope.ucode}&pnum=${sessionScope.pnum}'">
												<strong>- 글작성하러 가기 -</strong></button></span>
												
									<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
							
							</div>
						</c:if>



					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->



				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2020</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->
			</div>
			<!-- End of Content Wrapper -->

			<div style="width: 25%"></div>
		</div>
		<!-- End of Page Wrapper -->
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i	class="fas fa-angle-up"></i>	</a>


	<!-- Bootstrap core JavaScript-->
	<script src="/hwabo/resources/maincss/vendor/jquery/jquery.min.js"></script>
	<script
		src="/hwabo/resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/hwabo/resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/hwabo/resources/maincss/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="/hwabo/resources/maincss/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/hwabo/resources/maincss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/hwabo/resources/maincss/js/demo/datatables-demo.js"></script>
<script src="resources/js/jquery-3.5.1.min.js"></script>	
<script type="text/javascript">


	function onlycpost(){
		$("[id^=ups]").css("display", "none" );
		$("[id^=ses]").css("display", "none" );
		$("[id^=upb]").css("display", "none" );
		$("[id^=seb]").css("display", "none" );
		
	};
	function onlybpost(){
		$("[id^=ups]").css("display", "none" );
		$("[id^=ses]").css("display", "none" );
		$("[id^=upc").css("display", "none" );
		$("[id^=sec]").css("display", "none" );

		$("[id^=seb]").css("display", "block" );
	};
	function onlyspost(){
		$("[id^=upc]").css("display", "none" );
		$("[id^=sec]").css("display", "none" );
		$("[id^=upb]").css("display", "none" );
		$("[id^=seb]").css("display", "none" );

		$("[id^=ses]").css("display", "block" );
	};
</script>

</body>

</html>
