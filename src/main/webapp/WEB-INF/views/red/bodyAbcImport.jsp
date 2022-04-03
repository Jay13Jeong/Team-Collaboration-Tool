<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab3b0466fa883da1d7216010325a5bcc&libraries=services"></script>

	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-user-circle"></i> 
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
					<a class="dropdown-item" href="#">수정</a> <a class="dropdown-item"
						href="#">삭제</a>
				</div>
			</div>
			<!-- 드롭다운 끝 -->
		</div>
		<div class="card-body">
			<!-- 게시글안쪽 -->
			<h6>${post.stitle }</h6>
			<hr>
			<table>
				<tr>
					<td>시 작 날 짜</td><td>끝 날 짜</td>
				</tr>
				<tr>
					<td><fmt:formatDate value="${post.sstartday}" pattern="yyyy-MM-dd HH시 mm분 E요일"/>
					</td>
					<td><fmt:formatDate value="${post.sendday}" pattern="yyyy-MM-dd HH시 mm분 E요일"/></td>
				</tr>
				<c:if test="${ !empty post.splace }">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>장 소</td>
				</tr>
				<tr>
					<td>
					<div id="map1"  style="width:400px; height:200px; margin-top:5px;"></div> <br>
<script>
var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div 
    mapOption1 = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        draggable: false, //지도 이동 금지
        level: 4 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map1 = new kakao.maps.Map(mapContainer1, mapOption1); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder1 = new kakao.maps.services.Geocoder();

var spostplace1 ="${post.splace}";
// 주소로 좌표를 검색합니다
geocoder1.addressSearch(spostplace1, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords1 = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker1 = new kakao.maps.Marker({
            map: map1,
            position: coords1
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow1 = new kakao.maps.InfoWindow({
            content: '<div style="width:130px;text-align:center;padding:6px 0;">일정장소</div>'
        });
        infowindow1.open(map1, marker1); 

        //지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map1.setCenter(coords1);
    } 
});    
</script>
					</td>
				</tr>
				</c:if>
			
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>메  모</td>
				</tr>
				<tr>
					<td>${post.scontent }</td>
				</tr>
		
			</table>


			<hr>
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%;">
					<a href="#" class="btn btn-primary btn-icon-split btn-sm"> 
						<span class="icon text-white-50"> <i class="far fa-heart"></i></span>
						<button onclick="javascript: location.href='#'">
						<span class="text">좋아요</span>
						</button> 
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
			<form action="#" method="post">
			<input type="text" class="form-control" placeholder="답글을 입력하세요">
			</form>
		</div>
	</div>

</body>
