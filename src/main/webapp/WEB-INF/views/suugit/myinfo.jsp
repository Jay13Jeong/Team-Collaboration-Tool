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
<link href="/hwabo/resources/maincss/css/github-markdown.css"
	rel="stylesheet">
<style>
body {
	background-color: #fff;
}

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
</style>
</head>

<body id="page-top">

	<!-- 11111111111111111 -->
	<c:import url="/WEB-INF/views/suugit/topbar.jsp"></c:import>

	<div
		style="width: 100%; display: flex; justify-content: center; align-item: center;">
		<!-- Sidebar2right -->
		<c:import url="/WEB-INF/views/suugit/leftsidebar.jsp"></c:import>
		<!-- End of Sidebar2right -->
		<!-- 111111111111111111 -->


		<!-- Page Wrapper -->
		<div id="wrapper" style="width: 1300px;">

			<!-- Sidebar -->
			<div style="width: 17%"></div>
			<!-- End of Sidebar -->

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column bg-white"
				style="width: 62%;">

				<!-- Main Content -->
				<div id="content">

					<!-- Topbar -->
					<br> <br> <br> <br>
					<!-- End of Topbar -->

					<!-- Begin Page Content -->
					<div class="container-fluid col-text-left float-left"
						style="min-width: fit-content"">

						<div class="card shadow">
							<div class="card-header border-left-info">
								<br>
								<h3 class="font-weight-bold mb-3 text-gray-800"
									style="display: inline-block">????????????</h3>
								<div class="row">
									<div class="col-sm-8 col-md-4">
										<img width=100% src="${member.uimg}"
											style="max-width: 200px; max-height: 200px"></img>
										<div class="text-center m-2">
											<button
												class="btn btn-outline-secondary btn-sm text upimgbtn mb-2"
												data-toggle="modal" data-target="#imgUpdateModal">???????????????</button>
											<button
												class="btn btn-outline-secondary btn-sm text upimgbtn"
												data-toggle="modal" data-target="#pwdUpdateModal">??????????????????</button>
										</div>
									</div>
									<form action="upinfo.do" method="post" id="myInfoForm"
										class="col-md-8">
										<input type="hidden" name="ucode" value="${member.ucode}">
										<div class="form-group row">
											<label
												class="control-label mypage text-center form-control-static">?????????</label>
											<input class="form-control col-md-8 pl-2 form-control-plaintext"
												type="email" name="uemail" value="${member.uemail}" readonly>
										</div>
										<div class="form-group row">
											<label class="control-label mypage text-center">??????</label> <input
												class="form-control col-md-8 pl-2 form-control-plaintext"
												type="text" name="uname" value="${member.uname}" readonly>
										</div>
										<!-- <div class="form-group row">
											<label class="control-label mypage text-center">????????????</label>
											<input class="form-control col-md-5 pl-2 " type="password"
												name="upwd" placeholder="?????? ????????????"> &nbsp <label
												class="btn btn-info btn-sm text" id="btn_pwd" returnfalse;>??????????????????</label>
										</div> -->
										<div class="form-group row">
											<label class="control-label mypage text-center">?????????</label> <input
												class="form-control col-md-8 form-control-plaintext pl-2 "
												type="text" name="uphone" readonly value="${member.uphone}">
										</div>
										<hr>

										<div class="form-group row">
											<label class="control-label mypage text-center">??????</label> <input
												type="text" name="ugroup"
												class="form-control col-md-8 form-control-plaintext pl-2 "
												readonly value="${member.ugroup}">
										</div>
										<div class="form-group row">
											<label class="control-label mypage text-center">??????</label> <input
												class="form-control col-md-8 form-control-plaintext"
												type="text" name="urole" readonly value="${member.urole}">
										</div>
										<br>
										<div class="col-md-12 text-center">
											<input type="button" id="editBtn" value="????????????"
												onclick="toggleModify()"
												class="btn btn-primary col-sm-4 btn-sm"> <input
												type="reset" value="??????"
												class="btn btn-secondary col-sm-2 btn-sm"> <input
												id="btn_signout" type="button" value="????????????"
												data-toggle="modal" data-target="#LeaveModal"
												class="btn btn-default col-sm-3 btn-sm text-right">
										</div>
								</div>

								</form>
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
	<!--?????????????????????-->
	<div class="modal fade" id="imgUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="imgModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title col-text-left" id="imgModalLabel">???????????????</h4>

				</div>
				<div class="modal-body ">????????? ?????? ????????? ??????????????????</div>
				<div class="col-sm-4 justify-content-center">
					<table>
						<form action="upuimg.do" id="updateUimgForm" method="post"
							enctype="multipart/form-data">
							<tr id="preview"></tr>
					</table>
					<label class="btn btn-light small" onclick="fileUpload"> <input
						type="hidden" name="ucode" value="${sessionScope.ucode}">
						<input type="file" name="file" id="file" style="display: none"
						accept=".jpg,.png,.svg"> <i class="fa fa-link ">&nbsp;??????
							??????</i>
					</label>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">????????????</button>
					</form>
					<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
				</div>

			</div>
		</div>
	</div>

	<!--???????????? ?????? ????????? -->
	<div class="modal fade" id="pwdUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="pwdModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title col-text-left" id="pwdModalLabel">??????????????????</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<form action="uppwd.do" method="post" id="upPwdForm">
						<input type="hidden" name="ucode" value="${ucode}">
						<div class="form-group row">
							<label class="control-label mypage text-center col-md-4">??????
								????????????</label> <input class="form-control col-md-6" type="password"
								name="oldpwd">
						</div>
						<div class="form-group row">
							<label class="control-label mypage text-center col-md-4">???
								????????????</label> <input class="form-control col-md-6" type="password"
								name="newpwd">
						</div>
						<div class="form-group row">
							<label class="control-label mypage text-center col-md-4">???
								???????????? ??????</label> <input class="form-control col-md-6" type="password"
								name="newpwdChk">
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">????????????</button>
					</form>
					<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>

	<!-- ????????????  ??????-->
	<div class="modal fade" id="LeaveModal" tabindex="-1" role="dialog"
		aria-labelledby="LeaveModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">?????? ??????</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">?????? ?????? ??? ????????? ???????????? ????????? ????????? ??? ????????????.
					?????????????????????????</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">??????</button>
					<button type="button" class="btn btn-danger" onclick="delUser()">????????????</button>
				</div>
			</div>
		</div>
	</div>



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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="resources/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		function toggleModify() {
			var ele = $(event.target);
			if (ele.val() == '????????????') {
				$('input[type=text]').removeClass('form-control-plaintext');
				$('input[type=text]').attr('readonly', false);
				$('#editBtn').removeClass('btn-primary')
				$('#editBtn').addClass('btn-success')
				ele.val('???????????? ??????');
			} else {
				$('#editBtn').addClass('btn-primary')
				$('#editBtn').removeClass('btn-success')
				ele.val('????????????');
				$('#myInfoForm').submit();
			}
		}

		function delUser() {
			location.href = "deluser.do?ucode=${member.ucode}";
		}

		$('#btn_pwd').on('click', function() {
			$('#pwdUpdateModal').modal('show')
		})

		/* 			 $(function(){
		var responseMessage = "<c:out value="${message}" />";
		if(responseMessage != ""){
		    alert(responseMessage)
		}
		})  */
	</script>
</body>

</html>
