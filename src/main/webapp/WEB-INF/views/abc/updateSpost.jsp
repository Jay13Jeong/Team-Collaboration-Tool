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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

function spostupdate(){
		var param = $("#uspostform").serialize();
		$.ajax({
			url: "supdate.do",
			data: param,
			/* data: { sno: $("#sno").val(), stitle:$("#stitle").val(), beforesstartday:$("#beforesstartday").val(), beforesendday: $("#beforesendday").val(), 
					 splace:$("#splace").val(), salarm:$("#salarm").val, scontent: $("#scontent").val() },	 */
			type: "post", 
			success: function(Data){	// 받는다고 했으니까 매개변수 있어야함
				// json 한개를 받았을 때는 바로 출력 처리할 수 있음
				if(Data != null){
					alert("수정에 성공하였습니다");
				}else{
					alert("수정에 실패하였습니다");
				}	
				/* $("#d2").html("번호 : "+jsonData.no+"<br>제목 : "+jsonData.title+"<br>작성자 : "+decodeURIComponent(jsonData.writer)+
						"<br>내용 : "+decodeURIComponent(jsonData.content.replace(/\+/gi," "))+"<br><br>");
				 */
			},
			error: function(request, status, errorData){ //에러는 위에서 복붙
				console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
			}
		}); //ajax
}; 

function spostdelete(){
	$.ajax({
		url: "sdelete.do",
		data: { sno: $("#sno").val() },
		/* data: { sno: $("#sno").val(), stitle:$("#stitle").val(), beforesstartday:$("#beforesstartday").val(), beforesendday: $("#beforesendday").val(), 
				 splace:$("#splace").val(), salarm:$("#salarm").val, scontent: $("#scontent").val() },	 */
		type: "post", 
		success: function(Data){	// 받는다고 했으니까 매개변수 있어야함
			// json 한개를 받았을 때는 바로 출력 처리할 수 있음
			if(Data != null){
				alert("삭제에 성공하였습니다");
			}else{
				alert("삭제에 실패하였습니다");
			}	
			/* $("#d2").html("번호 : "+jsonData.no+"<br>제목 : "+jsonData.title+"<br>작성자 : "+decodeURIComponent(jsonData.writer)+
					"<br>내용 : "+decodeURIComponent(jsonData.content.replace(/\+/gi," "))+"<br><br>");
			 */
		},
		error: function(request, status, errorData){ //에러는 위에서 복붙
			console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
		}
	}); //ajax
}; 

	
$(function(){	
	$('#scontent').on("propertychange change keyup paste input", function() {
		var content = $(this).val();
		$('#counter').val(200 - content.length);

		if (content.length > 200) {
			$(this).val(
					$(this).val().substring(0, 200));
		}
	});

	$("#sample5_address3").on("click", function(){
	if($(this).val().length == 0 ){
		sample5_execDaumPostcode2()
	}
});		
	var content = $('#scontent').val();
	$('#counter').val(215-content.length);
	
	var str = $('#scontent').val();

	str = str.split('<br>').join("\r\n");

	$('#scontent').val(str);
	

	
});    //document.ready 끝


	function daycheck() {

		var startday = document.uspostform.beforesstartday.value.replace("T", " ");
		var endday = document.uspostform.beforesendday.value.replace("T", " ");

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

	<form name="uspostform" id="uspostform" method="post" onsubmit="return daycheck();">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		
		
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-user-circle"></i> 
				수정용 ! <br>
				<input type="hidden" id="sno" name=sno value="${post.sno }">
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
					<button class="dropdown-item"  id="uspost" type="submit" onclick="spostupdate(); return false;">수정하기</button> 
					<button class="dropdown-item"  id="dspost" type="submit" onclick="spostdelete(); return false;">삭제하기</button>
				</div>

			</div>
			<!-- 드롭다운 끝 -->

		</div>
		<div class="card-body">
			<!-- 게시글안쪽 -->
			<c><input type="text" id="stitle" name="stitle" class="form-control" value="${post.stitle }"></c>
			<hr>
			<table>
				<tr>
					<td>시 작 날 짜</td><td>끝 날 짜</td>
				</tr>
				<tr>
					<td width="20%">
					<input type="datetime-local" class="form-control" name="beforesstartday" id="beforesstartday" 
					required="required"  value="${requestScope.startday }"	></td>

					<td width="20%">
					<input type="datetime-local" class="form-control" name="beforesendday"  id="beforesendday" 
					required="required"  value="${endday }"	></td>
					<td><span style="color: blue;" id="placespan"></span></td>
				</tr>
			
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>장 소</td>
				</tr>
				<tr>
					<td colspan="2">
					<c:if test="${ empty post.splace }">
					장 소 미 정 <br>
					</c:if>	
					<c:if test="${ !empty post.splace }">
					${post.splace } <br>
					</c:if>
						<input type="text" id="sample_address3" placeholder="장소를 입력하세요" class="form-control" id ="splace" name="splace"  value="${spost.splace }">
						<input type="button" onclick="sample5_execDaumPostcode2();" value="장소검색"  class="form-control"><br>
						<div id="map3"  class="map" style="width:100%;height:150px;margin-top:10px;display:none"></div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var mapContainer3 = document.getElementById('map3'), // 지도를 표시할 div
        mapOption3 = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };

    
    //지도를 미리 생성
    var map3 = new daum.maps.Map(mapContainer3, mapOption3);
    //주소-좌표 변환 객체를 생성
    var geocoder3 = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker3 = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map3
    });


    function sample5_execDaumPostcode2() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr3 = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample_address3").value = addr3;
                // 주소로 상세 정보를 검색
                geocoder3.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result3 = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords3 = new daum.maps.LatLng(result3.y, result3.x);
                        // 지도를 보여준다.
                        mapContainer3.style.display = "block";
                        map3.relayout();
                        // 지도 중심을 변경한다.
                        map3.setCenter(coords3);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker3.setPosition(coords3)
                    }
                });
            }
        }).open();
    }
</script>
					
					</td>
				</tr>		
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>메  모</td>
				</tr>
				<tr>
				<td colspan="5"><span style="float: left;"><i class="far fa-keyboard"></i>&nbsp;메 모</span>
										<span style="float: left;">&nbsp;&nbsp;&nbsp;( 남은글자수 : <input size="2px;"  type="text"
												readonly value="200" name="counter" id="counter"
												style="border: none;">)</span>
<textarea name="scontent" id="scontent" cols="30" rows="10"	class="form-control"	 style="width: 100%; height: 100px; overflow: auto; resize: none;">${post.scontent }</textarea> </td>
									</tr>
		
			</table>



		</div>
</form>
	
	
</body>
</html>