<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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

<style type="text/css">
::-webkit-scrollbar { width: 6px; } /* 스크롤 바 */

::-webkit-scrollbar-track { background-color:#fff; } /* 스크롤 바 밑의 배경 */

::-webkit-scrollbar-thumb { background: #ddd; border-radius: 10px; } /* 실질적 스크롤 바 */

::-webkit-scrollbar-thumb:hover { background: #404040; } /* 실질적 스크롤 바 위에 마우스를 올려다 둘 때 */

::-webkit-scrollbar-thumb:active { background: #808080; } /* 실질적 스크롤 바를 클릭할 때 */

::-webkit-scrollbar-button { display: none; } /* 스크롤 바 상 하단 버튼 */

 /* The Modal (background) */
.modalD {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 999; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }

/* Modal Content/Box */
.modalD-content {
    background-color: #fefefe;
    margin: 7% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */                          
}

.modal-backdrop {
	z-index: -1;
}

.modal {
	z-index: 1050;
}



#selected span {
	background-color: rgba(66, 182, 187, 0.5);
	padding: 0px 5px;
	margin: 0px 3px;
}
</style>


<title>HWABO</title>

<!-- Custom fonts for this template -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
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
<link href="/hwabo/resources/maincss/css/github-markdown.css"
	rel="stylesheet">
</head>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	loadList();
	
	$('.type').change(function(){
		var types = [];
		
		$("input[name=type]:checked").each(function(){
			types.push($(this).val());
		});
		
		var ucodeval = "${ucode}";
		var pnumval = "${pnum}";

		var allData ={"ucode" : ucodeval , "pnum": pnumval, "types": types};

		$.ajax({
			url: "chooseBpost.do",
			type: "POST",
			data: allData, 
			dataType: "Json",
			traditional: true,
			success: function(obj){
				if(obj[0].bno != null){
					var values = '<thead><tr style="vertical-align: middle; text-align: center;"><th>유형</th><th>제목</th>	<th>내용</th><th>등록일</th></tr></thead>';
					
					
					//출력용 문자열 만들기 (for in 문을 사용해보자)
					
				 for(var i in obj){
				
					 values += '<tr id="trclick'+obj[i].bno+'" onclick="detailviewload(this.id);" style="cursor:hand;">';
	
	        		   
					 if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") =="요청"){
	            		 values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #047AAC; margin-top:30px; vertical-align: middle; "'+'>요 청</strong></td>'
	            	 }
	            	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") =="진행"){
	            		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #173192; margin-top:30px; vertical-align: middle; "'+'>진 행</strong></td>'
	            	 }
	            	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") == "피드백"){
	            		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #f4b30d; margin-top:30px; vertical-align: middle; "'+'>피드백</strong></td>'
	            	 }
	            	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") == "완료"){
	            		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #0C860F; margin-top:30px; vertical-align: middle; "'+'>완 료</strong></td>'
	            	 }
	            	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") =="보류"){
	            		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #6b6d7d; margin-top:30px; vertical-align: middle; "'+'>보 류</strong></td>'
	            	 }	            	 
			            	values  +='<td  style="vertical-align: middle;">' + decodeURIComponent(obj[i].btitle).replace(/\+/gi, "  ") + "</td>"
			                 
			                      +'<td style="vertical-align: middle; ">' + decodeURIComponent(obj[i].bcontent).replace(/\+/gi, "  ") + "</td>"
			                
			                      +'<td style="vertical-align: middle; text-align: center;" >'+decodeURIComponent(obj[i].benrolldate).replace(/\+/gi, "  ")+"</td>"
			                + "</tr>"
			       } //for in
			   		 $('#selectTable').html(values); 	  
				}else{
					
				}
		       
			}, 				
			error: function(request, status, errorData){ //에러는 위에서 복붙
				console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
			}		
		});	
	}); 


	

	
});//document.ready 끗


function loadList(){
	$.ajax({
		url: "bpostload.do",
		type: "POST",
		data: { 'ucode':'${ucode}', 'pnum': '${pnum}'  },
		dataType: "Json",
		traditional: true,
		success: function(obj){

			var values = '<thead><tr style="vertical-align: middle; text-align: center;"><th style="width: 15%">유형</th><th>제목</th><th>내용</th><th>등록일</th></tr></thead>';
			
			
//1. 사용자와 관련된 전체 업무 테이블에 뿌리기		
			 for(var i in obj){
			
				 values += '<tr id="trclick'+obj[i].bno+'" onclick="detailviewload(this.id);" style="cursor:hand;">';
	       		   
				 if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") =="요청"){
	           		 values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #047AAC; margin-top:30px; vertical-align: middle; "'+'>요 청</strong></td>'
	           	 }
	           	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") =="진행"){
	           		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #173192; margin-top:30px; vertical-align: middle; "'+'>진 행</strong></td>'
	           	 }
	           	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") == "피드백"){
	           		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #f4b30d; margin-top:30px; vertical-align: middle; "'+'>피드백</strong></td>'
	           	 }
	           	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") == "완료"){
	           		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #0C860F; margin-top:30px; vertical-align: middle; "'+'>완 료</strong></td>'
	           	 }
	           	if(decodeURIComponent(obj[i].bkind).replace(/\+/gi, "  ") =="보류"){
	           		values +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #6b6d7d; margin-top:30px; vertical-align: middle; "'+'>보 류</strong></td>'
	           	 }
		            	 
		            	values  +='<td  style="vertical-align: middle;">' + decodeURIComponent(obj[i].btitle).replace(/\+/gi, "  ").substring(0, 9)  + "</td>";
		        if(decodeURIComponent(obj[i].bcontent).replace(/\+/gi, "  ") != null){
		        	values +=  '<td style="vertical-align: middle; overflow:hidden; ">' + decodeURIComponent(obj[i].bcontent).replace(/\+/gi, "  ").substring(0, 9) + "</td>";
		        }else{
		        	values +=  '<td style="vertical-align: middle; ">&nbsp;</td>';
		        }
		           
		                values  +='<td style="vertical-align: middle; text-align: center;" >'+decodeURIComponent(obj[i].benrolldate).replace(/\+/gi, "  ")+"</td>"
		                + "</tr>" ;
		       } //for in문1 끗
		   		 $('#selectTable').html(values); 
		       
	       
//2. 요청한 업무 테이블에 뿌리기 (작성자는 로그인한 사용자)
				values2 =  '<thead><tr style="vertical-align: middle; text-align: center;"><th  style="width: 15%">유형</th><th>제목</th>	<th>내용</th><th>등록일</th></tr></thead>';
				
		   		for(var j in obj){
		   		 if( obj[j].bucode == '${ucode}'  &&  decodeURIComponent(obj[j].bkind) == '요청' ){
			    	   values2 += '<tr id="trclick'+obj[j].bno+'" onclick="detailviewload(this.id);" style="cursor:hand;">';
		       		   
			           		 values2 +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #047AAC; margin-top:30px; vertical-align: middle; "'+'>요 청</strong></td>'
	
				            	values2  +='<td  style="vertical-align: middle;">' + decodeURIComponent(obj[j].btitle).replace(/\+/gi, "  ").substring(0, 9)  + "</td>"
				                 
				                      +'<td style="vertical-align: middle; ">' + decodeURIComponent(obj[j].bcontent).replace(/\+/gi, "  ").substring(0, 9)  + "</td>"
				                
				                      +'<td style="vertical-align: middle; text-align: center;" >'+decodeURIComponent(obj[j].benrolldate).replace(/\+/gi, "  ")+"</td>"
				                + "</tr>"
				               
				      $('#selectTable2').html(values2); 
			       }// for in문2 끗 	
			    
		   		}
	   		
	   	 
	   		
	   		
	   		
//3. 요청받은 업무 테이블에 뿌리기 (작성자는 로그인한 사용자가 아니고 담당자는 사용자일때)
		   		requestedBpostLoad();
		   		
		}, 				//success 끝
		error: function(request, status, errorData){ //에러는 위에서 복붙
			console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
		}
		
	});
				

	
}

function requestedBpostLoad(){

					$.ajax({
						url: "bpostload2.do",
						type: "POST",
						data: { 'ucode':'${ucode}', 'pnum': '${pnum}'  },
						dataType: "Json",
						traditional: true,
						success: function(o){

							values3 =  '<thead><tr style="vertical-align: middle; text-align: center;"><th  style="width: 15%">유형</th><th>제목</th>	<th>내용</th><th>등록일</th></tr></thead>';
				
							for(var i in o){
						
								if( ( o[i].bucode != '${ucode}' ) && ( decodeURIComponent(o[i].bkind) == '요청' ) &&  (   (decodeURIComponent(o[i].bcharge)).includes('${ucode}')  )      ){		
							    	   values3 += '<tr id="trclick'+o[i].bno+'" onclick="detailviewload(this.id);" style="cursor:hand;">';
						       		   
										 if(decodeURIComponent(o[i].bkind).replace(/\+/gi, "  ") =="요청"){
							           		 values3 +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #047AAC; margin-top:30px; vertical-align: middle; "'+'>요 청</strong></td>'
							           	 }
							           	if(decodeURIComponent(o[i].bkind).replace(/\+/gi, "  ") =="진행"){
							           		values3 +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #173192; margin-top:30px; vertical-align: middle; "'+'>진 행</strong></td>'
							           	 }
							           	if(decodeURIComponent(o[i].bkind).replace(/\+/gi, "  ") == "피드백"){
							           		values3 +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #f4b30d; margin-top:30px; vertical-align: middle; "'+'>피드백</strong></td>'
							           	 }
							           	if(decodeURIComponent(o[i].bkind).replace(/\+/gi, "  ") == "완료"){
							           		values3 +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #0C860F; margin-top:30px; vertical-align: middle; "'+'>완 료</strong></td>'
							           	 }
							           	if(decodeURIComponent(o[i].bkind).replace(/\+/gi, "  ") =="보류"){
							           		values3 +=   '<td  style="vertical-align: middle; text-align: center;"><strong style='+'"font-size:12pt; color: #6b6d7d; margin-top:30px; vertical-align: middle; "'+'>보 류</strong></td>'
							           	 }
								            	values3  +='<td  style="vertical-align: middle;">' + decodeURIComponent(o[i].btitle).replace(/\+/gi, "  ").substring(0, 9)  + "</td>"
								                 
								                      +'<td style="vertical-align: middle; ">' + decodeURIComponent(o[i].bcontent).replace(/\+/gi, "  ").substring(0, 9)  + "</td>"
								                
								                      +'<td style="vertical-align: middle; text-align: center;" >'+decodeURIComponent(o[i].benrolldate).replace(/\+/gi, "  ")+"</td>"
								                + "</tr>"
								        $('#selectTable3').html(values3);
							       }// for in문3 끗 
						   		}
							
							
						}, 				//success 끝
						error: function(request, status, errorData){ //에러는 위에서 복붙
							console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
						}
					});
				};
				
function bkindupdate(divbno) {

	var bno = divbno.replace("bkinddiv", "");
	var bkind = $("input[name=bkind]:checked").val();

	if(confirm("게시글의 유형을 변경하시겠어요 ?\n(변경 시 목록으로 돌아갑니다)")){
		
		$.ajax({
			url: "bkindupdate.do",
			data: {'bkind' : bkind, 'bno': bno}, 
			type:"post",
			dataType: "text",
			success:function(result){
				$("#selectTable").load(window.location.reload("#selectTable"));
				$("#selectTable2").load(window.location.reload("#selectTable2"));
				$("#selectTable3").load(window.location.reload("#selectTable3"));
			},
			error: function(request, status, errorData){ //에러는 위에서 복붙
				console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
			}		
		});
	}
};

	function detailviewload(id){
		var bno = id.replace('trclick', '');
	
		$.ajax({
			url: "detailview.do",
			type: "POST",
			data: {'bno' : bno}, 
			dataType: "Json",
			traditional: true,
			success: function(obj){
			
			var values = '';
			$("#detail-content").empty();
			//테이블 열고
			values += '<table class="table"  width: 100%;">';
			values += '<tr><th style="width: 18%; text-align: center; vertical-align:middle;">제목</th><td style="vertical-align:middle;">'+decodeURIComponent(obj.btitle).replace(/\+/gi, "  ")+'</td></tr>';
			
			values += '<tr><th style="width: 15%; text-align: center; vertical-align:middle;">작성자</th><td style="vertical-align:middle;">'+decodeURIComponent(obj.bwriter).replace(/\+/gi, "  ")+'</td></tr>';
			
			
			//유형
			values += '<tr><th style="width: 18%;vertical-align:middle;  text-align: center;">유형</th><td id="bkindtd">';
			
			if(decodeURIComponent(obj.bkind)=="요청"){
				 
				 values += '<div  class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary active"><input class="bkind"  type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="요청" checked="checked">요청</label>';
				 values += '<label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="진행">진행</label><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="완료" >완료</label><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="보류">보류</label></div>';
			}
          	if(decodeURIComponent(obj.bkind) =="진행"){
          		values += '<div class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="요청" >요청</label>';
				 values += '<label class="btn btn-secondary active"><input  class="bkind" type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="진행" checked="checked" >진행</label><label class="btn btn-secondary"><input  class="bkind" type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="완료">완료</label><label class="btn btn-secondary"><input  class="bkind" type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="보류">보류</label></div>';
          	 }
          	if(decodeURIComponent(obj.bkind) == "피드백"){
          		values += '<div  class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input  onclick="bkindupdate(this.id); return false;"  class="bkind" type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="요청">요청</label>';
				 values += '<label class="btn btn-secondary"><input  class="bkind" type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="진행">진행</label><label class="btn btn-secondary active"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="피드백" checked="checked">피드백</label>';
				 values += '<label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="완료" >완료</label><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="보류">보류</label></div>';
          	 }
          	if(decodeURIComponent(obj.bkind) == "완료"){
          		values += '<div  class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="요청">요청</label>';
				 values += '<label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="진행">진행</label><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary active"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="완료" checked="checked">완료</label><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="보류">보류</label></div>';
          	 }
          	if(decodeURIComponent(obj.bkind) =="보류"){
          		values += '<div class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;" value="요청">요청</label>';
				 values += '<label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="진행">진행</label><label class="btn btn-secondary"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary"><input  class="bkind" type="radio" name="bkind" id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="완료">완료</label><label class="btn btn-secondary active"><input class="bkind"  type="radio" name="bkind"  id="bkinddiv'+obj.bno+'" onclick="bkindupdate(this.id); return false;"  value="보류" checked="checked">보류</label></div>';
          	 }	
            values += '</td></tr>';
			      
           	
           	if(obj.bchargename != null){
           		values += '<tr><th style="width: 15%; text-align: center; vertical-align:middle;">담당자</th><td style="vertical-align:middle;">'+decodeURIComponent(obj.bchargename).replace(/\,/gi, ",  ")+'</td></tr>';
           	 }	  
           	
        	if(obj.bstartday != null){
           		values += '<tr><th style="width: 15%; text-align: center; vertical-align:middle;">날짜</th><td style="vertical-align:middle;">'+decodeURIComponent(obj.bstartday)+'&nbsp;&nbsp;~&nbsp;&nbsp;'+decodeURIComponent(obj.bendday)+'</td></tr>';
           	 }	     
           	
        	if(obj.bcontent != null){
        		values += '<tr><th style="width: 15%; text-align: center; vertical-align:middle;">내용</th><td style="vertical-align:middle;">'+decodeURIComponent(obj.bcontent).replace(/\+/gi, "  ")+'</td></tr>';
        	}
        	
        	if(obj.boriginfile != null){
        		
        		values += '<tr><th style="width: 15%; text-align: center; vertical-align:middle;">파일</th>';
        		values += '<td style="vertical-align:middle;align-items: center;">';
        		if(decodeURIComponent(obj.boriginfile).replace(/\+/gi, "  ").includes('jpg')){
        			values += '<div id="showfile" style=" text-align: center;  overflow: hidden; width: 200px;  height: 150px;"><img style="max-width: 100%; height: auto;" src="resources/bupfile/'+decodeURIComponent(obj.brenamefile).replace(/\+/gi, "  ")+'"></div><br>';
        		}
        		values += '<a href="bfdown.do?ofile='+decodeURIComponent(obj.boriginfile).replace(/\+/gi, "  ")+'&rfile='+decodeURIComponent(obj.brenamefile).replace(/\+/gi, "  ")+'">'+decodeURIComponent(obj.boriginfile).replace(/\+/gi, "  ")+'</a></td></tr>';
        	}
			if(obj.bucode == '${ucode}'){
				values += '<tr><td colspan="2" style="vertical-align:middle; text-align: right;"><button id="upbutton'+obj.bno+'" class="btn btn-sm btn-outline-info" onclick="moveUpdate(this.id); return false;">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button  id="delbutton'+obj.bno+'"  class="btn btn-sm btn-outline-danger" onclick="deleteBpost(this.id); return false;">삭제</button>&nbsp;</td></tr>';
			}
			values += '</table>';
	   		 $('#detail-content').html(values); 	       
			}, 				
			error: function(request, status, errorData){ //에러는 위에서 복붙
				console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
			}		
		});	
		$('#detailModal').show();
	};

	
	function moveUpdate(id){
		$('#detailModal').hide();
		var bno = id.replace('upbutton', '');
		
		$.ajax({
			url: "moveUpdateModal.do",
			type: "POST",
			data: {'bno' : bno, 'pnum': '${sessionScope.pnum}'}, 
			dataType: "Json",
			traditional: true,
			success: function(obj){
			
			var values = '';
			$("#update-content").empty();
			//폼 열고 테이블 열고
			values += '<form action="bpostup.do" method="post" id="bupdate" enctype="multipart/form-data"><table class="table" style="text-align: center; width: 100%;">';
			//히든 값 전달부분
			values += '<input type ="hidden" name="bno" value="'+obj.bno+'"><input type="hidden" name="bucode" value="${sessionScope.ucode }"><input type="hidden" name="bpnum" value="${sessionScope.pnum }"><input type="hidden" id="bform" name="bcharge">';
			//제목
			values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;">제목</th><td><input type="text" name="btitle" maxlength="20" class="form-control" placeholder="일정 제목을 입력하세요" required="required" value="'+decodeURIComponent(obj.btitle).replace(/\+/gi, "  ")+'"></td></tr>';
			//유형
			values += '<tr><th style="width: 18%;vertical-align:middle;  text-align: center;">유형</th><td>';
			
			if(decodeURIComponent(obj.bkind)=="요청"){
				 values += '<div class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary active"><input type="radio" name="bkind" id="option1" value="요청" checked="checked">요청</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option2" value="진행">진행</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="완료">완료</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="보류">보류</label></div>';
          	}
          	if(decodeURIComponent(obj.bkind) =="진행"){
          		values += '<div class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input type="radio" name="bkind" id="option1" value="요청" >요청</label>';
				 values += '<label class="btn btn-secondary active"><input type="radio" name="bkind" id="option2" value="진행" checked="checked" >진행</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="완료">완료</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="보류">보류</label></div>';
          	 }
          	if(decodeURIComponent(obj.bkind) == "피드백"){
          		values += '<div class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input type="radio" name="bkind" id="option1" value="요청">요청</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option2" value="진행">진행</label><label class="btn btn-secondary active"><input type="radio" name="bkind" id="option3" value="피드백" checked="checked">피드백</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="완료" >완료</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="보류">보류</label></div>';
          	 }
          	if(decodeURIComponent(obj.bkind) == "완료"){
          		values += '<div class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input type="radio" name="bkind" id="option1" value="요청">요청</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option2" value="진행">진행</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary active"><input type="radio" name="bkind" id="option3" value="완료" checked="checked">완료</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="보류">보류</label></div>';
          	 }
          	if(decodeURIComponent(obj.bkind) =="보류"){
          		values += '<div class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-secondary"><input type="radio" name="bkind" id="option1" value="요청">요청</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option2" value="진행">진행</label><label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="피드백">피드백</label>';
				 values += '<label class="btn btn-secondary"><input type="radio" name="bkind" id="option3" value="완료">완료</label><label class="btn btn-secondary active"><input type="radio" name="bkind" id="option3" value="보류" checked="checked">보류</label></div>';
          	 }	
            values += '</td></tr>';
 
            //담당자
            values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;" >담당자</th><td style="vertical-align:middle; text-align: left;">기존 담당자  : &nbsp; '+decodeURIComponent(obj.bchargename).replace(/\,/gi, ",  ")+'<br>';
            values += '<div style="padding-top: 10px; padding-bottom: 0px; margin-bottom: 0px;"><nav class="navbar navbar-expand navbar-light bg-light mb-4">';
            values += '<div class="dropdown"><button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">담당자 수정</button><div id="selectedcc"></div><div class="dropdown-menu" aria-labelledby="dropdownMenu2">';

            <c:forEach var="i" items="${pmlist}" varStatus="status">
				values += '<button class="dropdown-item" type="button" onclick="addbcharge${status.index}();" value="${i.ucode}">${i.uname}</button>';
				values += '<input type="checkbox" id="user${status.index}" name="bcharge" style="display: none">';
				values += '<input type="checkbox" id="name${status.index}" name="bchargename" style="display: none">';
			</c:forEach>
			values += '</div></div></nav></div></td></tr>';
            					
            //시작날짜 & 끝날짜
			if(obj.bstartday != null){
           		values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;" >시작날짜</th><td><input type="date" class="form-control" name="bstartday" value="'+obj.bstartday+'"></td></tr>';
           		values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;" >끝날짜</th><td><input type="date" class="form-control" name="bendday" value="'+obj.bendday+'"></td></tr>';
			}
			
			//내용
			if(obj.bcontent != null){
        		values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;" >내용</th><td><textarea cols="50" rows="6" class="w-100 form-control" name="bcontent">'+decodeURIComponent(obj.bcontent).replace(/\+/gi, "  ")+'</textarea></td></tr>';
        	}else{
        		values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;" >내용</th><td><textarea cols="50" rows="6" class="w-100 form-control" name="bcontent"></textarea></td></tr>';
        	}
			
			//파일 있을 때
		   if(obj.boriginfile != null){
			   values += '<input type="hidden" name="boriginfile" value="'+decodeURIComponent(obj.boriginfile).replace(/\+/gi, "  ")+'"><input type="hidden" name="brenamefile" value="'+decodeURIComponent(obj.brenamefile).replace(/\+/gi, "  ")+'">';
				
			   values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;" >파일</th><td style="vertical-align:middle; text-align: left;">'+decodeURIComponent(obj.boriginfile).replace(/\+/gi, "  ");
			   values += '${post.boriginfile }&nbsp;&nbsp;&nbsp;<input type="checkbox" name="deleteFlag" value="yes">삭제<br><br><input type="file" name="upfile">';
			   values += '</td></tr>';
        	}
			// 파일 없을 때
		   if(obj.boriginfile == null){
			   values += '<tr><th style="width: 18%;vertical-align:middle; text-align: center;" >파일</th><td style="vertical-align:middle; text-align: left;">';
			   values += '<input class="form-control" type="file" name="upfile">';
			   values += '</td></tr>';
       		}
			
			//서브밋 버튼 
			
			values += '<tr><td colspan="2"><button type="submit" class="btn btn-sm btn-info" value="수정완료 ">수정완료</button>&nbsp;&nbsp;<button type="reset" class="btn btn-sm btn-danger">원래대로</button></td></tr>';
			
			//테이블 닫고 폼 닫고
			values += '</table></form>';
			
	   		 $('#update-content').html(values); 	       
			
			
			},
			error: function(request, status, errorData){ 
				console.log("error code : " + request.status + "\nMessage : "+ request.responseText + "\nError : " + errorData);
			}		
		});	

		$('#updateModal').show();

	};
	
	
	function deleteBpost(id){
		var bno = id.replace("delbutton", "");
		alert(bno);
		if(confirm("정말로 삭제하시겠습니까")){
			location.href='bpostdel.do?bno='+bno;
		}
	}	

	//팝업 Close 기능
	function close_pop(flag) {
		
	     $('.modalD').hide();
	};

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	function bkindshow(){
		$("#'${b.bkind}'").button('toggle')
	}
	function addbcharge0(){
	     var name = $(event.target).text();
	     var code = $(event.target).val();	      
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	       $('#name0').val(name);
	       $('#user0').val(code);
	       $("input:checkbox[id='user0']").prop("checked", true);
	       $("input:checkbox[id='name0']").prop("checked", true);  
	   }
	function addbcharge1(){
	   var name = $(event.target).text();
	   var code = $(event.target).val();	   
	    $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');    
	    $('#name1').val(name);
	    $('#user1').val(code);
	    $("input:checkbox[id='user1']").prop("checked", true);
	    $("input:checkbox[id='name1']").prop("checked", true);	    	    
	}
	function addbcharge2(){
	      var name = $(event.target).text();
	      var code = $(event.target).val();
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	      $('#name2').val(name);
	       $('#user2').val(code);
	       $("input:checkbox[id='user2']").prop("checked", true);
	       $("input:checkbox[id='name2']").prop("checked", true);          
	   }
	function addbcharge3(){
	      var name = $(event.target).text();
	      var code = $(event.target).val();
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');    
	      $('#name3').val(name);
	       $('#user3').val(code);
	       $("input:checkbox[id='user3']").prop("checked", true);
	       $("input:checkbox[id='name3']").prop("checked", true);   
	   }
	function addbcharge4(){
	      var name = $(event.target).text();
	      var code = $(event.target).val();
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	      $('#name4').val(name);
	       $('#user4').val(code);
	       $("input:checkbox[id='user4']").prop("checked", true);
	       $("input:checkbox[id='name4']").prop("checked", true);	       
	   }
	function addbcharge5(){
	      var name = $(event.target).text();
	      var code = $(event.target).val();	     
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	      $('#name5').val(name);
	       $('#user5').val(code);
	       $("input:checkbox[id='user5']").prop("checked", true);
	       $("input:checkbox[id='name5']").prop("checked", true);

	   }
	function addbcharge6(){
	      var name = $(event.target).text();
	      var code = $(event.target).val();
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');
	       $('#user6').val(code);
	       $('#name6').val(name);
	       $("input:checkbox[id='user6']").prop("checked", true);
	       $("input:checkbox[id='name6']").prop("checked", true);
	   }
	
	function addbcharge7(){
	     var name = $(event.target).text();
	     var code = $(event.target).val();	      
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	       $('#name7').val(name);
	       $('#user7').val(code);
	       $("input:checkbox[id='user7']").prop("checked", true);
	       $("input:checkbox[id='name7']").prop("checked", true);  
	   }
	
	function addbcharge8(){
	     var name = $(event.target).text();
	     var code = $(event.target).val();	      
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	       $('#name8').val(name);
	       $('#user8').val(code);
	       $("input:checkbox[id='user8']").prop("checked", true);
	       $("input:checkbox[id='name8']").prop("checked", true);  
	   }
	
	function addbcharge0(){
	     var name = $(event.target).text();
	     var code = $(event.target).val();	      
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	       $('#name0').val(name);
	       $('#user0').val(code);
	       $("input:checkbox[id='user0']").prop("checked", true);
	       $("input:checkbox[id='name0']").prop("checked", true);  
	   }
	function addbcharge0(){
	     var name = $(event.target).text();
	     var code = $(event.target).val();	      
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	       $('#name0').val(name);
	       $('#user0').val(code);
	       $("input:checkbox[id='user0']").prop("checked", true);
	       $("input:checkbox[id='name0']").prop("checked", true);  
	   }
	function addbcharge9(){
	     var name = $(event.target).text();
	     var code = $(event.target).val();	      
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	       $('#name9').val(name);
	       $('#user9').val(code);
	       $("input:checkbox[id='user9']").prop("checked", true);
	       $("input:checkbox[id='name9']").prop("checked", true);  
	   }
	function addbcharge10(){
	     var name = $(event.target).text();
	     var code = $(event.target).val();	      
	       $('#selectedcc').before('<span>'+name + '&nbsp; <i class="fa fa-times" onclick="unSelected()"></i></span>');	       
	       $('#name10').val(name);
	       $('#user10').val(code);
	       $("input:checkbox[id='user10']").prop("checked", true);
	       $("input:checkbox[id='name10']").prop("checked", true);  
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

<!-- 1.탑바 임포트 -->
	<c:import url="/WEB-INF/views/suugit/topbar.jsp"></c:import>
	
<!-- 2.바로아래div추가 및 임포트 추가  -->
	<div style="width:100%;display:flex;justify-content:center;align-item:center;">
<!-- Sidebar2right -->
     <c:import url="/WEB-INF/views/red/sideFixed.jsp"></c:import>
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
					<br> <br> <br> <br>
					<!-- End of Topbar -->

					<!-- Begin Page Content -->
					<div class="container-fluid col-text-left float-left" style="min-width: fit-content; max-width: 97%;">

					 <div class="card mb-4" style="border-style:none;max-width: 97%; ">
			<br>
			<h4 style="text-align:center;  color: #19BFAF; " ><strong>${sessionScope.uname } 님의 업무 모아보기</strong></h4>		           
					           <div class="card-body" id="bposttab" style="margin: 0px;">
					        
					          <ul class="nav nav-tabs" style="margin-bottom: 0px; width: 100%;" id="myTab" role="tablist">
							<li class="nav-item">
							    <a class="nav-link active" id="allBpost-tab" data-toggle="tab" href="#allBpost" role="tab" aria-controls="allBpost" ><strong>전체업무</strong></a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link " id="request-tab" data-toggle="tab" href="#request" role="tab" aria-controls="request" ><strong>요청한 업무</strong></a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="requested-tab" data-toggle="tab" href="#requested" role="tab" aria-controls="requested" ><strong>요청받은 업무</strong></a>
							  </li>
							  </ul>
					        </div>
					        
					        
		          
 <div class="tab-content mt-3">
 
<!--  업무 전체 모아보기 --> 
 <div class="tab-pane fade show active" id="allBpost" role="tabpanel" aria-labelledby="nav-allBpost-tab">

<div id="tableview" style="border: none;" class="card mb-4 py-3 ">

<div class="card-body" style="overflow: auto;">
<div class="checks" align="right" style="margin-left: 1%; font-size: 17px; font-weight: bold; " >
<form action="#">
	<span style="color: #42BBBA;"><label class="checkbox-inline"><input id="inlineCheckbox1" class="type" name="type" type="checkbox"  value="요청" checked="checked">&nbsp;요 청&nbsp;&nbsp;&nbsp;&nbsp; </label></span>
<span style="color: #42BBBA;"><label class="checkbox-inline"><input id="inlineCheckbox2" class="type" name="type" type="checkbox"  value="진행" checked="checked">&nbsp;진 행&nbsp;&nbsp;&nbsp;&nbsp; </label></span>
<span style="color: #42BBBA;"><label class="checkbox-inline"><input id="inlineCheckbox3" class="type" name="type" type="checkbox"  value="피드백" checked="checked">&nbsp;피드백&nbsp;&nbsp;&nbsp;&nbsp; </label></span>
<span style="color: #42BBBA;"><label class="checkbox-inline"><input id="inlineCheckbox4" class="type" name="type" type="checkbox"  value="완료" checked="checked">&nbsp;완 료&nbsp;&nbsp;&nbsp;&nbsp; </label></span>
<span style="color: #42BBBA;"><label class="checkbox-inline"><input id="inlineCheckbox5" class="type" name="type" type="checkbox" value="보류" checked="checked">&nbsp;보 류&nbsp;&nbsp;&nbsp;&nbsp; </label></span>
	</form>
</div>
				<div id ="bpost_table"  class="table-responsive">
				
				
					<table class="table table-hover" id="selectTable"
						style="width: 100%; cellspacing: 0; table-layout: fixed; word-spacing:break-all; overflow: auto;">
			<colgroup>
			    <col style="width:15%" >
			    <col style="width:25%">
			    <col style="width:40%">
			    <col style="width:20%">
			  </colgroup> 
				<thead>
					<tr style="text-align: center; vertical-align: middle;">
						<th>유형</th>
						<th>제목</th>
						<th>내용</th>													
						<th>등록일</th>
					</tr>
				</thead>
				
				<tbody id = "bpost_tbody">
				<tr><td style="text-align: center; vertical-align: middle;" colspan="4">조회하신 업무 게시글이 없습니다</td></tr>
				</tbody>
				
			</table>

		</div>
	</div>
</div>
</div>
					          
	
	
	
					          
<!-- 요청한 업무 -->
<div class="tab-pane fade " id="request" role="tabpanel" aria-labelledby="nav-request-tab">
    
<div id="tableview2" style="border: none;" class="card mb-4 py-3 ">
<div class="card-body" style="overflow: auto;">

				<div id ="bpost_table2"  class="table-responsive">
		
					<table class="table table-hover" id="selectTable2"		style="width: 100%; cellspacing: 0; table-layout: fixed; ">
			<colgroup>
			    <col style="width:15%" >
			    <col style="width:25%">
			    <col style="width:40%">
			    <col style="width:20%">
			  </colgroup> 
				<thead>
					<tr style="text-align: center; vertical-align: middle;">
						<th>유형</th>
						<th>제목</th>
						<th>내용</th>													
						<th>등록일</th>
					</tr>
				</thead>
				
				<tr><td style="text-align: center; vertical-align: middle;" colspan="4">요청하신 업무가 없습니다</td></tr>
				<tbody id = "bpost_tbody2">
				
				</tbody>
				
			</table>

		</div>
	</div>
</div>
</div>
					       
			




<!-- 요청받은 업무 -->		       
<div class="tab-pane fade" id="requested" role="tabpanel" aria-labelledby="nav-requested-tab">
<div id="tableview3" style="border: none;" class="card mb-4 py-3 ">
<div class="card-body" style="overflow: auto;">

				<div id ="bpost_table3"  class="table-responsive">
		
					<table class="table table-hover" id="selectTable3" style="width: 100%; cellspacing: 0;" style="overflow: auto; table-layout: fixed; ">
			<colgroup>
			    <col style="width:15%" >
			    <col style="width:25%">
			    <col style="width:40%">
			    <col style="width:20%">
			  </colgroup> 
				<thead>
					<tr style="text-align: center; vertical-align: middle;">
						<th>유형</th>
						<th>제목</th>
						<th>내용</th>													
						<th>등록일</th>
					</tr>
				</thead>
				
				<tbody id = "bpost_tbody3">
				<tr><td style="text-align: center; vertical-align: middle;" colspan="4">요청받은 업무가 없습니다</td></tr>
				</tbody>
				
			</table>

		</div>
	</div>
</div>

</div>

<!-- 상세보기 페이지 -->

    <!-- The Modal -->
    <div id="detailModal" class="modalD"  >
 
      <!-- Modal content -->
      <div class="modalD-content" style="width: 40%; max-height: 90%; overflow: auto;">
      		<div id="detail-content" >
      		 	<table id="detail-table" class="table" style="overflow: auto;">
      		 	
      		 	</table>
                
      		</div>
               
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     목록으로
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
        
        
<!-- 수정 페이지 -->

    <!-- The Modal -->
    <div id="updateModal" class="modalD"  >
 
      <!-- Modal content -->
      <div class="modalD-content" style="width: 40%; max-height: 90%; overflow: auto;">
      		<div id="update-content" >
      		 	<table id="update-table" class="table" style="overflow: auto;">
      		 	
      		 	</table>
                
      		</div>
               
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     목록으로
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->

			       
</div><!-- tab-content mt-3 끝 -->
					      

					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer style="align-content: flex-end;" class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2020</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->
			<div style="width: 25%"></div>
		</div>
		<!-- End of Page Wrapper -->
	</div>
	<!-- div flex -->
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	  
	
	<!-- Bootstrap core JavaScript-->
	<script src="/hwabo/resources/maincss/vendor/jquery/jquery.min.js"></script>
	<script src="/hwabo/resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/hwabo/resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/hwabo/resources/maincss/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="/hwabo/resources/maincss/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/hwabo/resources/maincss/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="/hwabo/resources/maincss/js/demo/datatables-demo.js"></script>






</body>

</html>