<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>HWABO</title>

   
<style type="text/css">
#counter:focus {
	outline:none;
}
   
#counter{
	margin: 0;
}

#import{
	pointer-events: none; 
}
</style>
</head>
<script type="text/javascript"   src="resources/js/jquery-3.5.1.min.js"></script>
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

   }
function unSelected(){
   
   $(event.target).parent().remove();
   
 
}

function upcharge(){
	var result = "y";
	$('#upc').var(result);

}
</script>


                        
<body id="page-top">

 <form action="bpostup.do" method="post" id="bupdate" enctype="multipart/form-data">
            
            
<table style="position:fixed;z-index:8; width:100%;height:65%;">
<tr onclick="javascript:location.href='mybpost.do?ucode=${sessionScope.ucode}&pnum=${sessionScope.pnum}'"><td>&nbsp;</td><td style="height:20%;">&nbsp;</td><td>&nbsp;</td></tr>
<tr><td  onclick="javascript:location.href='mybpost.do?ucode=${sessionScope.ucode}&pnum=${sessionScope.pnum}'" style="width:30%;"></td><td style="width:40%;height:45%;background-color:white;border:1px solid skyblue;">
<div class="p-5" style="width:100%;">

                 
            		<input type ="hidden" name="bno" value="${post.bno }">
                     <input type="hidden" name="bucode" value="${sessionScope.ucode }">
                     <input type="hidden" name="bwriter" value="${sessionScope.uname }">
                     <input type="hidden" name="bpnum" value="${sessionScope.pnum }">
                   	 <input type="hidden" id="bform" name="bcharge">
                   	 <input type="hidden" name="boriginfile" value="${post.boriginfile }">
                   	 <input type="hidden" name="brenamefile" value="${post.brenamefile }">
                   	 
  
				<div class="text-center">
                    <h3 class="h4 text-gray-900 mb-4">수정 페이지</h3>
                  </div>
                        <table class="table" style="text-align: center; width: 100%;">
	                        <tr>
	                           <th style="width: 18%;vertical-align:middle; text-align: center;">제목</th>
	                           <td><input type="text" name="btitle" class="form-control" placeholder="일정 제목을 입력하세요" required="required" value="${post.btitle }"></td>
	                       	</tr>
                       
                           <tr>
                           <th style="width: 18%;vertical-align:middle;  text-align: center;">유형</th>
                              <td>
                              
                              <c:if test="${post.bkind eq '요청' }">
                               <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option1" value="요청" checked="checked">요청
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option2" value="진행">진행
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="피드백">피드백
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="완료">완료
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="보류">보류
                                </label>
                              </div>
                              </c:if>
                              <c:if test="${post.bkind eq '진행' }">
                               <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option1" value="요청">요청
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option2" value="진행" checked="checked">진행
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="피드백">피드백
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="완료">완료
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="보류">보류
                                </label>
                              </div>
                              </c:if>
                              <c:if test="${post.bkind eq '피드백' }">
                               <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option1" value="요청">요청
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option2" value="진행">진행
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="피드백" checked="checked">피드백
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="완료">완료
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="보류">보류
                                </label>
                              </div>
                              </c:if>
                              <c:if test="${post.bkind eq '완료' }">
                               <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option1" value="요청">요청
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option2" value="진행">진행
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="피드백">피드백
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="완료" checked="checked">완료
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="보류">보류
                                </label>
                              </div>
                              </c:if>
                              <c:if test="${post.bkind eq '보류' }">
                               <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option1" value="요청">요청
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option2" value="진행">진행
                                </label>
                                <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="피드백">피드백
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="완료">완료
                                </label>
                                 <label class="btn btn-secondary">
                                  <input type="radio" name="bkind" id="option3" value="보류" checked="checked">보류
                                </label>
                              </div>
                              </c:if>
                              
                              
                              </td>
                           </tr>
                     
                           <tr>
                         	  <th style="width: 18%;vertical-align:middle; text-align: center;" >담당자</th>
                         	  <td style="vertical-align:middle; text-align: left;">
                         	  	기존 담당자  : &nbsp; ${ post.bchargename }
                         	  	<br>
                         	  	<div style="padding-top: 10px; padding-bottom: 0px; margin-bottom: 0px;">
										<nav class="navbar navbar-expand navbar-light bg-light mb-4">



											<div class="dropdown">
												<button class="btn btn-secondary dropdown-toggle"
													type="button" id="dropdownMenu2" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">담당자 수정
												</button>
											<div id="selected"></div>


												<div class="dropdown-menu" aria-labelledby="dropdownMenu2">

													<c:forEach var="pm" items="${sessionScope.pmlist}"
														varStatus="status">
														<button class="dropdown-item" type="button"
															onclick="addbcharge${status.index}();"
															value="${pm.ucode }">${pm.uname }</button>
														<input type="checkbox" id="user${status.index }"
															name="bcharge" style="display: none">
														<input type="checkbox" id="name${status.index }"
															name="bchargename" style="display: none">
													</c:forEach>
												</div>
											</div>
									
										</nav>
									</div>
                         	  </td>
                         	</tr>
  
                           
                           <tr>
                           <th style="width: 18%;vertical-align:middle; text-align: center;" >시작날짜</th>
                              <td><input type="date" class="form-control" name="bstartday" value="${post.bstartday }"></td>

                           </tr>
                           <tr>
                            <th style="width: 18%;vertical-align:middle; text-align: center;" >끝날짜</th>
                              <td><input type="date" class="form-control" name="bendday" value="${post.bendday }"></td>
                           
                           </tr>

                           <tr>
                           <th style="width: 18%;vertical-align:middle; text-align: center;" >내용</th>
                              <td>
                              <textarea cols="50" rows="6" class="w-100 form-control" name="bcontent">${post.bcontent }</textarea>
                              </td>
                           </tr>

                           <tr>
                           <th style="width: 18%;vertical-align:middle; text-align: center;" >파일</th>
                              <td style="vertical-align:middle; text-align: left;">
                               <c:if test="${!empty post.boriginfile }">
                             	${post.boriginfile }
                             	&nbsp;&nbsp;&nbsp;
                             	<input type="checkbox" name="deleteFlag" value="yes">삭제
                             	<br><br>
                             	<input type="file" name="upfile">
                          	  </c:if>
                          	  <c:if test="${empty post.boriginfile }">                             	
                             	<input class="form-control" type="file" name="upfile">
                          	  </c:if>
                             </td>
                           </tr>

                            <tr>
                              <td colspan="2">
                                    <button type="submit" class="btn btn-sm btn-info" value="수정완료 ">수정완료</button>
    									&nbsp;&nbsp;
                                    <button type="reset" class="btn btn-sm btn-danger" value="">원래대로</button>
		
                              </td>
                           </tr>
                 </table>
                   
 
 
 
 
</div>
</td><td  onclick="javascript:location.href='mybpost.do?ucode=${sessionScope.ucode}&pnum=${sessionScope.pnum}'" style="width:30%;"></td></tr>
<tr  onclick="javascript:location.href='mybpost.do?ucode=${sessionScope.ucode}&pnum=${sessionScope.pnum}'"><td>&nbsp;</td><td style="height:35%;">&nbsp;</td><td>&nbsp;</td></tr>      
</table>
  </form>
  
<div id="import" style="opacity: 0.5">
<c:import url="/WEB-INF/views/abc/myBPOST.jsp" />
</div>





</body>

</html>