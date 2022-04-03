<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card-body">
			<!-- 게시글안쪽 -->
			<form id="updatecPost" method="post" enctype="multipart/form-data">
			<h6><input name="ctitle" type="text" class="form-control mb-1" value="${c.ctitle}" required></h6>
			<input type="hidden" name="cno" value="${c.cno }">
			<input type="text" id="cflist" value="">
			<hr>
			<table class="w-100" id="CpostUpTable">
				<tr class="mb-1">
					<td colspan="3">
					<textarea id="ccontent" name="ccontent" rows="6" class="w-100 form-control" required>${c.ccontent }</textarea>
					</td>
				</tr>
				<br>
				<tr id="preview">
				<c:if test="${!empty c.ofile1 }">
					<td class="rounded" style="width:33%">
					<input type="hidden" name="rfile1" value="${c.rfile1}">
					<input type="hidden" name="ofile1" value="${c.ofile1}">
					<c:set var="fileName" value="${fn:split(c.ofile1, '.')}" />
					<c:set var="fileType" value="${fileName[fn:length(fileName)-1]} "/>
						<c:if test="${fn:contains(fileType,'jpg') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">	
								<img src="resources/bupfile/${c.rfile1}" style="max-width:150px">
						</c:if>
						<c:if test="${not fn:contains(fileType,'jpg') && not fn:contains(fileType,'png') && not fn:contains(fileType,'svg') && not fn:contains(fileType,'gif')}">	
								<img src="resources/maincss/img/suugit/file_altimg.svg" style="max-width:150px">
							</c:if>
							<br>
					<label class="ml-4 text-center">${c.ofile1} </label>
					<i class="border btn-danger fa fa-times mt-2 p-1" onclick="removefile()"> 삭제</i>
				
					</td>
				</c:if>
				<c:if test="${!empty c.ofile2 }">
					<td class="rounded" style="width:33%">
					<input type="hidden" name="rfile2" value="${c.rfile2}">
					<input type="hidden" name="ofile2" value="${c.ofile2}">
					<c:set var="fileName" value="${fn:split(c.ofile2, '.')}" />
					<c:set var="fileType" value="${fileName[fn:length(fileName)-1]} "/>
						<c:if test="${fn:contains(fileType,'jpg') || fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">	
								<img src="resources/bupfile/${c.rfile2}" style="max-width:150px">
						</c:if>
						<c:if test="${not fn:contains(fileType,'jpg') && not fn:contains(fileType,'png') && not fn:contains(fileType,'svg') && not fn:contains(fileType,'gif')}">	
								<img src="resources/maincss/img/suugit/file_altimg.svg" style="max-width:150px">
							</c:if>
							<br>
					<label class="ml-4 text-center">${c.ofile2} </label>
					<i class="border btn-danger fa fa-times mt-2 p-1" onclick="removefile()"> 삭제</i>
				
					</td>
				</c:if>
				<c:if test="${!empty c.ofile3 }">
					<td class="rounded" style="width:33%">
					<input type="hidden" name="rfile3" value="${c.rfile3}">
					<input type="hidden" name="ofile3" value="${c.ofile3}">
					<c:set var="fileName" value="${fn:split(c.ofile3, '.')}" />
					<c:set var="fileType" value="${fileName[fn:length(fileName)-1]} "/>
						<c:if test="${fn:contains(fileType,'jpg') ||  fn:contains(fileType,'png') || fn:contains(fileType,'svg') || fn:contains(fileType,'gif')}">	
								<img src="resources/bupfile/${c.rfile3}" style="max-width:150px">
						</c:if>
						<c:if test="${not fn:contains(fileType,'jpg') && not fn:contains(fileType,'png') && not fn:contains(fileType,'svg') && not fn:contains(fileType,'gif')}">	
								<img src="resources/maincss/img/suugit/file_altimg.svg" style="max-width:150px">
							</c:if>
							<br>
					<label class="ml-4 text-center">${c.ofile3} </label>
					<i class="border btn-danger fa fa-times mt-2 p-1" onclick="removefile()"> 삭제</i>
				
					</td>
				</c:if>
				</tr>
				<tr id="preview1">
				</tr>
				<tr>
				<td colspan="1">
				<label class="btn btn-light small" >
              			 <input type="file" name="file" id="file" style="display:none" multiple>
              			<i class="fa fa-link ">&nbsp;파일</i>
              		</label>
              		 <label class="btn btn-light small">
              			<input type="file" name="file" style="display:none" id="atchm_img" accept=".jpg,.png,.svg" multiple>
              			<i class="fa fa fa-image ">&nbsp;사진</i>
              		</label> 
              		<label class="btn btn-light small testfile" >
              			<input type="file" name="hashtag" style="display:none">
              			<i class="fa fa-hashtag ">&nbsp;</i>
              		</label>
              		
				</td>
				 <td colspan="2"> 
             		<button type="reset" class="btn btn-danger p-1" style="width:40%;float:right;">
                    <span class="text">취소</span>
             		</button>
             	 	<button id="btn1-save" class="btn btn-success p-1 mr-2" style="width:40%;float:right;">등록</button>
              	</td>
				</tr>				
			</table>
			</form>
				

			<hr>
			<!-- 좋아요 테이블?? -->
		</div>
	<script src="resources/js/jquery-3.5.1.min.js"></script>
   <script type="text/javascript"	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <!--  <script src="resources/js/cpost.js"></script> -->
  <script>
  var tmplist = "";
  
  $('#updatecPost').find("input[type='file']").on('change',function(e){
		var fileArea = $('#CpostUpTable [id=preview]');
		//alert(fileArea.cells.length());
		//fileArea.empty();
		if(fileArea.children('td').length >= 3){
			alert('첨부파일은 최대 3개까지 가능합니다');
			return false;
		}
		tmplist = Array.prototype.slice.call(fileArea.children('td'));
		
		var files = e.target.files;
		var arr = Array.prototype.slice.call(files);

		preview(fileArea, arr);

		tmplist.push(arr);
		
		});
  
$('#btn1-save').on('click',function(event){
	event.preventDefault();
	event.stopPropagation();
	
	var formData = new FormData($('#updatecPost')[0]);
	formData.append("cflist", tmplist);
	alert(formData.cflist);
	$.ajax({
		url: "upcp.do",
		type: "post",
		enctype: 'multipart/form-data',
		data: formData,
		contentType:false,
		processData:false,
		dataType:"json",
		success: function(result){
			console.log(result);
			   $("#cpView").hide();
			   $("#cpEdit").show();
		},
	}); 
	
});

  </script>
</body>
</html>