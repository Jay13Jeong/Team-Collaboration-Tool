<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<body>
<c:if test="${ main.firstword eq 'c' }">
<c:set var="c" value="${ main }"></c:set>
<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-user-circle"></i> 
				<input type="text" value="${c.cucode}">
				${c.cwriter}<br> 
				${c.cenrolldate}
			</h6>
			<div class="dropdown no-arrow">
				<!-- 보관함 담기여부 -->
				<button id="cabinetshow" class="btn btn-custom btn-sm liketoggle" name="like">
					<span>보관</span> <i class="far fa-bookmark"></i>
				</button>
				<!-- 드롭다운 -->
				<a class="dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i
					class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
				</a>
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
					<div class="dropdown-header">메뉴:</div>
					<a name="mine" class="dropdown-item" onclick="toEdit()" >수정</a> 
					<a name="mine" class="dropdown-item" href="#">삭제</a>
				</div>
			</div>
			<!-- 드롭다운 끝 -->
		</div>
		<div id="cpView">
		<div id="cpEdit" style="display:none"> 
		 <c:import url="/WEB-INF/views/suugit/edit.jsp"></c:import>
		</div>
		<div class="card-body">
			<!-- 게시글안쪽 -->
			<h6>${c.ctitle}<h6>
			<hr>
			<table>
				<tr>
					<td>${c.ccontent}</td>
				</tr>
				<tr>
				<td>
				</td>
				</tr>
			</table>
				<ul class="cfstyle row-group" style="display:flex; list-style-type:none;-webkit-padding-start:0px;">
				<c:if test="${!empty c.ofile1 }">
					<li class="col-sm-3 border border-secondary rounded m-2" style="flex:auto;">
					<img src="resources/cupfiles/${c.rfile1}" style="max-width:150px">
					<label>${c.ofile1}</label>
				</c:if>
				<c:if test="${!empty c.ofile2 }">
					<li class="col-sm-3 border border-secondary rounded m-2" style="flex:auto;">
					<img src="resources/cupfiles/${c.rfile2}" style="max-width:150px">
					<label>${c.ofile2}</label>
				</c:if>
				<c:if test="${!empty c.ofile3 }">
					<li class="col-sm-3 border border-secondary rounded m-2" style="flex:auto;">
					<img src="resources/cupfiles/${c.rfile3}" style="max-width:150px">
					<label>${c.ofile3}</label>
				</c:if>
					</li>
				</ul>
			<hr>
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%;">
					<a href="#" class="btn btn-primary btn-icon-split btn-sm"> 
						<span class="icon text-white-50"> <i class="far fa-heart"></i></span> 
						<span class="text">좋아요</span>
					</a>
					</td>
					<td style="width: 20%;"></td>
					<td style="width: 20%;"></td>
					<td style="width: 20%;"></td>
					<td style="width: 20%; float: right;"></td>
				</tr>
			</table>
		</div>
		<div class="px-3 py-5 bg-gradient-light text-white"
			style="height: 10px;">
			<input type="text" class="form-control" placeholder="답글을 입력하세요">
		</div>
	</div>
	</div>

	<script src="resources/js/cpost.js"></script>
   <script>
   $(document).ready(function (e){
	   if('${sessionScope.ucode}' === '${c.cucode}'){
			$('a[name=mine]').addClass( 'active');
	   }else{
		   $('a[name=mine]').addClass( 'disabled');
	   }
   });
   function toEdit(){
	   alert('hi');
	   $("#cpView").hide();
	   $("#cpEdit").show();
   }   
   </script>
   
</c:if>
</body>
