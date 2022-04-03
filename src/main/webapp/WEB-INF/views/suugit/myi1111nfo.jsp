<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HWABO</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/hwabo/resources/maincss/css/styles_suugit.css" rel="stylesheet">

  <style>
    .mypage {
      width:80px;
      font-weight:bold;
      margin-top:7px;
    }

    .upimgbtn {
      width:90%;
      background-color:#F8F9FD;
      color:#858796;
      border-color:#d1d3e2;
    }
    
      .modal-backdrop {

        z-index: -1;

    }
  </style>
</head>
<body>
<body id="page-top">

<!-- 11111111111111111 -->
  <c:import url="/WEB-INF/views/suugit/topbar.jsp"></c:import>
 
 <div style="width:100%;display:flex;justify-content:center;align-item:center;">
<!-- Sidebar2right -->
     <c:import url="/WEB-INF/views/red/sideFixed.jsp"></c:import>
<!-- End of Sidebar2right -->
<!-- 111111111111111111 -->
 
 
  <!-- Page Wrapper -->
  <div id="wrapper" style="width:1300px;">

    <!-- Sidebar -->
    <div style="width:17%"></div>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column bg-white" style="width:62%;">

      <!-- Main Content -->
     <div id="content">

        <!-- Topbar -->
        <br><br><br><br>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
<div id="content-wrapper" class="d-flex flex-column " style="width:62%">
  <div class="container">
  	<br><br><br><br>
        <div class="container-fluid col-md-7 col-text-left float-left" style="min-width:fit-content">
          <div class="card shadow">
            <div class="card-header border-left-info">

              
          <!-- Page Heading -->
          <br>

          <h3 class="font-weight-bold mb-3 text-gray-800" style="display:inline-block">계정정보</h3>
          <div class="row">
            <div class="col-sm-8 col-md-4">
              <img width=100% src="/hwabo/resources/maincss/img/suugit/face.jpg" style="max-width:200px"></img>
              <div class="text-center m-2">
              <button class="btn btn-info btn-sm text upimgbtn" data-toggle="modal" data-target="#imgUpdateModal">파일업로드</button>
              <button class="btn btn-info btn-sm text upimgbtn" data-toggle="modal" data-target="#pwdUpdateModal">비밀번호변경</button>
            </div>
            </div>
           
            <form class="col-md-8" >

              <div class="form-group row" >
                <label class="control-label mypage text-center form-control-static">이메일</label> 
                  <input class="form-control col-md-8" type="email" name="email" value="${member.uemail}">
              </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">이름</label> 
                  <input class="form-control col-md-8" type="text" name="uname" value="${member.uname}">
              </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">비밀번호</label> 
                  <input class="form-control col-md-5" type="password" name="password" placeholder="기존 비밀번호">
                  &nbsp
                  <button class="btn btn-info btn-sm text" id="btn_pwd" data-toggle="modal" data-target="#pwdModalLabel"; return=false;>비밀번호변경</button>
                </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">휴대폰</label> 
                  <input class="form-control col-md-8" type="text" name="uphone" value="${member.uphone}">
              </div>

              <hr>

              <div class="form-group row" >
                <label class="control-label mypage text-center">소속</label> 
                  <input class="form-control col-md-8" type="email" name="ugroup" value="${member.uphone}">
              </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">역할</label> 
                  <input class="form-control col-md-8" type="text" name="nrole" value="${member.uphone}">
              </div>
              <br>
                <div class="col-md-12 text-center">                
                  <input type="submit" value="저장하기" class="btn btn-primary col-sm-4 btn-sm"> 
                  <input type="button" value="취소" class="btn btn-secondary col-sm-2 btn-sm"> 
                  <input id="btn_signout" type="button" value="회원탈퇴" class="btn btn-default col-sm-3 btn-sm text-right"> 
                </div>
              </div>
              
                </form>
              </div>
            </div>
          </div>
        </div>
</div>
        <!--사진변경모달창-->
        <div class="modal fade" id="imgUpdateModal" tabindex="-1" role="dialog" aria-labelledby="imgModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title col-text-left" id="imgModalLabel">사진업로드</h4>
              
              </div>
              <div class="modal-body">
                변경할 사진 파일을 선택해주세요
              </div>
              <div class="col-sm-4"> 
                <button class="btn btn-info"> 파일선택</button>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              </div>
            </div>
          </div></div>

          <!--비밀번호 변경 모달창 -->
          <div class="modal fade" id="pwdUpdateModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title col-text-left" id="pwdModalLabel">비밀번호변경</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  
                </div>
                <div class="modal-body">
                  <div class="form-group row" >
                    <label class="control-label mypage text-center col-md-4">새 비밀번호</label> 
                      <input class="form-control col-md-6" type="email" name="email">
                  </div>
                  <div class="form-group row" >
                    <label class="control-label mypage text-center col-md-4">비밀번호 확인</label> 
                      <input class="form-control col-md-6" type="email" name="email">
                  </div>
                </div>
              
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" >변경하기</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
              </div>
            </div></div>

          <script>
            document.getElementById('btn_pwd').addEventListener('click',function(){
              $('pwdUpdateModal').modal('show');
              e.stopPropagation();
            })
			
            document.getElementById('btn_signout').addEventListener('click',function(){
            	var result = confirm('회원 탈퇴 시 어떠한 경우에도 계정을 복구할 수 없습니다. 계속하시겠습니까?'); 
            	if(result) { 
            		//yes location.replace('index.php'); 
            		} else { //no 
            			
            			}

            		
            })
          </script>
       
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
<div style="width:25%"></div>
  </div>
  <!-- End of Page Wrapper -->
</div><!-- div flex -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

 
  <!-- Bootstrap core JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery/jquery.min.js"></script>
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




</body>
</html>