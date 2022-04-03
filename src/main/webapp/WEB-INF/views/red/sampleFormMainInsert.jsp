<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>

<div class="card shadow mb-4">
            <div class="card-header py-3">
            글작성 샘플 폼입니다
            </div>
            <div class="card-body">
              <!-- 게시글안쪽 -->
              <form action="ftables.do?project_num=${ sessionScope.pnum }" id="mainInsert" method="GET">
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
              <a class="btn btn-success btn-icon-split" href="ftables.do?project_num=${ sessionScope.pnum }" style="width:90%;">
                    <span class="text">등록</span>
                  </a>
              </td><td>
              <a href="ftables.do?project_num=${ sessionScope.pnum }" class="btn btn-danger btn-icon-split" style="width:90%;">
                    <span class="text">취소</span>
              </a>
              </td></tr>
              </tbody></table>
              </form>
            </div>
          </div>

</body>
