<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%= session.getAttribute("pnum") %> --%>
<!DOCTYPE html>
<html lang="kr">

<head>
<link rel="icon" type="image/x-icon"
	href="/hwabo/resources/assets/img/favicon.png" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HWABO</title>

<!-- Custom fonts for this template -->
<link
	href="/hwabo/resources/maincss/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/hwabo/resources/maincss/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="/hwabo/resources/maincss/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>


<style type="text/css">
div#showfile imag {
	width: 10%;
	height: 10%;
}
</style>

<style type="text/css">

hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #FFFFFF;
}
a {
    color: #82b440;
    text-decoration: none;
}
.blog-comment::before,
.blog-comment::after,
.blog-comment-form::before,
.blog-comment-form::after{
    content: "";
	display: table;
	clear: both;
}

.blog-comment ul{
	list-style-type: none;
	padding: 0;
}

.blog-comment img{
	opacity: 1;
	filter: Alpha(opacity=100);
	-webkit-border-radius: 4px;
	   -moz-border-radius: 4px;
	  	 -o-border-radius: 4px;
			border-radius: 4px;
}

.blog-comment img.avatar {
	position: relative;
	float: left;
	margin-left: 10px; 
	width: 40px;
	height: 40px;
}
 ul {
    margin-top: auto;
    margin-bottom: auto;
}

hr {
border: 1px solid #eee;
}


 .blog-comment .post-comments{
	border: 2px solid #eee;
    margin-bottom: 10px;
    margin-left: 60px;  /* ?????? ????????? ?????? ?????? */
	margin-right: 10px;
    padding: 5px 5px;
    position: relative;
    -webkit-border-radius: 4px;
       -moz-border-radius: 4px;
       	 -o-border-radius: 4px;
    		border-radius: 4px;
	background: #fff;
	color: #6b6e80;
	position: relative;
} 

.blog-comment .meta {
	font-size: 13px;
	color: #aaaaaa;
	padding-bottom: 1px;  /*  */
	margin-bottom: 10px !important;
	border-bottom: 1px solid #eee;
}

.blog-comment ul.comments ul{
	list-style-type: none;
	
	padding: 0;
	margin-left: 50px; /*????????? ?????? */
}

</style>


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">



/* ????????? ????????? ??? ????????? ?????? ???????????? */
$(document).ready(function(){
	console.log("cabinet list function get in");
	
	
	$.ajax({
		
		url: "cabinetList.do",
		data: {ucode: "${sessionScope.ucode }", pnum: "${sessionScope.pnum }" },
		type: "post",
		dataType: "json",
		success: function(obj){
			
			var str = JSON.stringify(obj);
			var json = JSON.parse(str);
			console.log("success : " + str);
			
			
			for(var i in json.list){
				console.log(json.list[i].no); 
				
			
			
			for(var a = 0; a <= ${fn:length(requestScope.list)}; a++ ){
				var val = $("#no_"+a).val();
				
				
				
				if(val == json.list[i].no){
					console.log("?????????"+val);
				
					console.log("???");
					   $(".liketoggle"+a).find("i").toggleClass("fas far");
					   $(".liketoggle"+a).find("span").text(function(i, v) {
					     return v === '??????' ? '?????????' : '??????'
				   });
					
				}
				
			}
			}
			
			
		},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " +jqXHR+", "+textstatus+", "+errorthrown);
		}
		
		
	});
	

	
});


 



function sendInsert(index){
	
	
	console.log("sendCabinet : " + index);
	console.log($("#no_"+ index).val());
	
	
	if ($(".liketoggle"+index).find("span").text() == '??????') {
		$.ajax({	      
		      url: "insertcabinet.do",
		      data: {no: $("#no_"+ index).val(), ucode: $("#ucode_" + index).val(), pnum: $("#pnum_" + index).val()},     
		      type: "post",
		      success: function(result){

		         if(result == "ok"){
		           /*  $("#open_"+index).val('n'); */
   					alert("?????? ??????");
		            console.log("????????? ????????? ?????? !");
		         }else{
		            alert("?????? ??????????????? ????????? ok??? ??????");
		         }
		      
		      },
		      error: function(request, status, errorData){
		    	 
		            console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
		         }
		      
		      }); //????????????
	      
	}else{  //?????? ????????? ?????????????????? ????????????
		
		$.ajax({	      
		      url: "deletecabinet.do",
		      data: {no: $("#no_"+ index).val(), ucode: $("#ucode_" + index).val(), pnum: $("#pnum_" + index).val()},     
		      type: "post",
		      success: function(result){
		         if(result == "ok"){
		        	 /*  $("#open_"+index).val('y'); */
		          	alert("?????? ?????? ??????");
		            console.log("????????? ?????? ?????? !");
		         }else{
		            alert("?????? ???????????? ?????? ?????? ??????");
		         }
		      
		      },
		      error: function(request, status, errorData){
		    	 
		         console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
		         }
		      
		      }); //????????????

		
			}   
	      
			  $(".liketoggle"+index).find("i").toggleClass("fas far");
			  $(".liketoggle"+index).find("span").text(function(i, v) {
			     return v === '??????' ? '?????????' : '??????'
				    		 
	 });
}

/* ???????????? */

$(document).ready(function(){
	
	replyList();	
});
	
function replyList(){
	
	
	console.log("?????? ????????? ?????????");
	
	$.ajax({
		
		url:"replyList.do",
		type: "post",
		dataType: "json",
		success: function(obj){
			
			console.log(obj);
			
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var output = "";
			
			
		
			
			
			for(var a= 0; a < ${requestScope.list.size()}; a++){ //?????? ????????? ?????????
				console.log("1??? ??????");
				var re = "";
				
				for(var i  in jsonObj.list){ //?????? ?????? ?????????
					
					
					console.log("2??? ??????");
					console.log("jsonObj.list[i].no"+jsonObj.list[i].no);
					console.log("$('#commentList_'+a).val()"+ document.getElementById('commentList_'+a).getAttribute('name'));
				
				if(jsonObj.list[i].no == document.getElementById('commentList_'+a).getAttribute('name')){ //???????????? ????????? ????????? ?????? ??????
					console.log("if ???");
					console.log("${sessionScope.ucode}");
					console.log( jsonObj.list[i].ucode);
				
					var replyno = jsonObj.list[i].replyno;
					var no = jsonObj.list[i].no;
					var ucode = jsonObj.list[i].ucode;
					var uname = decodeURIComponent(jsonObj.list[i].uname).replace(/\+/gi, " ");
					var content = decodeURIComponent(jsonObj.list[i].content).replace(/\+/gi, " ");
					var secondenroll = jsonObj.list[i].secondenroll;
					var enrolldate = jsonObj.list[i].enrolldate.substring(0, 16);
					var kind = jsonObj.list[i].kind;
					
					re += '<div class="blog-comment"><ul class="comments">';
					
				
				
					if(kind == "0"){ //????????? ???
						
						re += '<li class="clearfix">';
						re += '<img src="https://bootdey.com/img/Content/user_1.jpg" class="avatar" alt="">';
						if(secondenroll == null){
						re += '<div class="post-comments"><div class="meta"><a href="#">'+uname+'</a>&nbsp;&nbsp;&nbsp;';
						re += enrolldate;
							}else{
							re += '<div class="post-comments"><div class="meta"><a href="#">'+uname+'</a>&nbsp;&nbsp;&nbsp;';
							re += '<small>&nbsp;&nbsp; ????????? '+secondenroll.substring(0, 16)+'</small>';	
							}
						
						re += '<i class="pull-right"><a onclick="commentRereply('+replyno+',\''+no+'\');"> ?????? </a>';
						
						if(ucode == "${ sessionScope.ucode }"){
							 re += '<a onclick="commentUpdate('+replyno+',\''+content+'\');"> ?????? </a>';
						     re += '<a onclick="commentDelete('+replyno+');"> ??????&nbsp;&nbsp; </a></div></i>';
						    
						}
						 re += '<div class="commentContent'+replyno+'"> &nbsp;'+content+'</div></div></li>'; 
						  
						
					}else{ //????????? ???
						
						re += '<ul class="comments"><li class="clearfix">';
						re += '<img src="https://bootdey.com/img/Content/user_3.jpg" class="avatar" alt="">';
						if(secondenroll == null){
							re += '<div class="post-comments"><div class="meta"><a href="#">'+uname+'</a>&nbsp;&nbsp;&nbsp;';
							re += enrolldate;
								}else{
								re += '<div class="post-comments"><div class="meta"><a href="#">'+uname+'</a>&nbsp;&nbsp;&nbsp;';
								re += '<small>&nbsp;&nbsp; ????????? '+secondenroll.substring(0, 16)+'</small>';	
								}
						
						if(ucode == "${ sessionScope.ucode }"){
							 re += '<a onclick="commentUpdate('+replyno+',\''+content+'\');"> ?????? </a>';
						     re += '<a onclick="commentDelete('+replyno+');"> ??????&nbsp;&nbsp; </a></div></i>';
						    
						}
						 re += '<div class="commentContent'+replyno+'"> &nbsp;'+content+'</div></div></li></ul>'; 
						  	
					}
						
						
						
			
	            	
	            	re += '<div class="Rere'+replyno+'"></div>';
	            	re += '</ul></div>';
	        
				 }
				
			
				$("#commentList_"+a).html(re);
			
				}
		
			}
		
		},
		error: function(request, status, errorData){ 
			console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
		}
		
	});
	
	
	
}

//?????? ?????? ???
function commentUpdate(replyno, content){
    var a ='';
   
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+replyno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="javascript:commentUpdateProc('+replyno+');">??????</button> </span>';
    a += '<span class="input-group-btn"><button class="btn btn-default" onclick="replyList()">??????</button></span>';
    a += '</div>';
    
    $('.commentContent'+replyno).html(a);
    
}

//?????? ????????? ???
 function commentRereply(replyno, no){
    var a ='';
    console.log("replyno : " +replyno+ " no :" +no );
   
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+replyno+'" />';
    a += '<span class="input-group-btn"><button class="btn btn-outline-secondary" type="button" onclick="javascript:rereinsert(\''+ replyno +'\',\''+ no +'\');">????????????</button></span>';
    a += '<span class="input-group-btn"><button class="btn btn-outline-secondary" onclick="replyList()">??????</button></span>';
    a += '</div><br>';
   
    $('.Rere'+replyno).html(a);
    
}



//?????? ?????? ????????????
function rereinsert(replyno, no){
	
    var Content = $('[name=content_'+replyno+']').val();
    console.log("?????? ?????????")
    $.ajax({
        url : 'insertRereply.do',
        type : 'post',
        data : {'content' : Content, 'no' : no, 'replyno' : replyno, 
        	ucode: "${sessionScope.ucode }", uname : "${sessionScope.uname }"},
        	  success : function(data){
  	        	console.log("?????? insert ??????");
  	            if(data == "ok") {
  	            	replyList();  //?????? ?????? ??? ?????? ?????? reload
  	            	/* $("#reply_content_").val(''); */
  	            }else{
  	            	alert("?????? ?????? ??????! ????????? ?????????")
  	            }
  	        }
    });
}
 

 
//?????? ??????
function commentUpdateProc(replyno){
    var updateContent = $('[name=content_'+replyno+']').val();
    console.log("?????? ?????????")
    $.ajax({
        url : 'updatereply.do',
        type : 'post',
        data : {'content' : updateContent, 'replyno' : replyno},
        success : function(data){
            if(data == 1)
           		replyList();
        }
    });
}
 
   
//?????? ?????? 
function commentDelete(replyno){
	console.log("?????? replyno : " + replyno)
    $.ajax({
        url : 'deletereply.do',
        data : {'replyno' : replyno},
        type : 'post',
        success : function(data){
            if(data == 1) 
            	replyList();
        }
    });
}
 
 



 
function enterkey(index) {
	console.log("enterkey function get in");
	
	   $.ajax({
	        url : 'insertreply.do',
	        type : 'post',
	        data : {no : $("#reply_no_"+ index).val(), content : $("#reply_content_"+ index).val(),
	        		ucode: "${sessionScope.ucode }", uname : "${sessionScope.uname }"
	        },
	        success : function(data){
	        	console.log("?????? insert ??????");
	            if(data == "ok") {
	            	 replytList(index);  //?????? ?????? ??? ?????? ?????? reload
	            	$("#reply_content_"+ index).val('');
	            }else{
	            	alert("?????? ?????? ??????! ????????? ?????????")
	            }
	        }
	    });
}


function replytList(index){
	console.log("reply ????????? ??? ????????? ???????????? function get in");
	
	
	
    $.ajax({
        url : 'selectOneReply.do',
        type : 'post',
        data : {no : $("#reply_no_"+ index).val()},
		
        success : function(data){
        	replyList();
        	

        	console.log("?????? list ??????");
   
        }
    });
}



    	 
  





</script>


<body id="page-top">

	<c:import url="/WEB-INF/views/kyukyu/topbar.jsp"></c:import>

	<div
		style="width: 100%; display: flex; justify-content: center; align-item: center;">
		<!-- Sidebar2right -->
		<c:import url="/WEB-INF/views/kyukyu/entersideFixed.jsp"></c:import>
		<!-- End of Sidebar2right -->


		<!-- Page Wrapper -->
		<div id="wrapper" style="width: 1300px;">

			<!-- Sidebar -->
			<div style="width: 17%"></div>
			<!-- End of Sidebar -->



			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column bg-white"
				style="width: 62%;">

				<!-- Main Content -->
				<div id="content">

					<!-- Topbar -->
					<br>
					<br>
					<br>
					<br>
					<!-- End of Topbar -->

					<!-- Begin Page Content -->
					<div class="container-fluid">


												


						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">?????? ?????????</h1>
						<p class="mb-4"></p>


						<!-- Content Row -->
						<div class="row">

							<!-- ????????? ?????? ?????? ????????????!!! -->
							<div class="col-lg-11">




								<c:forEach var="b" items="${requestScope.list }"
									varStatus="status">
									<div class="card shadow mb-4">




										<div
											class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold text-primary">

												<i class="fas fa-user-circle"></i> ${b.bwriter}<br>${b.benrolldate }</h6>
											<!-- 	<button type="submit" class="btn btn-custom btn-sm liketoggle" name="like"><span>??????</span> <i class="far fa-bookmark"></i></button>
					 -->


											<!-- ???????????? ???????????? -->
											<div class="dropdown no-arrow">

												<!-- ????????? ???????????? -->
												<button id="cavinetin_${status.index }"
													class="btn btn-custom btn-sm liketoggle${status.index }"
													name="like" onclick="sendInsert(${status.index});">
													<span>??????</span> <i class="far fa-bookmark"></i>
												</button>
												<input type="hidden" id="ucode_${status.index }"
													value="${sessionScope.ucode }"> <input type="text"
													id="no_${status.index }" value="${b.bno }"> <input
													type="hidden" id="pnum_${status.index }"
													value="${b.bpnum }">



												<div id="d5"></div>
												<c:if test="${sessionScope.ucode eq b.bucode }">
													<a class="dropdown-toggle" href="#" role="button"
														id="dropdownMenuLink" data-toggle="dropdown"
														aria-haspopup="true" aria-expanded="false"> <i
														class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
													</a>
													<div
														class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
														aria-labelledby="dropdownMenuLink">

														<c:url var="bup" value="buppage.do">
															<c:param name="bno" value="${b.bno }" ></c:param>

														</c:url>
														<a class="dropdown-item" href="${bup }">??????</a>

														<c:url var="bdel" value="deletebpost.do">
															<c:param name="bno" value="${b.bno }" />
															<c:param name="brenamefile" value="${b.brenamefile }" />
														</c:url>
														<a class="dropdown-item" href="${bdel }">??????</a>

													</div>
												</c:if>
											</div>
											<!-- ???????????? ??? -->

										</div>
										<!-- card-header py-3 d-flex flex-row align-items-center justify-content-between -->

										<!-- ??????????????? -->
										<div class="card-body">

											<b>?????? : ${b.btitle}</b>
											<hr>


											<div class="btn-group btn-group-toggle">
												<c:if test="${b.bkind eq '??????' }">


													<label class="btn btn-info"> <input type="radio"
														name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="?????????" id="?????????" value="?????????" readonly>?????????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>


												</c:if>


												<c:if test="${b.bkind eq '??????' }">


													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-info"> <input type="radio"
														name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="?????????" id="?????????" value="?????????" readonly>?????????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
												</c:if>

												<c:if test="${b.bkind eq '?????????' }">

													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-info"> <input type="radio"
														name="?????????" id="?????????" value="?????????" readonly>?????????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
												</c:if>

												<c:if test="${b.bkind eq '??????' }">

													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="?????????" id="?????????" value="?????????" readonly>?????????
													</label>
													<label class="btn btn-info"> <input type="radio"
														name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
												</c:if>


												<c:if test="${b.bkind eq '??????' }">

													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="?????????" id="?????????" value="?????????" readonly>?????????
													</label>
													<label class="btn btn-secondary"> <input
														type="radio" name="??????" id="??????" value="??????" readonly>??????
													</label>
													<label class="btn btn-info"> <input type="radio"
														name="??????" id="??????" value="??????" readonly>??????
													</label>
												</c:if>

											</div>
											<br>
											<br>



											<div>
												<i class="fas fa-user-friends"></i> ????????? : ${b.bchargename }
											</div>
											<hr>
											<div>
												<tr>
													<td width="20%"><span style="float: left;"> <i
															class="far fa-calendar-alt"> ????????? :
																&nbsp;${b.bstartday }</i></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td width="20%"><span style="float: center;"> <i
															class="far fa-calendar-alt"> ????????? : &nbsp;${b.bendday }</i></span>
													</td>
												</tr>
											</div>

											<hr>

											<div>
												<table>
													<c:if test="${! empty b.bcontent }">

														<tr>
															<td><b>${b.bcontent}</b></td>
														</tr>
													</c:if>
												</table>
												<br>
												<table>
													<c:if test="${! empty b.boriginfile }">

														<tr>
															<td><c:url var="ubf" value="bfdown.do">
																	<c:param name="ofile" value="${b.boriginfile}" />
																	<c:param name="rfile" value="${b.brenamefile}" />
																</c:url>


															<div id="showfile" style="overflow: hidden;">
																	<c:forTokens var="ext" items="${b.brenamefile}"
																		delims="." varStatus="status1">

																		<c:if test="${status1.last}">
																			<c:choose>
																				<c:when test="${ext eq 'jpg' or ext eq 'gif'}">
																					<img src="resources/bupfile/${b.brenamefile}"
																						class="rounded"
																						style="width: 220px; height: 150px;">
																				</c:when>
																				<c:when test="${ext eq 'txt'}">
																					<img src="resources/img/filemoon.png"
																						style="width: 40px; height: 40px">
																				</c:when>
																				<c:when test="${ext eq 'pdf'}">
																					<img src="resources/img/pppptttt.png"
																						style="width: 40px; height: 40px">
																				</c:when>
																				<c:when
																					test="${ext != 'jpg' and ext != 'txt' and ext != 'pdf'}">
																					<img src="resources/img/eettcc.png"
																						style="width: 40px; height: 40px">
																				</c:when>

																			</c:choose>
																		</c:if>
																	</c:forTokens>
																	<br> <a href="${ubf }"><i class="far fa-file"></i>
																		: ${b.boriginfile}</a>

																</div></td>

														</tr>

													</c:if>
													<c:if test="${empty b.boriginfile}">
													&nbsp;
													</c:if>
												
												</table>
											
											</div>
						
										</div><!-- ???????????????  -->
										<hr>
										
										
										
										   
						
										
										
												<!-- ?????? -->
										<div class="px-3 pb-5 text-white" id="replyy">
							
											<a class="btn btn-outline-success btn-sm" data-toggle="collapse" href="#collapseExample${status.index }" aria-expanded="false" aria-controls="collapseExample">
											  ??????
											</a>
									
											<div class="collapse" id="collapseExample${status.index }">
											  <div class="well">
													<br>
														<div class="commentList_${status.index }" id="commentList_${status.index }" name="${b.bno }"></div>
								
													<div style="height: 2px;">
								
														<input type="hidden" id="reply_no_${status.index }" name="no"
															value="${b.bno }"> <input type="text"
															class="form-control" id="reply_content_${status.index }"
															name="content" placeholder="enter??? ????????? ????????? ???????????????"
															onKeypress="javascript:if(event.keyCode == 13) {enterkey(${status.index});}" />
													</div>
								
												</div>
										
											</div>
										</div>
															
										
							
									</div>
									<!-- card shadow mb-4 -->
								</c:forEach>



							</div>
							<!-- class="col-lg-11" -->



						</div>
						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->




					<!-- Footer -->
					<footer class="sticky-footer bg-white">
						<div class="container my-auto">
							<div class="copyright text-center my-auto">
								<span>Copyright &copy; Your Website 2020</span>
							</div>
						</div>
					</footer>
					<!-- End of Footer -->

				</div>
			</div>

			<div style="width: 25%"></div>
			<!-- End of Content Wrapper -->

		</div>

	</div>
	<!-- ????????? ?????? ??????  div flex-->
	<!-- End of Page Wrapper -->


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">????</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="/hwabo/resources/maincss/vendor/jquery/jquery.min.js"></script>
	<script
		src="/hwabo/resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/hwabo/resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/hwabo/resources/maincss/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="/hwabo/resources/maincss/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/hwabo/resources/maincss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/hwabo/resources/maincss/js/demo/datatables-demo.js"></script>

</body>

</html>
