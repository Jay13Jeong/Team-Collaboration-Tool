<%@ page session="true" %>
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

<!-- 채팅 폼 시작 -->

<div class="card shadow mb-4" style="height:100%;max-height:840px">
            <div class="card-header py-3">
            <c:forEach var="i" items="${pmlist}">
            	<c:if test="${ucode eq i.ucode and i.pjadmin eq '1'}">
            <a class="btn btn-primary d-flex justify-content-center" href="javascript:location.href='${pageContext.servletContext.contextPath}/invtadmin.do'">프로젝트 관리</a>
            	</c:if>
            </c:forEach>
			</div>
            <div class="card-body">
              <!-- 게시글안쪽 -->
              
<!-- 채팅내용 시작 -->
<c:import url="/WEB-INF/views/red/chatting.jsp"></c:import>
<!-- 채팅내용 끝 -->

<!-- 접속자 명단시작 -->
<hr>
<!-- <div style="font-size:50%;color:pink;" onclick="javascript:console.log('꾸쭈')">MEMBER</div>
<i class="fas fa-circle text-success"></i>
suggit
<hr>
<i class="fas fa-circle text-success"></i>
red
<hr>
<i class="fas fa-circle text-dark"></i>
kyukyu
<hr>
<i class="fas fa-circle text-success"></i>
khc
<hr>
<i class="fas fa-circle text-dark"></i>
daun
<hr> -->
<!-- 접속자 명단끝 -->
</div>
</div>
<!-- 채팅 폼 끝 -->

</body>
</html>