<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/include/h2.jsp"%>

<script type="text/javascript">
const route = window.location.pathname.replace('/','');
</script>

<%
if (session.getAttribute("username") == null) {
	response.sendRedirect("/sessionover");
}
%>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 50px auto;
	margin-top: 100px;
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
						<div class="sb-sidenav-menu-heading">Category</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 카테고리
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
				<h2 class="mt-4" style="text-align: center;">게시글 수정</h2>
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
								<form class="regform" name="regform" action="ro_modifi" method="post" enctype="multipart/form-data">
									<tr>
										<td><input type="hidden" name="num" value="${one.num }"></td>
									</tr>
									제목 <input type="text" name="title" id="title" value="${one.title }" style="width: 100%;">
									<hr>
									작성자 : <input type="text" name="writer" id="writer" value="${one.writer }" style="width: 100%;" readonly>
									<hr>
									장르 : <select id="genre" name="genre">
										<option value="${one.genre }" selected>${one.genre}</option>
									</select>
									<hr>
									분류 : <select id="category" name="category">
										<option value="${one.category }" selected>${one.category }</option>
									</select>
									<hr>								
									<c:if test="${not empty one.filename }">
                              <img src="/resources/files/${one.filename }">
                              <input type="hidden" name="filename" value="${one.filename }">
                              <input type="hidden" name="filepath" value="${one.filepath }">
                              <br>
                           </c:if>
                           <br>
                           <input type="file" name="file" id="file" value="${one.filename }">
									
									
									
									
									<hr>
									내용 : <br>
									<div class="text_box">
										<textarea name="content" id="content" placeholder="내용을 입력해주세요." class="text" rows="5" cols="150" required>${one.content }</textarea>
										<div class="count"></div>
										<br>
									</div>
									<p>
										<br> <input type="button" value="수정" onclick=modifyCheck()> <input type="button" value="목록" onclick=listnum()> <input type="button" value="삭제" onclick=deleteCheck()>
									</p>
								</form>
							</div>
						</div>
					</div>
					<script>
function modifyCheck() {
   if(regform.title.value == ''){
      alert("제목을 입력하세요.");
      return;
   }else if(regform.content.value == ''){
      alert("내용을 입력해주세요.")
      return;
   }else if(confirm("게시글을 수정하겠습니까?")){
      regform.submit();
   }
}
</script>
					<script>
   function deleteCheck(){
      if(regform.writer.value != '${sessionScope.username}'){
         alert("작성자와 일치하지 않습니다.")
         return;
      }else if(confirm("게시글을 삭제하시겠습니까?")){
         location.href="delete_content?num="+"${one.num}";
         
         
      }
   }
   </script>

					<script>
   function listnum(){
      if(${sessionScope.listnum} == '1'){
         history.go(-1);
         return;
      }else if(${sessionScope.listnum} == '2'){
         history.go(-2);
      }else if(${sessionScope.listnum} == '3'){   
         history.go(-2);
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
        alert("최대 200자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 500));
        $('.text_box .count span').html(500);
      }
    });
   
   </script>

				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp; Conditions</a>
						</div>
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
</body>
</html>