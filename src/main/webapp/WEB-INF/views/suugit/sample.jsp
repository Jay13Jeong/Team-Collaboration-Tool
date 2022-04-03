<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HWABO</title>
</head>
<body>
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-user-circle"></i> 
				작성자<br> 
				등록일자
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
			<c>제목 : 제목을 여기쓰고</c>
			<hr>
			<table>
				<tr>
					<td>내용</td>
					<td>내용을 여기에 출력한다</td>
				</tr>
			</table>

			<table>
				<c:if test="">
					<!-- 파일있으면! -->
					<tr>
						<td>파일</td>
						<br>
					</tr>
					<tr>
						<th></th>

						<td><a href="#"></a></td>
					</tr>
				</c:if>

			</table>

			<hr>
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%;">
					<a href="#" class="btn btn-primary btn-icon-split btn-sm"> 
						<span class="icon text-white-50"> <i class="far fa-heart"></i></span> 
						<span class="text">좋아요 <!-- 여기에좋아요수 출력하기~ ${.love} --></span>
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
</body>
</html>