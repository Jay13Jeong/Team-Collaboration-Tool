<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	long time = System.currentTimeMillis();
	Date nowTime1 = new Date();
	Date nowTime2 = new Date();
	SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sf2 = new SimpleDateFormat("kk:mm");

	String now = sf1.format(nowTime1).toString() + "T" + sf2.format(nowTime2).toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab3b0466fa883da1d7216010325a5bcc&libraries=services"></script>

<style type="text/css">
#counter:focus {
	outline: none;
}

#counter {
	margin: 0;
}
</style>

</head>

<body>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#contentText').on("propertychange change keyup paste input",
					function() {
						var content = $(this).val();
						$('#counter').val(200 - content.length);

						if (content.length > 200) {
							$(this).val($(this).val().substring(0, 200));
						}
					});

			$("#sample5_address1").on("click", function() {
				if ($(this).val().length == 0) {
					sample5_execDaumPostcode()
				}
			});
		});//document.ready 끝

		function daycheck() {

			var startday = document.spostInsert.beforesstartday.value.replace(
					"T", " ");
			var endday = document.spostInsert.beforesendday.value.replace("T",
					" ");

			var start = new Date(startday);
			var end = new Date(endday);

			if (start > end) {

				$("#placespan").html("끝 날짜가 시작날짜보다 이전일 수 없습니다<br>다시 선택해주세요");
				$("#beforesendday").focus();
				return false;
			} else {
				return true;
			}
		}
	</script>




	<!-- 게시글안쪽 -->
	<form action="sinsert.do" id="spostInsert" name="spostInsert"	method="post" onsubmit="return daycheck();">
	
		<input type="hidden" name="swriter" value="${sessionScope.uname }">
		<input type="hidden" name="sucode" value="${sessionScope.ucode }">
		<input type="hidden" name="spnum" value="${sessionScope.pnum}">

		<input type="hidden" name="sopen" value="y">

		<tr>
			<td colspan="3"><span style="float: left;"><i
					class="fa fa-pen"></i>&nbsp;제 목</span> <input type="text" name="stitle"
				class="form-control" placeholder="일정 제목을 입력하세요" required="required"></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td width="20%"><span style="float: left;"><i
					class="far fa-calendar-alt"></i>&nbsp;시 작 날 짜</span><input
				type="datetime-local" class="form-control" name="beforesstartday"
				id="beforesstartday" required="required" value="<%=now%>"></td>
			<td>&nbsp;</td>
			<td><span style="float: left;"><i
					class="far fa-calendar-alt"></i>&nbsp;끝 날 짜</span><input
				type="datetime-local" class="form-control" name="beforesendday"
				id="beforesendday" required="required" value="<%=now%>"></td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: left;"><span
				style="color: blue;" id="placespan"></span></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><span style="float: left;"><i
					class="fas fa-map-marker-alt"></i>&nbsp;장 소</span> <input type="text"
				id="sample5_address1" placeholder="장소를 입력하세요" class="form-control"
				name="splace"> <input type="button"
				onclick="sample5_execDaumPostcode()" value="주소 검색"
				class="form-control"><br>
				<div id="map2" class="map"
					style="width: 100%; height: 150px; margin-top: 10px; display: none"></div>

				<script
					src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

				<script>
					var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div
					mapOption2 = {
						center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
						level : 4
					// 지도의 확대 레벨
					};

					//지도를 미리 생성
					var map2 = new daum.maps.Map(mapContainer2, mapOption2);
					//주소-좌표 변환 객체를 생성
					var geocoder2 = new daum.maps.services.Geocoder();
					//마커를 미리 생성
					var marker2 = new daum.maps.Marker({
						position : new daum.maps.LatLng(37.537187, 127.005476),
						map : map2
					});

					function sample5_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										var addr2 = data.address; // 최종 주소 변수

										// 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById("sample5_address1").value = addr2;
										// 주소로 상세 정보를 검색
										geocoder2
												.addressSearch(
														data.address,
														function(results,
																status) {
															// 정상적으로 검색이 완료됐으면
															if (status === daum.maps.services.Status.OK) {

																var result2 = results[0]; //첫번째 결과의 값을 활용

																// 해당 주소에 대한 좌표를 받아서
																var coords2 = new daum.maps.LatLng(
																		result2.y,
																		result2.x);
																// 지도를 보여준다.
																mapContainer2.style.display = "block";
																map2.relayout();
																// 지도 중심을 변경한다.
																map2
																		.setCenter(coords2);
																// 마커를 결과값으로 받은 위치로 옮긴다.
																marker2
																		.setPosition(coords2)
															}
														});
									}
								}).open();
					}
				</script></td>
		
		</tr>

		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><span style="float: left;"><i
					class="far fa-keyboard"></i>&nbsp;메 모</span> <span style="float: left;">&nbsp;&nbsp;&nbsp;(
					남은글자수 : <input size="2px;" type="text" readonly value="200"
					name="counter" id="counter" style="border: none;">)
			</span> <textarea name="scontent" id="contentText" cols="30" rows="10"
					class="form-control" onkeypress="onTestChange();"
					style="width: 100%; height: 200px; overflow: auto; resize: none;"></textarea>
			</td>
		</tr>

		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td >
				<!-- <a class="btn btn-success btn-icon-split"	href="javascript: spostInsert.submit();"  style="width: 90%;">
												<span class="text">등록</span> </a> --> <input type="submit"
				class="btn btn-sm btn-info" value=" 등  록 "> <!-- <a href="javascript:spostInsert.reset();"	class="btn btn-danger btn-icon-split" style="width: 90%;">
												<span class="text">취소</span> </a> --> <input type="reset"
				class="btn btn-sm btn-danger" value=" 취  소 ">

			</td>
		</tr>

	</form>

</body>

</html>
