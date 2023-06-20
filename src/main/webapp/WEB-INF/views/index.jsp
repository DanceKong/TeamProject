<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<style>
.video_modal_popup.reveal {
    display: flex;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    justify-content: center;
    align-items: center;
    z-index: 9999999
}

.video_modal_popup .video-wrapper {
    position: relative;
    width: 80%;
    padding-bottom: 45%;
    z-index: 10
}

.video_modal_popup .video-wrapper iframe {
    position: absolute;
    width: 100%;
    height: 100%;
}

.video_modal_popup.reveal .video_modal_popup-closer {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, .5);
    z-index: 9999999
}
</style>
   		<style>
 		 div.a{float:center; height:auto; width:auto; margin: 1px; border :1px ; text-align:center;}

		</style>
    
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>영화 카페</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="resources/css/styles.css" rel="stylesheet" />
        <link href="resources/css/btn.css" rel="stylesheet" />
        
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed" style="background-color:#000000">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
         <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/">Movie Commu</a>
        
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="#">
                   <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                   <c:choose>
                   <c:when test="${sessionScope.username==null}">
                    <span style="color: white; font-size: 22px;" >로그인을 해주세요</span>
                   </c:when>
                   <c:when test="${sessionScope.username!=null}">
                    <span style="color: white; font-size: 22px;" >${sessionScope.username } [ ${sessionScope.name } ]</span>
                   </c:when>
                   </c:choose>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <c:choose>
                     <c:when test="${sessionScope.username==null}">
                        <li><a class="dropdown-item" href="/login">Login</a></li>
                        <li><a class="dropdown-item" href="/join">Join</a></li>
                        </c:when>
               <c:otherwise>
                  <li><a class="dropdown-item" href="/mypage">Mypage</a></li>
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                         </c:otherwise>
                    </c:choose>
                    </ul>
                </li>
            </ul>
                </div>
            </form>
        </nav>
    <!-- 사이드 네비 -->
    
            <div id="layoutSidenav">
           <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                            <div class="sb-sidenav-menu-heading">All</div>
                            <a class="nav-link" href="/board">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                전체 게시판
                            </a>
                            <div class="sb-sidenav-menu-heading">WRITE</div>
                            <a class="nav-link" href="/register">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                게시글 작성
                            </a>
                            <div class="sb-sidenav-menu-heading">Genre</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                장르
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/ro">로맨스</a>
                                    <a class="nav-link" href="/fa">판타지</a>
                                    <a class="nav-link" href="/co">코미디</a>
                                    <a class="nav-link" href="/act">액션</a>
                                    <a class="nav-link" href="/horror">공포</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading"> <c:choose>
                            <c:when test="${sessionScope.username!=null}">
                                <span style="color: white; font-size: 15px;" >${sessionScope.username } [ ${sessionScope.name } ]</span>
                               </c:when>
                               </c:choose></div>
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                멤버
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                          <c:choose>
                                          <c:when test="${sessionScope.username==null}">
                                          <a class="nav-link" href="login">로그인</a>
                                          </c:when>
                                          </c:choose>
                                            <a class="nav-link" href="mypage">마이페이지 이동</a>
                                            <a class="nav-link" href="update">내 정보변경</a>
                                            <a class="nav-link" href="pwupdate">비밀번호 변경</a>
                                            <a class="nav-link" href="logout">로그아웃</a>
                                        </nav>
                                   </nav>
                                  </div>
                          </div>
                       </div>
                       </nav>
                    </div>
               

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h2 class="mt-4" style="color:#FFFFFF">Movie Commu</h2>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active" style="color:#FFFFFF">박스오피스 순위</li>
                        </ol>
 
      
<div id="main">
    <div id="content" style="height: 33%;">
     
           <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="4jhz2NU-24Q" style="cursor: pointer;"><img src="resources/img/mario.jpg" alt="마리오" /><p style="color:#FFFFFF">슈퍼 마리오 브라더스<br> 예매율:23.3%</p></a>
           <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=1&page=1&keyword='">
         </div>
         <div class="video_modal_popup-closer ">
           <div class="video_modal_popup">
         </div>
         </div>
           <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="ly3QrgEZaQY" style="cursor: pointer;"><img src="resources/img/wick.jpg" alt="존윅" /><p style="color:#FFFFFF">존윅 4 <br>예매율:15.4%</p></a>
           <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=2&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="UoXfG4uxl6o" style="cursor: pointer;"><img src="resources/img/dream.jpg" alt="드림" /><p style="color:#FFFFFF">드림 <br>예매율:10.6%</p></a>
           <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=3&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="Medg8btyy3A" style="cursor: pointer;"><img src="resources/img/ok.jpg" alt="옥수역" /><p style="color:#FFFFFF">옥수역 귀신 <br>예매율:8.2%</p></a>
           <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=4&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="ik_Sptvs80Y" style="cursor: pointer;"><img src="resources/img/ren.jpg" alt="렌필드" /><p style="color:#FFFFFF">렌필드 <br>예매율:7.9%%</p></a>
           <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=5&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         
	</div>
	
	
   <div id="content" style="height: 33%; margin-top: 40px;">
     
           <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="sdFIv-yogIY" style="cursor: pointer;"><img src="resources/img/slam.jpg" alt="슬램" /><p style="color:#FFFFFF">더 퍼스트 슬램덩크 <br>예매율:5.7%</p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=6&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
           <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="UUpk0wnNhtU" style="cursor: pointer;"><img src="resources/img/suzu.jpg" alt="스즈메" /><p style="color:#FFFFFF">스즈메의 문단속 <br>예매율:4.7%</p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=7&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="1FdB6LPSMkI"><img src="resources/img/mosam2.jpg" alt="인셉션" /><p style="color:#FFFFFF">인셉션 <br>예매율:4.2%</p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=8&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="lNW1TvpM3hE"><img src="resources/img/kill.jpg" alt="킬링로맨스" /><p style="color:#FFFFFF">킬링 로맨스 <br>예매율:3.2%</p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=9&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%; margin-bottom:10%">
           <a data-video="mKFleKy3Si8"><img src="resources/img/rice.jpg" alt="라이스보이" /><p style="color:#FFFFFF">라이스보이 슬립스 <br>예매율:3.1%</p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=10&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         
 </div>
   </main>
  <main >
     <div class="container-fluid px-4" >
        <h2 class="mt-4" style="color:#FFFFFF">상영 예정작</h2>
      <br>
      <br>
   
	
    <div id="content" style="margin-top: 10px;">
     
           <div class="popupModalVideo" style=" float: left; width: 20%;">
           <a data-video="1FdB6LPSMkI"><img src="resources/img/mosam2.jpg" alt="인셉션" /><p style="color:#FFFFFF">인셉션  </p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=8&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
           <div class="popupModalVideo" style=" float: left; width: 20%;">
           <a data-video="Medg8btyy3A"><img src="resources/img/ok.jpg" alt="옥수역" /><p style="color:#FFFFFF">옥수역 귀신 </p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=4&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%;">
           <a data-video="ik_Sptvs80Y" style="cursor: pointer;"><img src="resources/img/ren.jpg" alt="랜필드" /><p style="color:#FFFFFF">랜필드 </p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=5&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%;">
           <a data-video="mKFleKy3Si8" style="cursor: pointer;"><img src="resources/img/rice.jpg" alt="라이스" /><p style="color:#FFFFFF">라이스보이 슬립스 </p></a>
            <input type="button" value="상세정보" class="btn first" onclick="location.href='http://localhost:8090/info_content?num=10&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         <div class="popupModalVideo" style=" float: left; width: 20%;">
           <a data-video="qUaeE30DEcM" style="cursor: pointer;"><img src="resources/img/65.jpg" alt="65" /><p style="color:#FFFFFF" >65 </p></a>
            <input type="button" value="상세정보" class="btn first" style="margin-bottom:30px;" onclick="location.href='http://localhost:8090/info_content?num=11&page=0&keyword='">
         </div>
         <div class="video_modal_popup-closer">
           <div class="video_modal_popup">
         </div>
         </div>
         
	</div>
	 
   </div>
   </main>
   
      

 
    
                <footer style="background-color:#FFFFFF"  >
                    <div class="container-fluid px-4" >
                        <div class="d-flex align-items-center justify-content-between small" >
                            <div class="text-muted" >2023.04.19 </div>
                            <div>
                              
                               <div class="text-muted" >Team By 더 이상의 유기는 없다</div>
                          
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/assets/demo/chart-area-demo.js"></script>
        <script src="resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/datatables-simple-demo.js"></script>
        <script src="//code.jquery.com/jquery-1.12.4.min.js" crossorigin="anonymous"></script>
<script>
$(".popupModalVideo a").click(function() {
    $(".video_modal_popup").addClass("reveal"),
    $(".video_modal_popup .video-wrapper").remove(),
    $(".video_modal_popup").append("<div class='video-wrapper'><iframe width='560' height='315' src='https://www.youtube.com/embed/" + $(this).data("video") +"?title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe></div>")
});
$(".video_modal_popup-closer").click(function() {
    $(".video_modal_popup .video-wrapper").remove(),
    $(".video_modal_popup").removeClass("reveal")
});
</script> 

    </body>
</html>