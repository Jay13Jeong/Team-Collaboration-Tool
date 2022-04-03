
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
	<!-- 	<div class="container mt-5">
		<div class="row justify-content-center">
			버튼
			<div class="text-center">
				<a href="" class="btn my-3" data-toggle="modal"
					data-target="#inviteModal"> <i class="fa fa-plus-square mr-1"></i>
					프로젝트 초대하기
				</a>
			</div>

		</div>
	</div> -->
	<!-- --------------------------------------------------------------------------- -->


	<!-- --------------------------------------------------------------------------- -->

	<!--Modal 초대폼-->
	<div class="modal fade" id="inviteModal" tabindex="-1" role="dialog"
		aria-labelledby="inviteModalLabel" aria-hidden="true">
		<div class="modal-dialog cascading-modal" role="document">
			<div class="modal-content">

				<!--모달 메뉴-->

				<div class="card-header">
					<ul class="nav nav-tabs md-tabs tabs-2 card-header-tabs"
						role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#newE" role="tab"
							aria-controls="gnrlwrite" aria-selected="true"> <i
								class="fas fa-user mr-1"></i> 이메일로 초대하기
						</a></li>

						<li class="nav-item" id="invtEBtn"><a class="nav-link"
							data-toggle="tab" href="#existingE" role="tab"
							aria-controls="existingE" aria-selected="false"> <i
								class="fas fa-user-plus mr-1"></i>기존회원 초대하기
						</a></li>
					
						<li style="margin-left: 50px">
							<button class="btn waves-effect btn-outline-secondary"
								data-dismiss="modal">
								<i class="fa fa-times"></i>
							</button>
						</li>
					</ul>
				</div>
				<div class="card-body">
					<div class="tab-content">
						<!-- 신규초대 탭 -->
						<div class="tab-pane fade in show active" id="newE"
							role="tabpanel">

							<ul class="list-unstyled text-center">
							 <div class="alert-success">  ${message} </div>
								<small>
									<li>이메일을 입력하여 프로젝트에 초대해보세요!</li>
									<li>초대받은 사용자는 이메일을 통해 바로 프로젝트에 참여할 수 있습니다</li>
								</small>
							</ul>
							<form id="newInviteForm" action="invtnew.do" method="post">
								<table class="w-100 table" id="inviteTable">
									<colgroup>
										<col width="10%">
										<col width="80%">
										<col width="10%">
									</colgroup>
									<tbody>
										<tr class="new_tr">
											<td><i
												class="form-control-static fa fa-2x fa-user-circle prefix"
												style="min-height: auto; line-height: normal;"></i></td>
											<td><input class="form-control newe" name="newinvt"
												type="email" name="new" placeholder="초대할 이메일을 입력해주세요"
												required></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="text-center">
								<a class="btn my-1" onclick="callFunction()"> <i
									class="fa fa-plus-square mr-1" style="color: #42bbba"></i> 이메일
									추가
								</a>

							</div>

							<!--Footer-->
							<div class="modal-footer ">
								<button id="invtBtn" class="btn btn-primary waves-effect m-auto"
									style="padding: 4px 30px">초대하기</button>
								<!-- onclick="javascript:newInviteForm.submit();" -->
							</div>
						</div>
						<!-- /신규초대탭 -->
						<!-- 기존유저탭 -->
						<div class="tab-pane fade in show" id="existingE" role="tabpanel">

							<form class="form-inline justify-content-center mt-2">
								<!-- 검색창 -->
								<input class="form-control form-control-sm mr-3 w-75 "
									type="text" placeholder="검색" aria-label="Search"> <i
									class="fa fa-search" aria-hidden="true"></i>
							</form>
							<br>

							<!-- 전송용 selected 된 사용자에게 초대장 전송! -->
							<form action="" id="">
								<div id="selected" class="mb-2"></div>
							</form>


							<div id="dataTable_wrapper"
								class="dataTables_wrapper no-footer text-center">
								<table class="table">
									<thead>
										<th colspan="2">사진</th>
										<th>이름</th>
										<th>부서</th>
										<th>직책</th>
										<th>초대여부</th>
									</thead>
									<tbody id="nmlist">
									</tbody>
								</table>
							</div>


						</div>
						<!-- 기존유저탭 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function callFunction() {
			$('.new_tr').first().clone().appendTo('#inviteTable');
			$('.newe').last().val('');
			$('#inviteTable')
					.find('td:last')
					.append(
							'<i class="fa fa-times-circle mt-2" onclick="removetr()"></i>');
		}

		function removetr() {
			$(event.target).closest('tr').remove();

		}

		$(document).ready(function() {
			$('#myInput').on('keyup',function() {
				var value = $(this).val().toLowerCase();
				$('#myTable tr').filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
						});
					});
			});

		function addInvite() {
			var ele = $(event.target);
			if(ele.val() ==  '초대하기'){
				$(event.target).val("초대완료");
				
				var name = $(event.target).parent().parent().children().eq(1).text();
				//$('#selected').append('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i> </span>')
				
				var fileData1 = new Array(1);
				fileData1[0] = name;
				 $.ajax({
					 url : "invtnew.do",
				type : "post",
				data : JSON.stringify(fileData1),
				dataType : "JSON",
				contentType : "application/json; charset=utf-8;",
				success : function(data) {
					alert(data.message);
					$(event.target).addClass('disable btn-outline-dark');
					$(event.target).attr('disabled','true');
				},
				error : function(request, status, errorData) {
					alert(message);
				}
			});
			}
		}

		function unSelected() {
			$(event.target).parent().remove();
		}
		
		
		$('#invtBtn').on('click', function() {
		
			var n = $('input[name=newinvt]').length;
			var fileData = new Array(n);
			 for (var i = 0; i < n; i++) {
				fileData[i] = $('input[name=newinvt]')[i].value;
				if (fileData[i] == "") {
					alert('이메일을 입력해주세요')
					return false;
				}
			} 
			
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
		

		});

		$('#invtEBtn')
				.on(
						'click',
						function() {

							$
									.ajax({
										url : "invtee.do",
										type : "post",
										contentType : "application/json; charset=utf-8;",
										dataType : "Json",
										success : function(data) {
											var values = $("#nmlist").html();

											var values = $("#nmlist").html("");
											for ( var i in data) {
												values += '<tr style="width:60px;height:60px">'
														+ '<td  colspan="2" class="thumbnail circle"'
														+ 'style="width:40px;height:40px;background-image: url(\''
														+ data[i].uimg
														+ '\')"></td><td style="display:none">'
														+ data[i].uemail
														+ '</td><td class="my-6">'
														+ data[i].uname
				`										+ '</td>'
														+ '<td>'
														+ data[i].ugroup
														+ '</td>'
														+ '<td>'
														+ data[i].urole
														+ '</td>'
														+ '<td><input type="button"'
														+ 'class="btn btn-sm btn-outline-primary" value="초대하기"'
														+ 'onclick="addInvite()"></td></tr>'

											}

											$('#nmlist').html(values);
										},
										error : function(request, status,
												errorData) {
										}
									});
						});
	</script>
</body>

</html>

