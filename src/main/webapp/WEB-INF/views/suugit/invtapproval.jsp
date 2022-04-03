
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<!DOCTYPE html>
<html lang="kr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HWABO</title>

<!-- Custom fonts for this template-->

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/hwabo/resources/maincss/css/sb-admin-2.css"
	rel="stylesheet">
<style>
.modal-backdrop {
	z-index: -1;
}

.thumbnail {
	background-color: gray;
	margin: 10px;
	width: 50px;
	height: 50px;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.thumbnail.round {
	border-radius: 10%;
}

.thumbnail.circle {
	border-radius: 100%;
}

#selected span {
	background-color: rgba(66, 182, 187, 0.5);
	padding: 0px 5px;
	margin: 0px 3px;
}
</style>
</head>

<body>
                  <div class="mr-3">
                  
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-paper-plane text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                   	[프로젝트]초대장이 도착했습니다! 
                   	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPush">Launch modal</button>
                  </div>
        
		<div class="row justify-content-center">
			<!-- 버튼 -->
		
		</div>

	<!-- --------------------------------------------------------------------------- -->


	<!-- --------------------------------------------------------------------------- -->

	<!--Modal 초대폼-->

<!--Modal: modalPush-->
<div class="modal fade" id="modalPush" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading">Be always up to date</p>
      </div>

      <!--Body-->
      <div class="modal-body">

        <i class="fas fa-bell fa-4x animated rotateIn mb-4"></i>

        <p>Do you want to receive the push notification about the newest posts?</p>

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center">
        <a href="https://mdbootstrap.com/pricing/jquery/pro/" class="btn btn-info">Yes</a>
        <a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No</a>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: modalPush-->
<script src="resources/js/jquery-3.5.1.min.js"></script>

<script>
	function callFunction() {
			$('.new_tr').first().clone().appendTo('#inviteTable');
			$('.newe').last().val('');
			$('#inviteTable').find('td:last').append('<i class="fa fa-times-circle mt-2" onclick="removetr()"></i>');
		}

	function removetr() {
			$(event.target).closest('tr').remove();
			
		
		}
	
 	$(document).ready(function(){
		  $('#myInput').on('keyup', function() {
		    var value = $(this).val().toLowerCase();
		    $('#myTable tr').filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
		    });
		  });
		}); 
	
	function addInvite(){
		var ele = $(event.target);
		if(ele.val() ==  '초대하기'){
			$(event.target).val("초대완료");
			$(event.target).addClass('disable btn-outline-dark');
			var name = $(event.target).parent().parent().children().eq(1).text();
			$('#selected').append('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i> </span>');
			
			var fileData = name;

			 $.ajax({
			url : "invtnew.do",
			type : "post",
			data : JSON.stringify(fileData),
			dataType : "JSON",
			contentType : "application/json; charset=utf-8;",
			success : function(data) {
				alert(data.message);

			},
			error : function(request, status, errorData) {
				alert(message);
			}
		});
			
		
		}
	}
	
	function unSelected(){
		$(event.target).parent().remove();
	}
	
	$('#invtBtn').on('click',function(){
		var n = $('input[name=newinvt]').length;
		var fileData = new Array(n);
		for(var i=0;i<n;i++){
			fileData[i] = $('input[name=newinvt]')[i].value;

		}
		
		$.ajax({
			url:"invtexist.do",
			type:"post",
			data:JSON.stringify(fileData),
			dataType:"json",
			contentType:"application/json; charset=utf-8;",
			success: function(data){
				alert("전송성공!")
			},
			error: function(request, status, errorData){
				alert('b');
			}
		});
		
	});
	
	$('#invtEBtn').on('click',function(){
		
		 $.ajax({
			url:"invtee.do",
			type:"post",
			contentType:"application/json; charset=utf-8;",
			dataType:"Json",
			success: function(data){
				var values = $("#nmlistBox").html();
				
				var values = $("#nmlistBox").html("");
				for(var i in data){
					values += 
					'<tr style="width:80px height: 80px">'
					+ '<td colspan="2" class="thumbnail circle"'
					+ 'style="background-image: url(\'' + data[i].uimg + '\')"></td>'
					+ '<td class="my-6">' + data[i].uname + '</td>'
					+ '<td>' + data[i].ugroup + '</td>'
					+ '<td>' + data[i].urole + '</td>'
					+ '<td><input type="button"'
					+ 'class="btn btn-sm btn-outline-primary" value="초대하기"'
					+ 'onclick="addInvite()"></td></tr>'
				}
				
				$('#nmlistBox').html(values);
			},
			error: function(request, status, errorData){
			}
		}); 
	});
	
	
	
	</script>
</body>

</html>

