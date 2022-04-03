<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>

</head>

<body id="page-top">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <img src="resources/maincss/img/hwaboLogo.png" style="width: 100%; max-width: 780px; vertical-align: middle" onclick="javascript:location.href='/hwabo/'">

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


    </ul>
    <!-- End of Sidebar -->

</body>

</html>
