
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">

<head>
<link rel="icon" type="image/x-icon"
	href="/hwabo/resources/assets/img/favicon.png" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<title>HWABO</title>

<!-- Custom fonts for this template -->
<!-- Latest compiled and minified CSS -->

<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
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
<link href="/hwabo/resources/maincss/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<style>
.mypage {
	width: 80px;
	font-weight: bold;
	margin-top: 7px;
}

.upimgbtn {
	width: 90%;
	background-color: #F8F9FD;
	color: #858796;
	border-color: #d1d3e2;
}

.modal-backdrop {
	z-index: -1;
}

.modal {
	z-index: 1050;
}

.modal-backdrop {
	z-index: -1;
}

.thumbnail {
	background-color: #fff;
	width: 100px;
	height: 100px;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.thumbnail.round {
	border-radius: 10%;
	
}

.thumbnail.circle {
	background-color: #fff;
	border-radius: 100%;
	
	width:80px;
	height:80px;
}

#selected span {
	background-color: rgba(66, 182, 187, 0.5);
	padding: 0px 5px;
	margin: 0px 3px;
}

#pjimgback{
	width:270px;
	height:270px;
	background-color:#111111;
}
#pjimg:hover{
  	opacity:0.6;
}

.plusbtn {
	text-align: center;
	position: absolute;
	top: 45%;
	left: 45%;
	transform: translate( -50%, -50% );
}

.hide {
  display: none;
}

#pjimgback:hover .hide {
	display:block;
	z-index:1002;
}

</style>
</head>

<body id="page-top">

	<!-- 11111111111111111 -->
	<c:import url="/WEB-INF/views/suugit/topbar.jsp"></c:import>

	<div
		style="width: 100%; display: flex; justify-content: center; align-item: center;">
		<!-- Sidebar2right -->
		<c:import url="/WEB-INF/views/red/sideFixedCalendar.jsp"></c:import>
		<!-- End of Sidebar2right -->
		<!-- 111111111111111111 -->


		<!-- Page Wrapper -->
		<div id="wrapper" style="width: 1300px;">

			<!-- Sidebar -->
			<div style="width: 17%"></div>
			<!-- End of Sidebar -->

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column bg-white"
				style="width: 82%;">

				<!-- Main Content -->
				<div id="content">

					<!-- Topbar -->
					<br> <br> <br> <br>
					<!-- End of Topbar -->

					<!-- Begin Page Content -->
					<div class="container-fluid col-text-left float-left"
						style="min-width: fit-content"">

					 <div class="card mb-4">
					        <div class="card-header">
					          <ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item">
							    <a class="nav-link active" id="project-tab" data-toggle="tab" href="#project" role="tab" aria-controls="profile" aria-selected="true">프로젝트 관리</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link " id="pmember-tab" data-toggle="tab" href="#pmember" role="tab" aria-controls="pmember" aria-selected="false">멤버 관리</a>
							  </li>
							  <li class="nav-item" onclick="invtlist()">
							    <a class="nav-link" id="npmember-tab" data-toggle="tab" href="#npmember" role="tab" aria-controls="npmember" aria-selected="false">초대 관리</a>
							  </li>
							  <a href="" class="btn ml-auto" data-toggle="modal" data-target="#inviteModal">
								<i class="fa fa-plus-square mr-1"></i>
								프로젝트 초대하기
								</a>
					        </div>
					        
					        <div class="card-body" >
					         <!--  <h4 class="card-title">글 작성</h4> -->
					          
					           <div class="tab-content mt-3" >
					           <!-- 글 작성  -->
					           <div class="tab-pane fade show active" id="project" role="tabpanel" aria-labelledby="nav-project-tab" style="height:300px">
								<div class="row">
									<div class="col-sm-8 col-md-4">
									<label id="pjimgback">
										<i class="fas fa-plus-circle fa-3x plusbtn hide"><br><h6>사진 등록</h6></i>
										<img id="pjimg" src="${p.open }" style="width: 270px; height: 270px;">
								<form id="pjImgFrom"  method="post" action="uppimg.do" enctype="multipart/form-data" >
										<input class="file-upload" type="file" name="upfile" id="pjImgId" title="프로젝트 메인 사진 등록하기" style="display: none" accept="image/*"> 
									</form>
									</label>
									</div>
									<form action="uppjdetail.do" method="post" id="myInfoForm"
										class="col-md-8">
										<div class="form-group row">
											<label class="control-label mypage text-center form-control-static col-md-3">프로젝트 이름</label>
											<input class="form-control col-md-6 pl-2 form-control-plaintext"
												type="text" name="name" value="${p.name}" onclick="upPjMethod(this)" readonly>
										</div>
										<div class="form-group row">
											<label class="control-label mypage text-center col-md-3">프로젝트 소개</label> 
											<div class="form-control col-md-6 pl-2 form-control-plaintext">
												<textarea class="form-control" name="explain" rows="4" cols="50" onclick="upPjMethod(this)" readonly>${p.explain}</textarea>
												</div>
												
										</dSiv>
					          		</form>
					          </div>
					          </div>
					          </div>
					          <!-- 멤버관리 -->
					           <div class="tab-pane fade" id="pmember" role="tabpanel" aria-labelledby="nav-pmember-tab">
					           <div class="d-flex">
					           <span class="text-truncate justify-content-start w-100">전체 멤버 수 :${fn: length(pmlist)} </span>
					           <!-- <form class="d-flex justify-content-end">
								  <input class="form-control form-control-sm w-75" type="text" placeholder="이름검색"
								    aria-label="Search">
								  <i class="fas fa-search mx-2" aria-hidden="true"></i>
								</form> -->
								</div>
					           <div class="dataTables_wrapper no-footer text-center">
								<table id="dataTable" class="table table-stripe">
									<thead>
										<th colspan="2">사진</th>
										<th>이름</th>
										<th>이메일</th>
										<th>휴대폰</th>
										<th>부서</th>
										<th>직책</th>
										<th>권한</th>
									</thead>
									<tbody id="pmlistBox">
									</tbody>
								</table>
								<!-- <nav aria-label="Page navigation ">
									  <ul class="pagination justify-content-center">
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									        <span class="sr-only">Previous</span>
									      </a>
									    </li>
									    <li class="page-item"><a class="page-link" href="#">1</a></li>
									    <li class="page-item"><a class="page-link" href="#">2</a></li>
									    <li class="page-item"><a class="page-link" href="#">3</a></li>
									    <li class="page-item"><a class="page-link" href="#">4</a></li>
									    <li class="page-item"><a class="page-link" href="#">5</a></li>
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									        <span class="sr-only">Next</span>
									      </a>
									    </li>
									  </ul>
									</nav> -->
							</div>
					           
					           </div>
							  <div class="tab-pane fade" id="npmember" role="tabpanel" aria-labelledby="nav-npmember-tab">
							  <div id="dataTable_wrapper"
								class="dataTables_wrapper no-footer text-center">
								<table class="table">
									<thead>
										<th>초대이메일</th>
										<th>만료일</th>
										<th>재전송</th>
										<th>초대취소</th>
									</thead>
									<tbody id="nmlistBox">
									
									</tbody>
								</table>
							</div>
					            
					          </div>
					        </div>
					      </div>

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
	<!-- div flex -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	
	<c:import url="/WEB-INF/views/suugit/modal.jsp"/>        
	
	<!-- Bootstrap core JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/hwabo/resources/maincss/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/hwabo/resources/maincss/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/hwabo/resources/maincss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/hwabo/resources/maincss/js/demo/datatables-demo.js"></script>
	<script src="/hwabo/resources/js/user.js"></script>
	<script>

	$('#example').dataTable({
		
	});
	$(document).ready(function(){
		
		 
		$.ajax({
			url: "pjdetail.do",
			type: "post",
			contentType : "application/json; charset=utf-8;",
			success : function(data){
				
			},
			error : function(){
				alert('실패');
			}
				
		});
	});
	  $('input[type="file"]').on('change', function(){
		  	$('#pjImgFrom').submit();
		  });
	  
	  $(document).on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
		    if ($('input[type="file"]').length) {
		      if (['dragover', 'dragenter'].indexOf(e.type) > -1) {
		        if (window.dragTimeout)
		          clearTimeout(window.dragTimeout);
		        $('body').addClass('dragged');
		      } else if (['dragleave', 'drop'].indexOf(e.type) > -1) {
		        // Without the timeout, some dragleave events are triggered
		        // when the :after appears, making it blink...
		        window.dragTimeout = setTimeout(function() {
		          $('body').removeClass('dragged');
		        }, 100);
		      }
		    }
		  });
	  

				 function upPjMethod(e){
		 if($(e).attr("readonly")){
				$(event.target).attr('readonly', false);
		 }else{
			 var data = {'keyword': e.name, 'keyvalue' : e.value}; 
				alert(typeof data);
				$.ajax({
					url:"uppjdetail.do",
					type:"post",
					data: data,
					dataType:"JSON",
					success:function(p){
						$(e).attr('readonly', true);
						if(e.name =="name"){
						e.value = p.name;
						}else{
						e.value = p.explain;
						}
					},
					error:function(){
						alert('실패');
					}
				});
		 }
		
		e.preventDefault();
		
	 }
				 
	  
	</script>
</body>

</html>
