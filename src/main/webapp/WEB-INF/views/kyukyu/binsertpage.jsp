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





</script>
<script type='text/javascript'>
			//1MB(메가바이트)는 1024KB(킬로바이트)
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
                  <form action="insertbpost.do" name="b" method="post" id="bInsert" enctype="multipart/form-data">
            
                     <input type="hidden" name="bucode" value="${sessionScope.ucode }">
                     <input type="hidden" name="bwriter" value="${sessionScope.uname }">
                     <input type="hidden" name="bpnum" value="${sessionScope.pnum }">
                     
                     <!-- filebox -->
                     <input type="hidden" name="kb" id="kb">
                     <input type="hidden" name="kind" id="kind">
                     <input type="hidden" name="pnum" value="${sessionScope.pnum }">
                     
                     
                        <table style="text-align: center; width: 100%;">
                           <tr>
                              <td colspan="5">
                                 <hr>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="5"><span style="float: left;"><i class="fa fa-pen"></i>&nbsp;제 목</span>                                 
                              <input type="text" name="btitle" class="form-control" placeholder="일정 제목을 입력하세요" required="required"></td>
                           </tr>
                           <tr>
                              <td colspan="5">&nbsp;</td>
                           </tr>
                        
                           <tr>
                              <td colspan="5">
                              
                              <div class="btn-group btn-group-toggle" data-toggle="buttons">
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
                           <td colspan="5">
                           <div>   
                        <nav class="navbar navbar-expand navbar-light bg-light mb-4">
                    
                    
                    
                    
                    
                    <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      담당자
                    </button>
                      <div><input type="hidden" id="selected"></div>
                      
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2" >
                     <c:forEach var="pm" items="${sessionScope.pmlist}" varStatus="status">
                     <button class="dropdown-item" type="button" onclick="addbcharge${status.index}();" value="${pm.ucode }" required>${pm.uname }</button>
                     <input type="checkbox" id="user${status.index }" name="bcharge" style="display:none" >
                     <input type="checkbox" id="name${status.index }" name="bchargename" style="display:none">
                     </c:forEach>
                     
                    </div>
                  </div>
                   
                  
   <%--           <br><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             담당자
                        </a>
                    <!-- 담당자 이름 -->
                       <div><input type="hidden" id="selected" ></div>
           
                    
                        <div class="dropdown-menu dropdown-menu-left animated--grow-in" aria-labelledby="navbarDropdown">
                        <c:forEach var="pm" items="${sessionScope.pmlist}" varStatus="status">
                        
                          <a class="dropdown-item" onclick="addbcharge${status.index}();">${pm.uname}</a>
                           <input type="hidden" id="user${status.index }" name="bcharge">
                    
                           </c:forEach>
                           
                           
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">더보기</a>
                         
                        </div>  --%>
                        
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
                              <!-- <a class="btn btn-success btn-icon-split"   href="javascript: spostInsert.submit();"  style="width: 90%;">
                                    <span class="text">등록</span> </a> -->
                                    <input type="submit" class="btn btn-sm btn-info" value=" 등  록 ">
                                
                           
                              <!-- <a href="javascript:spostInsert.reset();"   class="btn btn-danger btn-icon-split" style="width: 90%;">
                                    <span class="text">취소</span> </a> -->
                                    <input type="reset" class="btn btn-sm btn-danger" href="" value=" 취  소 ">
                              
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