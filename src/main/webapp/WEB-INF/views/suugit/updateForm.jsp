<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>