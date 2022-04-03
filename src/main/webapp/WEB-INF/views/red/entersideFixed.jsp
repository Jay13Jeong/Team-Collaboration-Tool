<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
<!-- 스나이퍼 재료 시작 -->
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 6px;
  margin: 1px 1px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button3 {
  background-color: white; 
  color: #C37181; 
  border-radius:50%;
}

.button3:hover {
  background-color: #C37181;
  color: white;
}

</style>
<!-- 스나이퍼 재료 끝 -->
<script type="text/javascript" src="/hwabo/resources/js/jquery-3.5.1.min.js"></script>
<script>

$(function(){
	$.ajax({
		url: "starList.do?ucode=${ who }",
		type: "POST",
		dataType: "json", 
		success: function(json){
			
			var jsonStr = JSON.stringify(json);
			var json = JSON.parse(jsonStr);
			console.log("success : " + jsonStr);
			
			var values = "";
			for(var i in json.list5){
				var starName = decodeURIComponent(json.list5[i].name).replace(/\+/gi, " ");
				var starUcode = decodeURIComponent(json.list5[i].ucode).replace(/\+/gi, " ");
				var starStar = decodeURIComponent(json.list5[i].star).replace(/\+/gi, " ");
				values += 
					"<li class=\"nav-item\"><a class=\"nav-link\">" +
		            "<i class=\"fas fa-fw fa-chart-area\" onclick=\"javascript:location.href=\'ftables.do?project_num="+starStar+"\'\"></i><span onclick=\"javascript:location.href=\'ftables.do?project_num="+starStar+"\'\">" +
					starName +
					"</span><span>" +
					"&nbsp;&nbsp;<button class=\"button button3\" " +
					"onclick=\"javascript:location.href=\'delStar.do?ucode=" + starUcode + "&star=" + starStar + "\'\" >X</button>" +
					"</span></a></li>";
			}
			//$("stars").html() + 
			$("#stars").html(values); 		
		},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " +jqXHR+", "+textstatus+", "+errorthrown);
		}
	});//ajax
	
});

</script>

</head>
<body>
<div style="position:fixed;height:100%;">

<table style="width:1300px;height:100%;">
<tr>
<td style="width:17%;">

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="width:1300px;height:100%;">

<br><br><br>

      <!-- 화보 이미지 -->
	  <c:if test="${sessionScope.ucode == null and sessionScope.pnum == null }">
      <img src="resources/maincss/img/hwaboLogo.png" style="width: 100%; max-width: 780px; vertical-align: middle" onclick="javascript:location.href='/hwabo/'">
      </c:if>
      <c:if test="${sessionScope.ucode != null and sessionScope.pnum == null }">
      <img src="resources/maincss/img/hwaboLogo.png" style="width: 100%; max-width: 780px; vertical-align: middle" onclick="javascript:location.href='cards2.do?ucode=${sessionScope.ucode }'">
      </c:if>
      <c:if test="${sessionScope.ucode != null and sessionScope.pnum != null }">
      <img src="resources/maincss/img/hwaboLogo.png" style="width: 100%; max-width: 780px; vertical-align: middle" onclick="javascript:location.href='ftables.do?project_num=${sessionScope.pnum }'">
      </c:if>
	
<!-- 왼쪽사이드바 시작 -->
      <!-- Divider -->
      <br>
     <hr class="sidebar-divider my-0">
     
     <div class="sidebar-heading">
     <br>
     <span style = "font-size:1.5em;">
   즐겨 찾기
</span>
     
      </div><br>
	<hr class="sidebar-divider my-0">
      <!-- Nav Item - Pages Collapse Menu -->
     <li class="nav-item" id="stars">

      </li>
     
     <hr class="sidebar-divider my-0">
<!-- 왼쪽사이드바 끝 -->

</ul>
    
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

<c:import url="/WEB-INF/views/red/enterSideRight.jsp"></c:import>

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
