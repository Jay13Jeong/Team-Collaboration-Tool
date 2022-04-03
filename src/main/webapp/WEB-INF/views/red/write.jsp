<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="icon" type="image/x-icon" href="/hwabo/resources/assets/img/favicon.png" />
  <title>HWABO</title>
</head>
<body id="page-top">
<!-- 팝업시작 -->
<table style="position:fixed;z-index:8; width:100%;height:100%;">
<tr><td>&nbsp;</td><td style="height:20%;">&nbsp;</td><td>&nbsp;</td></tr>
<tr><td style="width:30%;"></td><td style="width:40%;height:45%;">
<!-- 팝업내용 시작 -->
<div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
              <!-- 게시글안쪽 -->
              <form action="ftables.do" id="mainInsert">
              <table style="text-align:center;width:100%;">
              <tbody><tr class="m-0 font-weight-bold text-primary"><td style="width:20%;">
              <span>글작성</span>
              </td><td style="width:20%;">
              <span>업무</span>
              </td><td style="width:20%;">
              <span>일정</span>
              </td><td style="width:20%;">
              <span>할일</span>
              </td><td style="width:20%;">
              <span>투표</span>
              </td></tr>
              <tr><td colspan="5">
              <hr>
              </td></tr>
              <tr><td colspan="5">
              <input type="text" class="form-control" placeholder="일정 제목을 입력하세요">
              </td></tr>
              <tr><td colspan="5">&nbsp;</td></tr>
              <tr><td colspan="2">
              <input type="date" class="form-control">
              </td><td>
              <img src="/hwabo/resources/maincss/img/tilde.png" style="width:100px;height:35px;">
              </td><td colspan="2">
              <input type="date" class="form-control">
              </td></tr>
              <tr><td colspan="5">&nbsp;</td></tr>
              <tr><td colspan="5">
              <input type="text" class="form-control" placeholder="장소를 입력하세요">
              </td></tr>
              <tr><td colspan="5">&nbsp;</td></tr>
              <tr><td colspan="5">
              <input type="text" class="form-control" placeholder="일정 제목을 입력하세요">
              </td></tr>
              <tr><td colspan="5">&nbsp;</td></tr>
              <tr><td colspan="5">
              <input type="text" class="form-control" placeholder="메모를 입력하세요">
              </td></tr>
              <tr><td colspan="5">&nbsp;</td></tr>
              <tr><td colspan="3"></td>
              <td>
              <a class="btn btn-success btn-icon-split" href="javascript:mainInsert.submit();" style="width:90%;">
                    <span class="text">등록</span>
                  </a>
              </td><td>
              <a href="ftables.do" class="btn btn-danger btn-icon-split" style="width:90%;">
                    <span class="text">취소</span>
              </a>
              </td></tr>
              </tbody></table>
              </form>
            </div>
          </div>
<!-- 팝업내용 끝 -->
</td><td style="width:30%;"></td></tr>
<tr><td>&nbsp;</td><td style="height:35%;">&nbsp;</td><td>&nbsp;</td></tr>      
</table>
<!-- 팝업끝 -->
<c:import url="/WEB-INF/views/red/tables.jsp"></c:import>
</body>
</html>
