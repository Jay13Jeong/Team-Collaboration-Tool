<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ empty sessionScope.ucode }">
<c:set var="who" value="Guest"></c:set>
</c:if>
<c:if test="${ !empty sessionScope.ucode }">
<c:set var="who" value="${ sessionScope.ucode }"></c:set>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

 	if("${ who }" == "Guest"){
		location.href='mvlogin.do';
	}else if("${toCalendar}" == "beet"){
		location.href='ftables2.do?ucode=${ who }&pnum=${ pnum }&pjadmin=${toCalendar}'; 
	}else {
		location.href='ftables2.do?ucode=${ who }&pnum=${ pnum }'; 
	}

</script>

</body>
</html>