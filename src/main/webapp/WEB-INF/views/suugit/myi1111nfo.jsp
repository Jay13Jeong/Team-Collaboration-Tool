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

          <h3 class="font-weight-bold mb-3 text-gray-800" style="display:inline-block">????????????</h3>
          <div class="row">
            <div class="col-sm-8 col-md-4">
              <img width=100% src="/hwabo/resources/maincss/img/suugit/face.jpg" style="max-width:200px"></img>
              <div class="text-center m-2">
              <button class="btn btn-info btn-sm text upimgbtn" data-toggle="modal" data-target="#imgUpdateModal">???????????????</button>
              <button class="btn btn-info btn-sm text upimgbtn" data-toggle="modal" data-target="#pwdUpdateModal">??????????????????</button>
            </div>
            </div>
           
            <form class="col-md-8" >

              <div class="form-group row" >
                <label class="control-label mypage text-center form-control-static">?????????</label> 
                  <input class="form-control col-md-8" type="email" name="email" value="${member.uemail}">
              </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">??????</label> 
                  <input class="form-control col-md-8" type="text" name="uname" value="${member.uname}">
              </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">????????????</label> 
                  <input class="form-control col-md-5" type="password" name="password" placeholder="?????? ????????????">
                  &nbsp
                  <button class="btn btn-info btn-sm text" id="btn_pwd" data-toggle="modal" data-target="#pwdModalLabel"; return=false;>??????????????????</button>
                </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">?????????</label> 
                  <input class="form-control col-md-8" type="text" name="uphone" value="${member.uphone}">
              </div>

              <hr>

              <div class="form-group row" >
                <label class="control-label mypage text-center">??????</label> 
                  <input class="form-control col-md-8" type="email" name="ugroup" value="${member.uphone}">
              </div>
              <div class="form-group row" >
                <label class="control-label mypage text-center">??????</label> 
                  <input class="form-control col-md-8" type="text" name="nrole" value="${member.uphone}">
              </div>
              <br>
                <div class="col-md-12 text-center">                
                  <input type="submit" value="????????????" class="btn btn-primary col-sm-4 btn-sm"> 
                  <input type="button" value="??????" class="btn btn-secondary col-sm-2 btn-sm"> 
                  <input id="btn_signout" type="button" value="????????????" class="btn btn-default col-sm-3 btn-sm text-right"> 
                </div>
              </div>
              
                </form>
              </div>
            </div>
          </div>
        </div>
</div>
        <!--?????????????????????-->
        <div class="modal fade" id="imgUpdateModal" tabindex="-1" role="dialog" aria-labelledby="imgModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title col-text-left" id="imgModalLabel">???????????????</h4>
              
              </div>
              <div class="modal-body">
                ????????? ?????? ????????? ??????????????????
              </div>
              <div class="col-sm-4"> 
                <button class="btn btn-info"> ????????????</button>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
              </div>
            </div>
          </div></div>

          <!--???????????? ?????? ????????? -->
          <div class="modal fade" id="pwdUpdateModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title col-text-left" id="pwdModalLabel">??????????????????</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  
                </div>
                <div class="modal-body">
                  <div class="form-group row" >
                    <label class="control-label mypage text-center col-md-4">??? ????????????</label> 
                      <input class="form-control col-md-6" type="email" name="email">
                  </div>
                  <div class="form-group row" >
                    <label class="control-label mypage text-center col-md-4">???????????? ??????</label> 
                      <input class="form-control col-md-6" type="email" name="email">
                  </div>
                </div>
              
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" >????????????</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                </div>
              </div>
            </div></div>

          <script>
            document.getElementById('btn_pwd').addEventListener('click',function(){
              $('pwdUpdateModal').modal('show');
              e.stopPropagation();
            })
			
            document.getElementById('btn_signout').addEventListener('click',function(){
            	var result = confirm('?????? ?????? ??? ????????? ???????????? ????????? ????????? ??? ????????????. ?????????????????????????'); 
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