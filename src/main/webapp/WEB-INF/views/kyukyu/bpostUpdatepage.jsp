<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%= session.getAttribute("pnum") %>
<!DOCTYPE html>

<html lang="en">

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
   
   <style type="text/css">
   #counter:focus {outline:none;}
   
   #counter{margin: 0;}
   </style>
</head>
<script type="text/javascript"   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function bkindshow(){
	$("#'${b.bkind}'").button('toggle')

}


function addbcharge0(){
     var name = $(event.target).text();
     var code = $(event.target).val();
      
       $('#selected').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
       //$('#bform').val(name); 
       
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
    //$('#bform').val(name); 
    
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
       //$('#bform').val(name); 
       
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
       //$('#bform').val(name); 
       
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
       //$('#bform').val(name); 
       
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
       //$('#bform').val(name); 
       
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
       //$('#bform').val(name); 
       
      
       $('#user6').val(code);
       $('#name6').val(name);
       $("input:checkbox[id='user6']").prop("checked", true);
       $("input:checkbox[id='name6']").prop("checked", true);
       
       alert($("#user6").val()+" 6번"); 
       
   }
function unSelected(){
   
   $(event.target).parent().remove();
   
 
}

function upcharge(){
	var result = "y";
	$('#upc').val(result);

}
</script>


                        
<body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">

            <!-- Begin Page Content -->
            <div class="container-fluid">
               <!-- Page Heading -->
               <h1 class="h3 mb-2 text-gray-800"></h1>
               <p class="mb-4"></p>

               <!-- DataTales Example -->
               <div class="card shadow mb-4">
              



                  <div class="card-body">
                     <!-- 게시글안쪽 -->
                  <form action="updatebpost.do" method="post" id="bupdate" enctype="multipart/form-data">
            
            
            		<input type ="hidden" name="bno" value="${bpost.bno }">
                     <input type="hidden" name="bucode" value="${sessionScope.ucode }">
                     <input type="hidden" name="bwriter" value="${sessionScope.uname }">
                     <input type="hidden" name="bpnum" value="${sessionScope.pnum }">
                   	 <input type="hidden" id="bform" name="bcharge">
                   	 <input type="hidden" name="boriginfile" value="${bpost.boriginfile }">
                   	 <input type="hidden" name="brenamefile" value="${bpost.brenamefile }">
                   	 <input type="hidden" name="bopen" value="${bpost.bopen }">
                  
                        <table style="text-align: center; width: 100%;">
                           <tr>
                              <td colspan="5">
                                 <hr>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="5"><span style="float: left;"><i class="fa fa-pen"></i>&nbsp;제 목</span>                                 
                              <input type="text" name="btitle" class="form-control" placeholder="일정 제목을 입력하세요" required="required" value="${bpost.btitle }"></td>
                           </tr>
                           <tr>
                              <td colspan="5">&nbsp;</td>
                           </tr>
                        
                           <tr>
    							<td>
                              	<div class="btn-group btn-group-toggle"  data-toggle="buttons" >
								  <c:if test="${bpost.bkind eq '요청' }">
									
									
									 <label class="btn btn-info">
									    <input type="radio" name="bkind" id="요청" value="요청" checked>요청
									  </label> 
									  <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="진행" value="진행">진행
									  </label>
									  <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="피드백" value="피드백">피드백
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="완료" value="완료">완료
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="보류" value="보류">보류
									  </label>
									
									
								  </c:if>
								  
								  
								  <c:if test="${bpost.bkind eq '진행' }">
										
										
									 <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="요청" value="요청">요청
									  </label> 
									  <label class="btn btn-info">
									    <input type="radio" name="bkind" id="진행" value="진행" checked>진행
									  </label>
									  <label class="btn btn-secondary"">
									    <input type="radio" name="bkind" id="피드백" value="피드백">피드백
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="완료" value="완료">완료
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="보류" value="보류">보류
									  </label>			
								  </c:if>
								 
								  <c:if test="${bpost.bkind eq '피드백' }">
										
									 <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="요청" value="요청">요청
									  </label> 
									  <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="진행" value="진행">진행
									  </label>
									  <label class="btn btn-info">
									    <input type="radio" name="bkind" id="피드백" value="피드백" checked>피드백
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="완료" value="완료">완료
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="보류" value="보류">보류
									  </label>				
								  </c:if>
								  
								   <c:if test="${bpost.bkind eq '완료' }">
											
									 <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="요청" value="요청">요청
									  </label> 
									  <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="진행" value="진행">진행
									  </label>
									  <label class="btn btn-secondary"">
									    <input type="radio" name="bkind" id="피드백" value="피드백">피드백
									  </label>
									   <label class="btn btn-info">
									    <input type="radio" name="bkind" id="완료" value="완료" checked>완료
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="보류" value="보류">보류
									  </label>			
								  </c:if>
								  
								  
								   <c:if test="${bpost.bkind eq '보류' }">
											
									 <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="요청" value="요청" >요청
									  </label> 
									  <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="진행" value="진행">진행
									  </label>
									  <label class="btn btn-secondary"">
									    <input type="radio" name="bkind" id="피드백" value="피드백">피드백
									  </label>
									   <label class="btn btn-secondary">
									    <input type="radio" name="bkind" id="완료" value="완료">완료
									  </label>
									   <label class="btn btn-info">
									    <input type="radio" name="bkind" id="보류" value="보류" checked>보류
									  </label>			
								  </c:if>
					
								</div>
					 
                   			 </td>
                             
                           </tr>
                           <tr>
                              <td>기존 담당자 : ${ bpost.bchargename }</td>
                               
                           </tr>
                     
                           <tr>
                           <td colspan="5">
                           	<div>   
                       		 <nav class="navbar navbar-expand navbar-light bg-light mb-4">
                    
                    
			                
			               <div class="dropdown"> 
			                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
			                     	 담당자 수정
			                    </button>
			                      <div id="selected"></div>
			                     
			                  
			                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
			                  	
			                     <c:forEach var="pm" items="${sessionScope.pmlist}" varStatus="status">
			                     <button class="dropdown-item" type="button" onclick="addbcharge${status.index}();" value="${pm.ucode }">${pm.uname }</button>
			                     <input type="checkbox" id="user${status.index }" name="bcharge" style="display:none">
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
                              <td width="20%"><span style="float: left;"><i
                                    class="far fa-calendar-alt"></i>&nbsp;시 작 날 짜</span><input
                                 type="date" class="form-control" name="bstartday" id="beforesstartday" value="${bpost.bstartday }"></td>

                              <td width="20%"><span style="float: left;"><i
                                    class="far fa-calendar-alt"></i>&nbsp;끝 날 짜</span><input
                                 type="date" class="form-control" name="bendday" id="beforesendday" value="${bpost.bendday }"></td>
                              <td colspan="3"></td>
                           </tr>
                           <tr>
                              <td colspan="3" style="text-align: left;"><span style="color: blue;" id="placespan"></span></td>
                              <td colspan="2">&nbsp;</td>
                           </tr>
                        
                        
                           <tr>
                              <td colspan="5"><span style="float: left;"><i class="far fa-keyboard"></i>&nbsp;메 모</span>
                              <textarea cols="50" rows="6" class="w-100 form-control" name="bcontent">${bpost.bcontent }</textarea>
                              </td>
                           </tr>
                           
                           <tr>
                              <td colspan="5">&nbsp;</td>
                           </tr>
                           <tr>
                              <td>
                               <c:if test="${!empty bpost.boriginfile }">
                             	${bpost.boriginfile }
                             
                             	<input type="checkbox" name="deleteFlag" value="yes">삭제
                          	  </c:if>
                             </td>
                           </tr>
                           <tr>
                             <td>
                               <input type="file" name="upfile">
                             </td>
                            </tr>
                            <tr>
                             
<%--                               <td>
                              <select name="bopen" class="form-control" value="${b.bopen }" style="display:none">
                             
                              </select>
                              </td> --%>
                              <td colspan="3">
                              <!-- <a class="btn btn-success btn-icon-split"   href="javascript: spostInsert.submit();"  style="width: 90%;">
                                    <span class="text">등록</span> </a> -->
                                    <input type="submit" class="btn btn-sm btn-info" value="등 록 ">
                                 <!--    <button type="submit" class="btn btn-sm btn-info" >&nbsp;등 &nbsp;록&nbsp;</button> -->
                           
                              <!-- <a href="javascript:spostInsert.reset();"   class="btn btn-danger btn-icon-split" style="width: 90%;">
                                    <span class="text">취소</span> </a> -->
                                    <input type="reset" class="btn btn-sm btn-danger" alue="취 소">
                                    <!-- <button type="reset" class="btn btn-sm btn-danger" >&nbsp;취 &nbsp;소&nbsp;</button> -->
                              </td>
                           </tr>
                        </table>
                     </form>

                     
                  </div>
               </div>
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
      <!-- End of Content Wrapper -->

   </div>
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
                  <span aria-hidden="true">Ã </span>
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