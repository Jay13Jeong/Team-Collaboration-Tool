<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
      <!-- Sidebar - Brand -->
      <br><br><br>
      <img src="resources/maincss/img/hwaboLogo.png" style="width: 100%; max-width: 780px; vertical-align: middle" onclick="javascript:location.href='/hwabo/'">


         <!-- Nav Item - Pages Collapse Menu -->
         
         <li class="nav-item">
             <a class="nav-link collapsed" href="binsertpage.do" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages"> 
               <i class="far fa-folder-open"></i>
             <span>글쓰기폼</span>
            </a>
         <a class="nav-link collapsed" href="#" data-target="#collapsePages" aria-expanded="true"
               aria-controls="collapsePages"> 
               <i class="far fa-address-card"></i>
               <span>나의 화보</span>
            </a> 
         <!-- Divider -->
         <hr class="sidebar-divider">
         
         
            <a class="nav-link collapsed" href="mynote.do" data-target="#collapsePages" aria-expanded="true"
               aria-controls="collapsePages"> 
               <i class="fas fa-book-reader"></i>
               <span>노트</span>
            </a> 
            
             <c:url var="cm" value="cabinetList.do">
				  <c:param name="pnum" value="${sessionScope.pnum }"/>
				  <c:param name="ucode" value="${sessionScope.ucode }"/>
			   </c:url> 
            
            <a class="nav-link collapsed" href="${cm}" data-target="#collapsePages" aria-expanded="true"
               aria-controls="collapsePages"> 
               <i class="fas fa-box-open"></i> 
              
               <span>보관함</span>
            </a> 
            <a class="nav-link collapsed" href="Fileboxlist.do?pnum=${sessionScope.pnum }" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages"> 
               <i class="far fa-folder-open"></i>
             <span>파일함</span>
            </a>
           
            
         </li>

         <!-- Divider -->
         <hr class="sidebar-divider">

         <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item"><a class="nav-link collapsed" href="#"
            data-toggle="collapse" data-target="#collapseOne"
            aria-expanded="true" aria-controls="collapseOne">
            <i class="fas fa-chalkboard"></i><span>팀원들의 화보</span>
         </a>
            <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
               data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">HWABO</h6>
                  <a class="collapse-item" href="#"><span><label>사람이름1</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름2</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름3</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름4</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름5</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름6</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름7</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름8</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름9</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름10</label></span></a>
                  <a class="collapse-item" href="#"><span><label>사람이름11</label></span></a>
               </div>
            </div></li>

         <!-- Divider -->
         <hr class="sidebar-divider d-none d-md-block">

         <!-- Sidebar Toggler (Sidebar) -->
         <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
         </div>

      </ul>

     <!--  <!-- Divider -->
      <hr class="sidebar-divider my-0">

      Nav Item - Dashboard
      <li class="nav-item active">
        <a class="nav-link" href="/hwabo/">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>이전 페이지로</span></a>
      </li>

      Divider
      <hr class="sidebar-divider">

      Sidebar Toggler (Sidebar)
      <div class="text-center d-none d-md-inline">
      
      </div>

</ul> -->
    
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

<c:import url="/WEB-INF/views/kyukyu/sideRight.jsp"></c:import>

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