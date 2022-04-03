<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<body>
<c:if test="${ main.firstword eq 's' }">
<c:set var="post" value="${ main }"></c:set>
<button id="changeupdate" onclick="javascript: changeform1();">수 &nbsp;정</button>
<button id="changeselect" onclick="javascript: changeform2();">수 정 취 소</button>

<div id="spostview"><c:import url="/WEB-INF/views/red/bodyAbcImport.jsp"></c:import></div>
<div id="spostupdate"><c:import url="/WEB-INF/views/abc/updateSpost.jsp"></c:import></div>

<script type="text/javascript">
	$(function(){
		$("#spostupdate").css("display", "none" );
		$("#changeselect").css("display", "none" );
	});	//document.ready;
	function changeform1(){
		$("#spostview").css("display", "none" );
		$("#spostupdate").css("display", "block" );
		$("#changeupdate").css("display", "none" );
		$("#changeselect").css("display", "block" );
	};
	function changeform2(){
		$("#spostview").css("display", "block" );
		$("#spostupdate").css("display", "none" );
		$("#changeupdate").css("display", "block" );
		$("#changeselect").css("display", "none" );
	};
</script>
</c:if>
</body>
