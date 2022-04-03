<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <link rel="icon" type="image/x-icon" href="/hwabo/resources/assets/img/favicon.png" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HWABO</title>

  <!-- Custom fonts for this template-->
  <link href="/hwabo/resources/maincss/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/hwabo/resources/maincss/css/sb-admin-2.css" rel="stylesheet">
<!-- 차트기능시작 -->
<style>
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;  
}

.donut-chart {
  position: relative;
	width: 200px;
  height: 200px;
	margin: 0 auto 2rem;
	border-radius: 100%
 }
p.center {
  background: white;
  position: absolute;
  text-align: center;
font-size: 28px;
  top:0;left:0;bottom:0;right:0;
  width: 170px;
  height: 170px;
  margin: auto;
  border-radius: 50%;
  line-height: 35px;
  padding: 15% 0 0;
}
	
	
.portion-block {
    border-radius: 50%;
    clip: rect(0px, 200px, 200px, 100px);
    height: 100%;
    position: absolute;
    width: 100%;
  }
.circle {
    border-radius: 50%;
    clip: rect(0px, 100px, 200px, 0px);
    height: 100%;
    position: absolute;
    width: 100%;
    font-family: monospace;
    font-size: 1.5rem;
  }
	
	
#part1 {
    transform: rotate(0deg);
  }

	#part1 .circle {
		background-color: #E64C65;
		/*transform: rotate(76deg);*/
		animation: first 1s 1 forwards;
	  }
	
	
#part2 {
    transform: rotate(100deg);
  }
#part2 .circle {
    background-color: #11A8AB;
    animation: second 1s 1 forwards 1s;
  }
#part3 {
    transform: rotate(250deg);
}
	#part3 .circle {
		background-color: #4FC4F6;
		animation: third 0.5s 1 forwards 2s;
	}
	
	
/* Animation */
@keyframes first {
    from {transform: rotate(0deg);}
    to {transform: rotate(100deg);}
}
	
@keyframes second {
    from {transform: rotate(0deg);}
    to {transform: rotate(150deg);}
}
	
@keyframes third {
    from {transform: rotate(0deg);}
    to {transform: rotate(111deg);}
}

</style>

<!-- 차트기능끝 -->
</head>

<body id="page-top">
<!-- 테스트버튼 시작 -->
<div style="position:absolute;z-index:5;"><br>&nbsp;
	원하는 페이지로 :
    <button onclick="javascript:location.href='red.do'">index</button>
    <button onclick="javascript:location.href='404.do'">404</button>
    <button onclick="javascript:location.href='blank.do'">blank</button>
    <button onclick="javascript:location.href='buttons.do'">buttons</button>
    <button onclick="javascript:location.href='cards.do'">cards</button>
    <button onclick="javascript:location.href='charts.do'">charts</button>
    <button onclick="javascript:location.href='fpassword.do'">forgot-password</button>
    <button onclick="javascript:location.href='flogin.do'">login</button>
    <button onclick="javascript:location.href='fregister.do'">register</button>
    <button onclick="javascript:location.href='ftables.do'">tables</button>
    <button onclick="javascript:location.href='fanimation.do'">utilities-animation</button>
    <button onclick="javascript:location.href='fborder.do'">utilities-border</button>
    <button onclick="javascript:location.href='fcolor.do'">utilities-color</button>
    <button onclick="javascript:location.href='fother.do'">utilities-other</button>
    </div>
<div style="background-color:#F8E0E6;border:2px solid black;"><br><br><br></div>
<!-- 테스트버튼 끝 -->
<!-- 테스트버튼2 시작 -->
<div style="position:absolute;z-index:5;"><br>&nbsp;
	원하는 페이지로 :
    <button onclick="javascript:location.href='cards.do'">프로젝트 시작페이지</button>
    <button onclick="javascript:location.href='ftables.do'">메인(sns형)</button>
    <button onclick="javascript:location.href='fborder.do'">메인(캘린더형)</button>
    <button onclick="javascript:location.href='fother.do'">진행률 상세보기</button>
    </div>
<div style="background-color:skyblue;border:1px solid black;"><br><br><br></div>
<!-- 테스트버튼2 끝 -->
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
     <c:import url="/WEB-INF/views/red/enterside.jsp"></c:import>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler Â· 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun Â· 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog Â· 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
<!-- 프로젝트생성시작 -->
<div class="card shadow mb-4">
            <div class="card-body">
              <!-- 게시글안쪽 -->
                            <h1 class="m-0 text-primary" style="text-align:center" onclick="javascript:location.href='createP.do'">
                <img src="/hwabo/resources/maincss/img/plus2.png" style="width:45px;height:45px;">            
                            새 프로젝트 생성
                            </h1>


            </div>
          </div>
          <!-- 프로젝트생성끝 -->
         <div class="row">
         <!-- 프로젝트시작 -->
<div class="col-xl-4 col-lg-5" >
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">관공서 UI 12월16일 마감</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">즐겨찾기 등록</a>
                      <a class="dropdown-item" href="#">프로젝트 복사</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">프로젝트 삭제</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" onclick="javascript:location.href='fborder.do'">
                  <!-- 그래프시작 -->
                  <div class="container">
  <div class="donut-chart-block block"> 
		<div class="donut-chart">
			<div id="part1" class="portion-block"><div class="circle"></div></div>
			<div id="part2" class="portion-block"><div class="circle"></div></div>
			<div id="part3" class="portion-block"><div class="circle"></div></div>
			<p class="center"></p>        
		</div>
   </div>
</div>
<!-- 그래프끝 -->
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 구름과자 30%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 소나기 50%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 호로록 20%
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <!-- 프로젝트끝 -->
            <!-- 프로젝트시작 -->
           <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">google project2</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">즐겨찾기 등록</a>
                      <a class="dropdown-item" href="#">프로젝트 복사</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">프로젝트 삭제</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" onclick="javascript:location.href='fborder.do'">
                <!-- 그래프시작 -->
                  <div class="container">
  <div class="donut-chart-block block"> 
		<div class="donut-chart">
			<div id="part1" class="portion-block"><div class="circle"></div></div>
			<div id="part2" class="portion-block"><div class="circle"></div></div>
			<div id="part3" class="portion-block"><div class="circle"></div></div>
			<p class="center"></p>        
		</div>
   </div>
</div>
<!-- 그래프끝 -->
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 감전직전 40%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 팟수 50%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 줄넘기자빠짐 10%
                    </span>
                  </div>
                </div>
              </div>
            </div>
<!-- 프로젝트끝 -->
<!-- 프로젝트시작 -->
            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">clone kakaoTalk</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">즐겨찾기 등록</a>
                      <a class="dropdown-item" href="#">프로젝트 복사</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">프로젝트 삭제</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" onclick="javascript:location.href='fborder.do'">
                  <!-- 그래프시작 -->
                  <div class="container">
  <div class="donut-chart-block block"> 
		<div class="donut-chart">
			<div id="part1" class="portion-block"><div class="circle"></div></div>
			<div id="part2" class="portion-block"><div class="circle"></div></div>
			<div id="part3" class="portion-block"><div class="circle"></div></div>
			<p class="center"></p>        
		</div>
   </div>
</div>
<!-- 그래프끝 -->
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 마차 0%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 어제먹은밥 80%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 펭귀뒤통수 20%
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <!-- 프로젝트끝 -->
          </div>
          <div class="row">
          <!-- 프로젝트시작 -->
<div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">beet</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">즐겨찾기 등록</a>
                      <a class="dropdown-item" href="#">프로젝트 복사</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">프로젝트 삭제</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" onclick="javascript:location.href='fborder.do'">
                  <!-- 그래프시작 -->
                  <div class="container">
  <div class="donut-chart-block block"> 
		<div class="donut-chart">
			<div id="part1" class="portion-block"><div class="circle"></div></div>
			<div id="part2" class="portion-block"><div class="circle"></div></div>
			<div id="part3" class="portion-block"><div class="circle"></div></div>
			<p class="center"></p>        
		</div>
   </div>
</div>
<!-- 그래프끝 -->
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 도도로 25%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 재로 15%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 병목아야 60%
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <!-- 프로젝트끝 -->
            <!-- 프로젝트시작 -->
           <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">naehaksa</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">즐겨찾기 등록</a>
                      <a class="dropdown-item" href="#">프로젝트 복사</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">프로젝트 삭제</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" onclick="javascript:location.href='fborder.do'">
                  <!-- 그래프시작 -->
                  <div class="container">
  <div class="donut-chart-block block"> 
		<div class="donut-chart">
			<div id="part1" class="portion-block"><div class="circle"></div></div>
			<div id="part2" class="portion-block"><div class="circle"></div></div>
			<div id="part3" class="portion-block"><div class="circle"></div></div>
			<p class="center"></p>        
		</div>
   </div>
</div>
<!-- 그래프끝 -->
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 뚜기 50%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 보자기 10%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 오호선 40%
                    </span>
                  </div>
                </div>
              </div>
            </div>
<!-- 프로젝트끝 -->
<!-- 프로젝트시작 -->
            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">팡팡팡</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">즐겨찾기 등록</a>
                      <a class="dropdown-item" href="#">프로젝트 복사</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">프로젝트 삭제</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" onclick="javascript:location.href='fborder.do'">
                  <!-- 그래프시작 -->
                  <div class="container">
  <div class="donut-chart-block block"> 
		<div class="donut-chart">
			<div id="part1" class="portion-block"><div class="circle"></div></div>
			<div id="part2" class="portion-block"><div class="circle"></div></div>
			<div id="part3" class="portion-block"><div class="circle"></div></div>
			<p class="center"></p>        
		</div>
   </div>
</div>
<!-- 그래프끝 -->
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> abc 34%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> kyukyu 33%
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> suggit 33%
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <!-- 프로젝트끝 -->
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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery/jquery.min.js"></script>
  <script src="/hwabo/resources/maincss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/hwabo/resources/maincss/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/hwabo/resources/maincss/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/hwabo/resources/maincss/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/hwabo/resources/maincss/js/demo/chart-area-demo.js"></script>
  <script src="/hwabo/resources/maincss/js/demo/chart-pie-demo.js"></script>
<!-- 차트기능불러오기 시작 -->
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<!-- 차트기능불러오기 끝 -->
</body>

</html>
