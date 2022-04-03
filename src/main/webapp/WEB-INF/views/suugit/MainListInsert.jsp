<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>

<body>
   <script src="resources/js/cpost.js"></script>
<script type="text/javascript">
function addbcharge0(){
     var name = $(event.target).text();
     var code = $(event.target).val();
       $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
       $('#name0').val(name);
       $('#user0').val(code);
       $("input:checkbox[id='user0']").prop("checked", true);
       $("input:checkbox[id='name0']").prop("checked", true);
       alert($("#user0").val()+" 0번"+ $("#name0").val()); 
}
function addbcharge1(){
   var name = $(event.target).text();
   var code = $(event.target).val();
    $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
    $('#name1').val(name);
    $('#user1').val(code);
    $("input:checkbox[id='user1']").prop("checked", true);
    $("input:checkbox[id='name1']").prop("checked", true);
    alert($("#user1").val()+" 1번"+ $("#name1").val()); 
}
function addbcharge2(){
      var name = $(event.target).text();
      var code = $(event.target).val();
       $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
      $('#name2').val(name);
       $('#user2').val(code);
       $("input:checkbox[id='user2']").prop("checked", true);
       $("input:checkbox[id='name2']").prop("checked", true);
       alert($("#user2").val()+" 2번" + $("#name2").val()); 
}
function addbcharge3(){
      var name = $(event.target).text();
      var code = $(event.target).val();
       $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
      $('#name3').val(name);
       $('#user3').val(code);
       $("input:checkbox[id='user3']").prop("checked", true);
       $("input:checkbox[id='name3']").prop("checked", true);
       alert($("#user3").val()+" 3번"); 
}
function addbcharge4(){
      var name = $(event.target).text();
      var code = $(event.target).val();
       $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
      $('#name4').val(name);
       $('#user4').val(code);
       $("input:checkbox[id='user4']").prop("checked", true);
       $("input:checkbox[id='name4']").prop("checked", true);
       alert($("#user4").val()+" 4번"); 
}
function addbcharge5(){
      var name = $(event.target).text();
      var code = $(event.target).val();
       $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
      $('#name5').val(name);
       $('#user5').val(code);
       $("input:checkbox[id='user5']").prop("checked", true);
       $("input:checkbox[id='name5']").prop("checked", true);
       alert($("#user5").val()+" 5번"); 
}
function addbcharge6(){
      var name = $(event.target).text();
      var code = $(event.target).val();
       $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
       $('#user6').val(code);
       $('#name6').val(name);
       $("input:checkbox[id='user6']").prop("checked", true);
       $("input:checkbox[id='name6']").prop("checked", true);
       alert($("#user6").val()+" 6번"); 
}
function unSelected(){
   $(event.target).parent().remove();
}
var maxSize = 2048;
var SPACE_KB = 1024;
function fileCheck() {
	//input file 태그.
	var file = document.getElementById('fileInput');
	//파일 경로.
	var filePath = file.value;
	//전체경로를 \ 나눔.
	var filePathSplit = filePath.split('\\'); 
	//전체경로를 \로 나눈 길이.
	var filePathLength = filePathSplit.length;
	//마지막 경로를 .으로 나눔.
	var fileNameSplit = filePathSplit[filePathLength-1].split('.');
	//파일명 : .으로 나눈 앞부분
	var fileName = fileNameSplit[0];
	//파일 확장자 : .으로 나눈 뒷부분
	var fileExt = fileNameSplit[1];
	//파일 크기
	var fileSize = (file.files[0].size)/1000;
	  $('#kb').val(fileSize);
      $('#kind').val(fileExt);
	alert("파일경로" + filePath + "확장자" + fileExt);
	console.log('파일 경로 : ' + filePath);
	console.log('파일명 : ' + fileName);
	console.log('파일 확장자 : ' + fileExt);
	console.log('파일 크기kb : ' + fileSize +"KB");
}
////dont touch////////////////////////
///                                ///
$(function() {
jQuery('.kyuMain').click(function () {  
    jQuery('#kyukyuMain').css("display", "block");  
    jQuery('#suugitsuugitMain').css("display", "none");
    jQuery('#abcabcMain').css("display", "none");
});
jQuery('.abcMain').click(function () {  
	console.log("sdsd");
    jQuery('#kyukyuMain').css("display", "none");  
    jQuery('#suugitsuugitMain').css("display", "none");
    jQuery('#abcabcMain').css("display", "block");  
});
jQuery('.suugitMain').click(function () {  
	jQuery('#kyukyuMain').css("display", "none");  
    jQuery('#suugitsuugitMain').css("display", "block");
    jQuery('#abcabcMain').css("display", "none"); 
});
});//$function
///                                ///
////dont touch////////////////////////
  $("input[type='file']").on('change',function(e){
	   alert('hhr');
		var fileArea = $('#InsertTable [id=preview]');
   //div 내용 비워주기
	//var fileArea = $('#InsertTable [id=preview]');
	fileArea.empty();
	
   var files = e.target.files;
   var arr =Array.prototype.slice.call(files);

   preview(fileArea, arr);
   
 });
</script>
<!-- CPOST start -->
<div class="card shadow mb-4" style="display:block;" id="suugitsuugitMain">
            <div class="card-header py-3">
            </div>
               <div class="card-body">
              <!-- 게시글안쪽 -->
              <div class="clearfix d-flex ">
              	</div><table id="InsertTable" style="text-align:center;width:100%;">
              <tbody>
              
  <tr class="m-0 font-weight-bold text-primary"><td style="width:20%;">
              </td><td style="width:20%;">
              </td><td style="width:20%;">
              </td><td style="width:20%;">
              </td><td style="width:20%;">
              </td></tr>
<!-- @@@@시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- @@@  -->                                                                                                        <!-- @@@  -->
			  <tr class="m-0 font-weight-bold text-primary"><td style="width:100%;" colspan="5"><table style="width:100%;">
			  <tr class="m-0 font-weight-bold text-primary" style="width:100%;">
			  <td style="width:33%;height:100%;" class="suugitMain hovercheck">          
              <span>글작성</span>
              </td><td style="width:33%;height:100%;" class="kyuMain hovercheck">
              <span>업무</span>
              </td><td style="width:33%;height:100%;" class="abcMain hovercheck">
              <span>일정</span>
              </td></tr>
              </table></td></tr>
<!-- @@@  -->                                                                                                        <!-- @@@  -->
<!-- @@@@끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->              

              
              <!-- 구분선 -->
              <tr><td colspan="5">
              <hr>
              </td></tr>
              <!-- 글작성 본문 -->
<!-- 글작성 본문 -->
              <form action="incp.do" id="InsertCpost" method="post" enctype="multipart/form-data">
             
              <tr><td colspan="5"> <input name="ctitle" type="text" class="form-control mb-1" placeholder="제목" required></td></tr>
              <tr><td colspan="5"><textarea id="ccontent" name="ccontent" rows="6" class="w-100 form-control "  placeholder="내용을 입력해주세요"  required></textarea></td></tr>
              <tr id="preview"></tr>
              <tr id="file_list">
       				<input type="hidden" name="cwriter" value="${sessionScope.uname }">
       				<input type="hidden" name="cucode" value="${sessionScope.ucode }">
       				<input type="hidden" name="cpnum" value="${sessionScope.pnum}">
       				
              	<td>
              		<img src="" />
              		<a class="del_img" style="position:relative;bottom:80%;left:20%"><i class="fa fa-times-circle"></i></a>
              		</div>
              		</div>
              	</td>
              	<td>
              		<div class="select_img rounded float-left">
              		<a class="del_img" style="position:relative;bottom:80%;left:20%"><i class="fa fa-times-circle"></i></a>
              		</div>
              	</td>
              	<td>
              		<div class="select_img rounded float-left">
              		<img src="" />
              		<a class="del_img" style="position:relative;bottom:80%;left:20%"><i class="fa fa-times-circle"></i></a>
              		</div>
              	</td>
              	<td>
              	<div class="imgs_wrap">
              		<img id="img" />
               	</div>
              	</td>
              
              </tr>
              <tr>
              <!-- 옵션메뉴 --> 
              	<div class="clearfix d-flex ">
              	<td colspan="2" class="flex-grow-5 ">
              		<label class="btn btn-light small" onclick="fileUpload" >
              			 <input type="file" name="file" id="file" style="display:none" multiple>
              			<i class="fa fa-link ">&nbsp;파일</i>
              		</label>
              		 <label class="btn btn-light small">
              			<input type="file" name="ofile" style="display:none" id="atchm_img" accept=".jpg,.png,.svg" multiple>
              			<i class="fa fa fa-image ">&nbsp;사진</i>
              		</label> 
              		<label class="btn btn-light small testfile" >
              			<input type="file" name="hashtag" style="display:none">
              			<i class="fa fa-hashtag ">&nbsp;</i>
              		</label>
              		<label class="btn btn-light small" >
              			<input type="file" name="mention" style="display:none">
              			<i class="fa fa-at">&nbsp;</i>
              		</label>
              	</td>
              	<td></td>
              	<td>
              	<select name="copen" class="form-control form-control-small selectpicker">
  					<option value="Y" selected>전체공개</option>
  					<option value="N">비공개</option>
				</select>
				
              	</td>
				</form>
		
              	 <!-- 버튼 -->
              	 <td colspan="2" style="width:5%"> 
             	 	<button type="submit" id="btn-save" class="btn btn-success p-1" form="InsertCpost">등록</button>
             		<button type="reset" class="btn btn-danger p-1" style="width:40%;float:right;">
                    <span class="text">취소</span>
             		</button>
              	</td>
              </tr>
	<tr>
			<td> 		
			
			</td>
			</tr> 
             <!-- 본문! -->
              </tbody></table>
            </div>
          </div>
             <script src="resources/js/jquery-3.5.1.min.js"></script>
          <script src="resources/js/cpost.js"></script>
   <script>
   $("input[type='file']").on('change',function(e){
	   alert('hhr');
		var fileArea = $('#InsertTable [id=preview]');
   //div 내용 비워주기
	//var fileArea = $('#InsertTable [id=preview]');
	fileArea.empty();
	
   var files = e.target.files;
   var arr =Array.prototype.slice.call(files);

   preview(fileArea, arr);
   
 });
   </script>
<!-- CPOST end &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->

<!-- BPOST start -->
               <div class="card shadow mb-4" style="display:none;" id="kyukyuMain">
<!-- @@@@시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->               
<!-- @@@  -->      <div class="card-header py-3"></div>                                                              <!-- @@@  -->
<!-- @@@@끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                  <div class="card-body">
                     <!-- 게시글안쪽 -->
                  <form action="insertbpostMain.do" name="b" method="post" id="bInsert" enctype="multipart/form-data">
                     <input type="hidden" name="bucode" value="${sessionScope.ucode }">
                     <input type="hidden" name="bwriter" value="${sessionScope.uname }">
                     <input type="hidden" name="bpnum" value="${sessionScope.pnum }">
                     <!-- filebox -->
                     <input type="hidden" name="kb" id="kb">
                     <input type="hidden" name="kind" id="kind">
                     <input type="hidden" name="pnum" value="${sessionScope.pnum }">
                        <table style="text-align: center; width: 100%;">
<!-- @@@@시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- @@@  -->                                                                                                        <!-- @@@  -->
			  <tr><td style="width:100%;" colspan="5"><table style="width:100%;">
			  <tr class="m-0 font-weight-bold text-primary" style="width:100%;">
			  <td style="width:33%;height:100%;" class="suugitMain hovercheck">          
              <span>글작성</span>
              </td><td style="width:33%;height:100%;" class="kyuMain hovercheck">
              <span>업무</span>
              </td><td style="width:33%;height:100%;" class="abcMain hovercheck">
              <span>일정</span>
              </td></tr>
              <tr><td colspan="5">
              <hr>
              </td></tr></table></td></tr>
<!-- @@@  -->                                                                                                        <!-- @@@  -->
<!-- @@@@끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->  
                           <tr>
                              <td colspan="5">
                              <div class="btn-group btn-group-toggle" data-toggle="buttons" style="width:100%;">
                                <label class="btn btn-secondary active">
                                  <input type="radio" name="bkind" id="option1" value="요청" checked>요청
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option2" value="진행">진행
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="피드백" >피드백
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="완료">완료
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="보류">보류
                                </label>
                              </div>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="5">&nbsp;</td>
                           </tr>
                           <tr>
                              <td colspan="5"><span style="float: left;"><i class="fa fa-pen"></i>&nbsp;제 목</span>                                 
                              <input type="text" name="btitle" class="form-control" placeholder="업무 제목을 입력하세요" required="required"></td>
                           </tr>
                           <tr>
                              <td colspan="5">&nbsp;</td>
                           </tr>
                           <tr>
                           <td colspan="5">
                           <div>   
                        <nav class="navbar navbar-expand navbar-light bg-light mb-4">
                    <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      담당자
                    </button>
                    
<!-- @@@@시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->               
<!-- @@@  -->
<% if(request.getParameter("choicethat") != null){ %>
	<b style="color:red;position:relative;z-index:10;">&nbsp;&nbsp; 담당자 지정은 필수 입니다.</b>
<% } %>			                   
<!-- @@@  -->                                                                                                       <!-- @@@  -->
<!-- @@@@끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                      <div><input type="hidden" id="selected"></div>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2" >
                     <c:forEach var="pm" items="${sessionScope.pmlist}" varStatus="status">
                     <button class="dropdown-item" type="button" onclick="addbcharge${status.index}();" value="${pm.ucode }">${pm.uname }</button>
                     <input type="checkbox" id="user${status.index }" name="bcharge" style="display:none" >
                     <input type="checkbox" id="name${status.index }" name="bchargename" style="display:none">
                     </c:forEach>
                    </div>
                  </div>
                        <a class="navbar-brand" href="#"></a>
                    <ul class="navbar-nav ml-auto">
                      <li class="nav-item dropdown">
                      </li>
                    </ul>
                  </nav>
                </div>
                     </td>
                     </tr>      
                           <tr>
                              <td width="20%"><span style="float: left;"><i class="far fa-calendar-alt"></i>&nbsp;시 작 날 짜</span>
                              <input type="date" class="form-control" name="bstartday" id="beforesstartday" required></td>
                              <td width="20%"><span style="float: left;"><i class="far fa-calendar-alt"></i>&nbsp;끝 날 짜</span>
                              <input type="date" class="form-control" name="bendday" id="beforesendday" required></td>
                              <td colspan="3"></td>
                           </tr>
                           <tr>
                              <td colspan="3" style="text-align: left;"><span style="color: blue;" id="placespan"></span></td>
                              <td colspan="2">&nbsp;</td>
                           </tr>
                           <tr>
                              <td colspan="5"><span style="float: left;"><i class="far fa-keyboard"></i>&nbsp;글쓰기</span>
                              <textarea cols="50" rows="6" class="w-100 form-control" name="bcontent"></textarea>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="5">&nbsp;</td>
                           </tr>
                           <tr>
                              <td><input type="file" name="ofile" id="fileInput" onchange='fileCheck()'></td>
                              <!--  #f8f9fc   -->
                              <td>
                              <select name="bopen" class="form-control" style="display:none">
                                 <option value="y" selected>전체공개</option>
                                 <option value="n">나만보기</option>
                              </select>
                              </td>
                              <td colspan="3">
                                    <input type="submit" class="btn btn-sm btn-info" value=" 등  록 ">
                                    <input type="reset" class="btn btn-sm btn-danger" value=" 취  소 ">
                              </td>
                           </tr>
                        </table>
                     </form>
                  </div>
               </div>
<!-- kyu끝 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->

<!-- abc start -->
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
<div class="card shadow mb-4" style="display:none;" id="abcabcMain">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
              <!-- 게시글안쪽 -->
        <form action="sinsertMain.do" id="spostInsert" name="spostInsert"	method="post" onsubmit="return daycheck();">
        <input type="hidden" name="swriter" value="${sessionScope.uname }">
		<input type="hidden" name="sucode" value="${sessionScope.ucode }">
		<input type="hidden" name="spnum" value="${sessionScope.pnum}">

		<input type="hidden" name="sopen" value="y">
              <table style="text-align:center;width:100%;">
              <tbody>
<!-- @@@@시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- @@@  -->                                                                                                        <!-- @@@  -->
			  <tr><td style="width:100%;" colspan="5"><table style="width:100%;">
			  <tr class="m-0 font-weight-bold text-primary" style="width:100%;">
			  <td style="width:33%;height:100%;" class="suugitMain hovercheck">          
              <span>글작성</span>
              </td><td style="width:33%;height:100%;" class="kyuMain hovercheck">
              <span>업무</span>
              </td><td style="width:33%;height:100%;" class="abcMain hovercheck">
              <span>일정</span>
              </td></tr>
              <tr><td colspan="5">
              <hr>
              </td></tr></table></td></tr>
<!-- @@@  -->                                                                                                        <!-- @@@  -->
<!-- @@@@끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
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
              </tbody></table>
              </form>
  </div>
</div>
<!-- abc end -->
</body>

