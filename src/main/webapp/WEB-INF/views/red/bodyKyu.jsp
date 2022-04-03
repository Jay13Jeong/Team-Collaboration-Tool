<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<body>
<c:if test="${ main.firstword eq 'b' }">
<c:set var="b" value="${ main }"></c:set>
           	<div class="card shadow mb-4">
			 <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-user-circle"></i>
				${b.bwriter}<br>${b.benrolldate }</h6>
				<!-- 수정삭제 드롭다운 -->	
             <div class="dropdown no-arrow">
               <button id="cavinetin_${status.index }" class="btn btn-custom btn-sm liketoggle${status.index }" name="like" onclick="sendInsert(${status.index});">
           	   <span>보관</span> <i class="far fa-bookmark"></i></button>
           	   <input type="hidden" id="ucode_${status.index }" value="${sessionScope.ucode }" >
			   <input type="hidden" id="no_${status.index }" value="${b.bno }">
			   <input type="hidden" id="pnum_${status.index }" value="${b.bpnum }" >
			   <input type="text" id="open_${status.index }" value="${b.bopen }" >
			 <div id="d5"></div>
		  		<c:if test="${sessionScope.ucode eq b.bucode }">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <c:url var="bup" value="buppage.do">
                      	<c:param name="bno" value="${b.bno }"/>
                      </c:url> 
                     <a class="dropdown-item" href="${bup }">수정</a>
                       <c:url var="bdel" value="deletebpost.do">
                      	<c:param name="bno" value="${b.bno }"/>
                    	<c:param name="brenamefile" value="${b.brenamefile }"/>
                      </c:url>
                      <a class="dropdown-item" href="${bdel }">삭제</a>
                    </div>
                    </c:if>
                  </div> <!-- 드롭다운 끝 -->
				</div><!-- card-header py-3 d-flex flex-row align-items-center justify-content-between -->
			<!-- 게시글안쪽 -->	
			<div class="card-body">
			   <b>제목 : ${b.btitle}</b>
			   <hr>
			<div class="btn-group btn-group-toggle"  >
			  <c:if test="${b.bkind eq '요청' }">
				 <label class="btn btn-info">
				    <input type="radio" name="진행" id="요청" value="요청" readonly>요청
				  </label> 
				  <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="진행" value="진행" readonly>진행
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="피드백" id="피드백" value="피드백" readonly>피드백
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="완료" id="완료" value="완료" readonly>완료
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="보류" id="보류" value="보류" readonly>보류
				  </label>
			  </c:if>
			  <c:if test="${b.bkind eq '진행' }">
				 <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="요청" value="요청" readonly>요청
				  </label> 
				  <label class="btn btn-info">
				    <input type="radio" name="진행" id="진행" value="진행" readonly>진행
				  </label>
				  <label class="btn btn-secondary"">
				    <input type="radio" name="피드백" id="피드백" value="피드백" readonly>피드백
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="완료" id="완료" value="완료"readonly>완료
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="보류" id="보류" value="보류" readonly>보류
				  </label>			
			  </c:if>
			  <c:if test="${b.bkind eq '피드백' }">
				 <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="요청" value="요청" readonly>요청
				  </label> 
				  <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="진행" value="진행" readonly>진행
				  </label>
				  <label class="btn btn-info">
				    <input type="radio" name="피드백" id="피드백" value="피드백" readonly>피드백
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="완료" id="완료" value="완료" readonly>완료
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="보류" id="보류" value="보류" readonly>보류
				  </label>				
			  </c:if>
			   <c:if test="${b.bkind eq '완료' }">
				 <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="요청" value="요청" readonly>요청
				  </label> 
				  <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="진행" value="진행" readonly>진행
				  </label>
				  <label class="btn btn-secondary"">
				    <input type="radio" name="피드백" id="피드백" value="피드백" readonly>피드백
				  </label>
				   <label class="btn btn-info">
				    <input type="radio" name="완료" id="완료" value="완료" readonly>완료
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="보류" id="보류" value="보류" readonly>보류
				  </label>			
			  </c:if>
			   <c:if test="${b.bkind eq '보류' }">
				 <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="요청" value="요청" readonly >요청
				  </label> 
				  <label class="btn btn-secondary">
				    <input type="radio" name="진행" id="진행" value="진행" readonly>진행
				  </label>
				  <label class="btn btn-secondary"">
				    <input type="radio" name="피드백" id="피드백" value="피드백" readonly>피드백
				  </label>
				   <label class="btn btn-secondary">
				    <input type="radio" name="완료" id="완료" value="완료" readonly>완료
				  </label>
				   <label class="btn btn-info">
				    <input type="radio" name="보류" id="보류" value="보류" readonly>보류
				  </label>			
			  </c:if>
			</div>
			<br><br>
			<div>
			   <i class="fas fa-user-friends"></i> 담당자 :  ${b.bchargename }
			</div>
			<hr>
			<div>
			<table><tr>
				 <td width="20%"><span style="float: left;">
				 	<i class="far fa-calendar-alt"> 시작일 : &nbsp;${b.bstartday }</i></span>
				 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
	             </td>
				 <td width="20%"><span style="float: center;">
				 	<i class="far fa-calendar-alt"> 마감일 : &nbsp;${b.bendday }</i></span>
	           	 </td>
	         </tr></table>
			</div>
			<hr>
			<div>
			  <table>
			   <c:if test="${! empty b.bcontent }">
				 <tr>
				 <td><b><big>${b.bcontent}</big></b></td>
				 </tr>
				</c:if>
		      </table>
			<br>	
			  <table>
				 <c:if test="${! empty b.boriginfile }">
					<tr>
					   <td>
						 <div id="showfile" style="overflow:hidden;"> 
					     <img src="resources/bupfile/${b.brenamefile}" class="rounded" style="width : 220px;height : 150px;">
					     <br>
					     <a href="${ubf }"><i class="far fa-file"></i> :  ${b.boriginfile}</a>
						 </div> 
					   </td>
					 <c:url var="ubf" value="bfdown.do">
					  <c:param name="ofile" value="${b.boriginfile}"/>
					  <c:param name="rfile" value="${b.brenamefile}"/>
					 </c:url> 
					</tr>
			    </c:if>
					<c:if test="${empty b.boriginfile}">
					&nbsp;
					</c:if>
			 </table><hr>
			 <table style="width: 100%;">
				<tr>
					<td style="width: 20%;"><a href="#" class="btn btn-primary btn-icon-split btn-sm"> 
					<span class="icon text-white-50"> <i class="far fa-heart"></i>
					</span> <span class="text">좋아요 </span>
					</a>
				 </td>
				 <td style="width: 20%;"></td>
				 <td style="width: 20%;"></td>
				 <td style="width: 20%;"></td>
				 <td style="width: 20%; float: right;"></td>
				</tr>
			</table>
		 </div>
		 <div class="px-3 py-5 bg-gradient-light text-white" style="height: 10px;">
			<input type="text" class="form-control" placeholder="답글을 입력하세요">
	  	 </div>
	 </div><!-- 게시글안쪽  -->			
	</div><!-- card shadow mb-4 -->
</c:if>
</body>
