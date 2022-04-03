<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.png" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HWABO</title>

  <!-- Custom fonts for this template-->
  <link href="../resources/maincss/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../resources/maincss/css/styles_suugit.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
<!-- 테스트버튼 시작 -->
<div style="position:absolute;z-index:5;"><br>&nbsp;
	원하는 페이지로 :
    <button onclick="javascript:location.href='index.jsp'">index</button>
    <button onclick="javascript:location.href='404.jsp'">404</button>
    <button onclick="javascript:location.href='blank.jsp'">blank</button>
    <button onclick="javascript:location.href='buttons.jsp'">buttons</button>
    <button onclick="javascript:location.href='cards.jsp'">cards</button>
    <button onclick="javascript:location.href='charts.jsp'">charts</button>
    <button onclick="javascript:location.href='forgot-password.jsp'">forgot-password</button>
    <button onclick="javascript:location.href='login.jsp'">login</button>
    <button onclick="javascript:location.href='register.jsp'">register</button>
    <button onclick="javascript:location.href='tables.jsp'">tables</button>
    <button onclick="javascript:location.href='utilities-animation.jsp'">utilities-animation</button>
    <button onclick="javascript:location.href='utilities-border.jsp'">utilities-border</button>
    <button onclick="javascript:location.href='utilities-color.jsp'">utilities-color</button>
    <button onclick="javascript:location.href='utilities-other.jsp'">utilities-other</button>
    </div>
<div style="background-color:#F8E0E6;border:2px solid black;"><br><br><br></div>
<!-- 테스트버튼 끝 -->
  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form class="user">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name">
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                  </div>
                </div>
                <a href="login.jsp" class="btn btn-primary btn-user btn-block">
                  Register Account
                </a>
                <hr>
                <a href="index.jsp" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.jsp" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.jsp">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.jsp">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../resources/maincss/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../resources/maincss/js/sb-admin-2.min.js"></script>

</body>

</html>
