<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><!-- 글작성 본문 -->
             <form action="incp.do" id="InsertCpost" method="post" enctype="multipart/form-data">
             
              <tr><td colspan="5"> <input name="ctitle" type="text" class="form-control mb-1" placeholder="제목"></td></tr>
              <tr><td colspan="5"><textarea id="ccontent" name="ccontent" rows="6" class="w-100 form-control "></textarea></td></tr>
              <tr id="preview"></tr>
              <tr id="file_list">
       				<input type="hidden" name="cwriter" value="${sessionScope.uname }">
       				<input type="hidden" name="cucode" value="${sessionScope.ucode }">
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
              		<label class="btn btn-light small" >
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
			
		
   <script src="resources/js/jquery-3.5.1.min.js"></script>
   <script src="resources/js/cpost.js"></script>
   
   
</body>
</html>