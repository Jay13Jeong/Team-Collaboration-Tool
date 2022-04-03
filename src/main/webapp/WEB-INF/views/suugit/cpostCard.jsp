<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HWABO</title>

</head>
<body>
	<div class="card shadow mb-4">
		<div
			class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-user-circle"></i> ${c.cwriter}<br>
				${c.cenrolldate}
			</h6>

			<div class="dropdown no-arrow">

				<!-- 보관함 담기여부 -->

				<button id="cavinetin_${status.index }"
					class="btn btn-custom btn-sm liketoggle${status.index }"
					name="like" onclick="sendInsert(${status.index});">
					<span>보관</span> <i class="far fa-bookmark"></i>
				</button>
				<input type="hidden" id="ucode_${status.index }"
					value="${sessionScope.ucode }"> <input type="hidden"
					id="no_${status.index }" value="${c.cno }"> <input
					type="hidden" id="pnum_${status.index }" value="${c.cpnum }">
				<input type="hidden" id="open_${status.index }" value="${c.copen }">

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
					<a name="mine" class="dropdown-item" onclick="toEdit()">수정</a>
					<c:url var="delcp" value="delcp.do">
						<c:param name="cno" value="${c.cno }" />
					</c:url>
					<a name="mine" class="dropdown-item" href="${delcp }">삭제</a>
				</div>

			</div>
			<!-- 드롭다운 끝 -->

		</div>
		<div id="cpEdit" style="display: none">
			<c:import url="/WEB-INF/views/suugit/edit.jsp"></c:import>
		</div>
		<div id="cpView">
			<div class="card-body">
				<!-- 게시글안쪽 -->
				<h6>${c.ctitle}<h6>
						<hr>
						<table>
							<tr>
								<td>${c.ccontent}</td>

							</tr>
							<tr>

								<td><br>
								<hr></td>
							</tr>
							<tr id="preview">

								<c:if test="${!empty c.ofile1 }">
									<td class="rounded" style="width: 33%"><c:set
											var="fileName" value="${fn:split(c.ofile1, '.')}" /> <c:set
											var="fileType" value="${fileName[fn:length(fileName)-1]} " />
										<c:if
											test="${fn:contains(fileType,'jpg') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">
											<img src="resources/bupfile/${c.rfile1}"
												style="max-width: 150px">
										</c:if> <c:if
											test="${not fn:contains(fileType,'jpg') && not fn:contains(fileType,'png') && not fn:contains(fileType,'svg') && not fn:contains(fileType,'gif')}">
											<img src="resources/maincss/img/suugit/file_altimg.svg"
												style="max-width: 150px">
										</c:if> <br> <label class="ml-4 text-center">${c.ofile1}
									</label></td>
								</c:if>
								<c:if test="${!empty c.ofile2 }">
									<td class="rounded" style="width: 33%"><c:set
											var="fileName" value="${fn:split(c.ofile2, '.')}" /> <c:set
											var="fileType" value="${fileName[fn:length(fileName)-1]} " />
										<c:if
											test="${fn:contains(fileType,'jpg') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">
											<img src="resources/bupfile/${c.rfile2}"
												style="max-width: 150px">
										</c:if> <c:if
											test="${not fn:contains(fileType,'jpg') && not fn:contains(fileType,'png') && not fn:contains(fileType,'svg') && not fn:contains(fileType,'gif')}">
											<img src="resources/maincss/img/suugit/file_altimg.svg"
												style="max-width: 150px">
										</c:if> <br> <label class="ml-4 text-center">${c.ofile2}
									</label></td>
								</c:if>
								<c:if test="${!empty c.ofile3 }">
									<td class="rounded" style="width: 33%"><c:set
											var="fileName" value="${fn:split(c.ofile3, '.')}" /> <c:set
											var="fileType" value="${fileName[fn:length(fileName)-1]} " />
										<c:if
											test="${fn:contains(fileType,'jpg') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">
											<img src="resources/bupfile/${c.rfile3}"
												style="max-width: 150px">
										</c:if> <c:if
											test="${not fn:contains(fileType,'jpg') && not fn:contains(fileType,'png') && not fn:contains(fileType,'svg') && not fn:contains(fileType,'gif')}">
											<img src="resources/maincss/img/suugit/file_altimg.svg"
												style="max-width: 150px">
										</c:if> <br> <label class="ml-4 text-center">${c.ofile3}
									</label></td>
								</c:if>
							</tr>
						</table>
						<%-- 	<ul class="cfstyle row-group" style="display:flex; list-style-type:none;-webkit-padding-start:0px;">
				<c:if test="${!empty c.ofile1 }">
					<li class="col-sm-3 border border-secondary rounded m-2" style="flex:auto;">
					<img src="resources/bupfile/${c.rfile1}" style="max-width:150px">
					<label>${c.ofile1}</label>
				</c:if>
				<c:if test="${!empty c.ofile2 }">
					<li class="col-sm-3 border border-secondary rounded m-2" style="flex:auto;">
					<img src="resources/bupfile/${c.rfile2}" style="max-width:150px">
					<label>${c.ofile2}</label>
				</c:if>
				<c:if test="${!empty c.ofile3 }">
					<li class="col-sm-3 border border-secondary rounded m-2" style="flex:auto;">
					<img src="resources/bupfile/${c.rfile3}" style="max-width:150px">
					<label>${c.ofile3}</label>
				</c:if>
					</li>
				</ul>
 --%>

						<hr>
						<table style="width: 100%;">
							<tr>
								<td style="width: 20%;"><a href="#"
									class="btn btn-primary btn-icon-split btn-sm"> <span
										class="icon text-white-50"> <i class="far fa-heart"></i></span>
										<span class="text">좋아요</span>
								</a></td>
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


	<script src="resources/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>

   $(document).ready(function (e){
	   if('${sessionScope.ucode}' === '${c.cucode}'){
			$('a[name=mine]').addClass( 'active');
	   }else{
		   $('a[name=mine]').addClass( 'disabled');
	   }
	  
   });
   
   function toEdit(){
	   $("#cpView").hide();
	   $("#cpEdit").show();
   }  

   </script>
</body>
</html>