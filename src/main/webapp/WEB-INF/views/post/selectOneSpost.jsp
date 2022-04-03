<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HWABO</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab3b0466fa883da1d7216010325a5bcc&libraries=services"></script>
</head>

<body>
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-user-circle"></i> 
				${post.swriter}<br> 
				<fmt:formatDate value="${post.senrolldate}" pattern="yyyy-MM-dd HH시 mm분 E요일"/>
				
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
					class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
					aria-labelledby="dropdownMenuLink">
					<div class="dropdown-header">메뉴:</div>
					<a class="dropdown-item" href="#">수정</a> <a class="dropdown-item"
						href="#">삭제</a>
				</div>

			</div>
			<!-- 드롭다운 끝 -->

		</div>
		<div class="card-body">
			<!-- 게시글안쪽 -->
			<h6>${post.stitle }</h6>
			<hr>
			<table>
				<tr>
					<th>시 작 날 짜</th><th>끝 날 짜</th>
				</tr>
				<tr>
					<td><fmt:formatDate value="${post.sstartday}" pattern="yyyy-MM-dd HH시 mm분 E요일"/>
					</td>
					<td><fmt:formatDate value="${post.sendday}" pattern="yyyy-MM-dd HH시 mm분 E요일"/></td>
				</tr>
				<c:if test="${ !empty post.splace }">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<th colspan="2" >장 소</th>
				</tr>
				<tr>
					<td>${spost.splace }</td>
				</tr>
				</c:if>
			
				
				
				<c:if test="${ !empty post.scontent }">
					<tr><td>&nbsp;</td></tr>
					<tr>
						<th>메  모</th>
					</tr>
					<tr>
						<td>${post.scontent }</td>
					</tr>
				</c:if>
				
		
			</table>


			<hr>
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%;">
					<a href="#" class="btn btn-primary btn-icon-split btn-sm"> 
						<span class="icon text-white-50"> <i class="far fa-heart"></i></span>
						<button onclick="javascript: location.href='#'">
						<span class="text">좋아요</span>
						</button> 
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
			<form action="#" method="post">
			<input type="text" class="form-control" placeholder="답글을 입력하세요">
			</form>
		</div>
	
</body>
</html>