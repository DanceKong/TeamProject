<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/include/h2.jsp"%>

<script type="text/javascript">
const route = window.location.pathname.replace('/','');
</script>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<%
if (session.getAttribute("username") == null) {
	response.sendRedirect("/sessionover");
}
%>
<style>
div#px-6 {
	width: 1200px;
	height: 600px;
	margin-top: 100px;
	margin-left: 200px;
}

.writer_info1 {
	display: none;
	margin-right: 6px;
	font-weight: 700;
}
</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">All</div>
						<a class="nav-link" href="/board">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 전체 게시판
						</a>
						<div class="sb-sidenav-menu-heading">WRITE</div>
						<a class="nav-link" href="/register">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 게시글 작성
						</a>
						<div class="sb-sidenav-menu-heading">Genre</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 장르
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>

						<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/ro">로맨스</a> <a class="nav-link" href="/fa">판타지</a> <a class="nav-link" href="/co">코미디</a> <a class="nav-link" href="/act">액션</a> <a class="nav-link" href="/horror">공포</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">
							<c:choose>
								<c:when test="${sessionScope.username!=null}">
									<span style="color: white; font-size: 15px;">${sessionScope.username } [ ${sessionScope.name } ]</span>
								</c:when>
							</c:choose>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 멤버
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<c:choose>
										<c:when test="${sessionScope.username==null}">
											<a class="nav-link" href="login">로그인</a>
										</c:when>
									</c:choose>
									<a class="nav-link" href="mypage">마이페이지 이동</a> <a class="nav-link" href="update">내 정보변경</a> <a class="nav-link" href="pwupdate">비밀번호 변경</a> <a class="nav-link" href="logout">로그아웃</a>
								</nav>
							</nav>
						</div>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<form class="register" method="POST" action="/save" enctype="multipart/form-data">
					<div id="px-6">
						<h2 class="mt-4" style="text-align: center;">게시글 작성</h2>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item active"></li>
						</ol>

						<div class="row">
							<div class="row-col-xl-1">
								<div class="card mb-4">
									<div class="card-header">
										<h3 class="left-box"></h3>
									</div>
									<div class="card-body">
										제목 : <input type="text" name="title" id="title" required>
										<hr>
										작성자 : <input type="text" name="writer" id="writer" value="${sessionScope.username }" readonly>
										<hr>
										장르 : <select id="genre" name="genre" required>
											<option value="">=선택=</option>
											<option value="로맨스">로맨스</option>
											<option value="코미디">코미디</option>
											<option value="액션">액션</option>
											<option value="판타지">판타지</option>
											<option value="공포">공포</option>
										</select>
										<hr>
										분류 : <select id="category" name="category" required>
											<option value="">=선택=</option>
											<option value="리뷰">리뷰</option>
											<option value="추천">추천</option>
											<option value="정보">정보</option>
										</select>
										<hr>
										<input type="file" name="file" id="file">
										<hr>
										내용 : <br>
										<div class="text_box">
											<textarea name="content" id="content" placeholder="내용을 입력해주세요." class="text" style="resize: none;" cols="150px;" rows="5px;" required></textarea>
											<div class="count">
												<span>0</span>/500
											</div>
											<br>
										</div>
										<div class="button">
											<p>
												<br> <input type="submit" style="float:right" value="등록"> <input type="button" style="float:right" value="목록" onclick="location.href='board'">
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<script>
				function listnum(){
					if(${sessionScope.listnum} == '1'){
			      		history.go(-1);
			      	return;
					}else if(${sessionScope.listnum} == '2'){
					   history.go(-2);
					}else if(${sessionScope.listnum} == '3'){   
					   history.go(-3);
					}else if(${sessionScope.listnum} == null){
					   location.href="board?page="+"${param.page}"+"&keyword="+"${param.keyword }";
					}
				}   
   				</script>
				<script>
   				$('.text_box textarea').keyup(function(){
                  var content = $(this).val();
                  $('.text_box .count span').html(content.length);
                  if (content.length > 500){
                    alert("최대 500자까지 입력 가능합니다.");
                    $(this).val(content.substring(0, 500));
                    $('.text_box .count span').html(500);
                  }
                });
   				</script>

			</main>
			<%@ include file="/resources/include/footer.jsp"%>
		</div>