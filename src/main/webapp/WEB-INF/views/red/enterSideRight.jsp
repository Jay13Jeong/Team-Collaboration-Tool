<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="p_height" value="700px" ></c:set>
<c:set var="p_width" value="250px" ></c:set>
<c:set var="picture_height" value="660px" ></c:set>
<c:set var="picture_width" value="300px" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 슬라이드사진_프로젝트선택페이지 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
.carousel-inner img {
  width: 100%;
  height: ${ p_height };
}
</style>
<!-- 슬라이드사진_프로젝트선택페이지 끝 -->

</head>
<body>
<!-- 채팅 폼 시작 -->

<div class="card shadow mb-4" style="height:100%;max-height:${ p_height };max-width:309px;">
<div class="card-body" style="width:100%">
<!-- 오른쪽 사이드 시작 -->

<div id="demo" class="carousel slide" data-ride="carousel" style="width:100%;height:${ p_height };">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner" >
<!-- 사진영역 시작 -->
    <div class="carousel-item active" >
      <img src="/hwabo/resources/maincss/img/projectChoice/p1.svg" alt="Los Angeles" style="width:${ picture_width } !important;height:${ picture_height } !important;background-color:">
      <div class="carousel-caption">
        <h3>HWABO</h3>
        <p>Thank you, Everyone!</p>
      </div>   
    </div>
<% for(int i = 2; i <= 9; i++){ %>
    <div class="carousel-item">
      <img src="/hwabo/resources/maincss/img/projectChoice/p<%= i %>.svg" alt="Chicago" style="width:${ picture_width } !important;height:${ picture_height } !important;">
      <div class="carousel-caption">
        <h3>HWABO</h3>
        <p>Thank you, Everyone!</p>
      </div>   
    </div>
<% } %>  
<!-- 사진영역 끝 -->  
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev"  style="width:30px;">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next" style="width:30px;">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<!-- 오른쪽 사이드 끝 -->
</div>
</div>
<!-- 채팅 폼 끝 -->
</body>
</html>