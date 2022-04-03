<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<div id="cpView${c.cno}">
					<div class="card-body">
						<!-- 게시글안쪽 -->
						<h6 class="ctt">${c.ctitle}<h6>
								<hr>
								<table>
									<tr>
										<td class="ccon pb-3">${c.ccontent}</td>
									</tr>
																			
									<tr id="preview">
										<c:if test="${!empty c.ofile1 }">
											<td class="rounded align-bottom" style="width: 33%"><c:set
													var="fileName" value="${fn:split(c.ofile1, '.')}" /> <c:set
													var="fileType" value="${fileName[fn:length(fileName)-1]} " />
												<c:choose>
													<c:when test="${fn:contains(fileType,'jp') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">
													<img class="rounded img-fluid " src="resources/bupfile/${c.rfile1}" >
													</c:when>	
													<c:otherwise>
													<img class="rounded img-fluid " src="resources/maincss/img/suugit/file_altimg.svg">
													</c:otherwise>
												</c:choose>
												<p class="my-2" />
												<a href="javascript:location.href='cfiledown.do?ofile=${c.ofile1}&rfile=${c.rfile1}'" class="ml-4 font-weight-bold" style="margin-top:12px">
												<i class="far fa-file"></i> :  ${c.ofile1}</a></td>
										</c:if>
										<c:if test="${!empty c.ofile2 }">
											<td class="rounded align-bottom" style="width: 33%"><c:set
													var="fileName" value="${fn:split(c.ofile2, '.')}" /> <c:set
													var="fileType" value="${fileName[fn:length(fileName)-1]} " />
												<c:choose>
													<c:when test="${fn:contains(fileType,'jp') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">
													<img class="rounded img-fluid" src="resources/bupfile/${c.rfile2}">
													</c:when>	
													<c:otherwise>
													<img class="rounded img-fluid " src="resources/maincss/img/suugit/file_altimg.svg">
													</c:otherwise>
												</c:choose>
												<p class="my-2" />
												<a href="javascript:location.href='cfiledown.do?ofile=${c.ofile2}&rfile=${c.rfile2}'" class="ml-4 font-weight-bold" style="margin-top:12px">
												<i class="far fa-file"></i> :  ${c.ofile2}</a></td>
										</c:if>
										<c:if test="${!empty c.ofile3 }">
											<td class="rounded align-bottom" style="width: 33%"><c:set
													var="fileName" value="${fn:split(c.ofile3, '.')}" /> <c:set
													var="fileType" value="${fileName[fn:length(fileName)-1]} " />
												<c:choose>
													<c:when test="${fn:contains(fileType,'jp') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">
													<img class="rounded img-fluid " src="resources/bupfile/${c.rfile3}">
													</c:when>	
													<c:otherwise>
													<img class="rounded img-fluid" src="resources/maincss/img/suugit/file_altimg.svg" >
													</c:otherwise>
												</c:choose>
												<p class="my-2" />
												<a href="javascript:location.href='cfiledown.do?ofile=${c.ofile3}&rfile=${c.rfile3}'" class="ml-4 font-weight-bold" style="margin-top:12px">
												<i class="far fa-file"></i> :  ${c.ofile3}</a></td>
										</c:if>
									</tr>
								
								</table>


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
					<!-- <div class="px-3 py-5 bg-gradient-light text-white"
			style="height: 10px;">
			<input type="text" class="form-control" placeholder="답글을 입력하세요">
		</div> -->
				</div>
</body>
</html>