<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="icon" type="image/x-icon" href="/hwabo/resources/assets/img/favicon.png" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HWABO</title>

  <!-- Custom fonts for this template-->
  <link href="/hwabo/resources/maincss/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/hwabo/resources/maincss/css/sb-admin-2.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
<!-- 테스트버튼 시작 -->
<div style="position:absolute;z-index:5;"><br>&nbsp;
	원하는 페이지로 :
    <button onclick="javascript:location.href='red.do'">index</button>
    <button onclick="javascript:location.href='404.do'">404</button>
    <button onclick="javascript:location.href='blank.do'">blank</button>
    <button onclick="javascript:location.href='buttons.do'">buttons</button>
    <button onclick="javascript:location.href='cards.do'">cards</button>
    <button onclick="javascript:location.href='charts.do'">charts</button>
    <button onclick="javascript:location.href='fpassword.do'">forgot-password</button>
    <button onclick="javascript:location.href='flogin.do'">login</button>
    <button onclick="javascript:location.href='fregister.do'">register</button>
    <button onclick="javascript:location.href='ftables.do'">tables</button>
    <button onclick="javascript:location.href='fanimation.do'">utilities-animation</button>
    <button onclick="javascript:location.href='fborder.do'">utilities-border</button>
    <button onclick="javascript:location.href='fcolor.do'">utilities-color</button>
    <button onclick="javascript:location.href='fother.do'">utilities-other</button>
    </div>
<div style="background-color:#F8E0E6;border:2px solid black;"><br><br><br></div>
<!-- 테스트버튼 끝 -->
  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    <a href="index.jsp" class="btn btn-primary btn-user btn-block">
                      Login
                    </a>
                    <hr>
                    <a href="index.jsp" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="index.jsp" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="forgot-password.jsp">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="register.jsp">Create an Account!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery/jquery.min.js"></script>
  <script src="/hwabo/resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/hwabo/resources/maincss/js/sb-admin-2.min.js"></script>

</body>

</html>
