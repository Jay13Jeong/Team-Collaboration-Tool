<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="position:fixed;height:100%;">

<table style="width:1300px;height:100%;">
<tr>
<td style="width:17%;">

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="width:1300px;height:100%;">

<br><br><br><br>

      <!-- 화보 이미지 -->
      <img src="resources/maincss/img/hwaboLogo.png" style="width: 100%; max-width: 780px; vertical-align: middle" onclick="javascript:location.href='/hwabo/'">
	
<!-- 왼쪽사이드바 시작 -->
      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      <!-- Heading -->
      <div class="sidebar-heading">
        Main
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="fborder.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>캘린더</span></a>
      </li>
      
       <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="fborder2.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>캘린더2</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="ftables.do">
          <i class="fas fa-fw fa-table"></i>
          <span>리스트</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">
      
      <div class="sidebar-heading">
        progress
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="fother.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>목표</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">
<!-- 왼쪽사이드바 끝 -->

</ul>
    
</td>
<td style="width:57%;">

</td>
<td style="width:23.5%;">



<!-- 채팅위치조정테이블하단 시작 -->
<table style="height:100%;width:100%;">
<tr><td style="height:90px;"></td></tr><tr>
<td style="height:30%;">
<!-- 채팅위치조정테이블하단 시작 -->

<!-- 채팅 폼 시작 -->

<c:import url="/WEB-INF/views/suugit/sideRight.jsp"></c:import>

<!-- 채팅 폼 끝 -->

<!-- 채팅위치조정테이블하단 끝 -->
</td>
</tr>
<tr><td style="height:70%;"></td></tr>
</table>
<!-- 채팅위치조정테이블하단 끝 -->
</td>
</tr>    
</table>
    
    </div>
</body>
</html>