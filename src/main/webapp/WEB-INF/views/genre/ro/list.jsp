<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/include/h2.jsp"%>
<script type="text/javascript">
	const route = window.location.pathname.replace('/', '');
</script>

<style>
.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}
</style>
</head>
<div id="layoutSidenav" style="background-color: #FFFFFF;">
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
			<div class="container-fluid px-4">
				<h2 class="mt-4">로맨스</h2>
				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card bg-secondary text-white mb-4">
							<div class="card-body">전체</div>
							<div class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="ro_board"></a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-secondary text-white mb-4">
							<div class="card-body">리뷰</div>
							<div class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="ro_review"></a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-secondary text-white mb-4">
							<div class="card-body">추천</div>
							<div class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="ro_recom"></a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-secondary text-white mb-4">
							<div class="card-body">정보</div>
							<div class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="ro_info"></a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
					</div>
					<div id="board-list">
						<div class="container">
							<br> <br>
							<table class="board-table">
								<thead>
									<tr>
										<th scope="col" class="th-num">No.</th>
										<th scope="col" class="th-title">제목</th>
										<th scope="col" class="th-date">작성자</th>
										<th scope="col" class="th-date">작성시간</th>
										<th scope="col" class="th-num">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list.content }">
										<tr>
											<td>${vo.num}</td>
											<td><a href="ro_contents?num=${vo.num }&page=${nowPage-1}">${vo.title}</a></td>
											<td>${vo.writer}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}" /></td>
											<td>${vo.hit}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-sm">
									<li class="page-item"><c:if test="${param.page >= startPage }">
											<li><a class="page-link" href="${route}?page=${param.page - 1 }"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if> <c:forEach var="pagenum" begin="${startPage }" end="${endPage }">
											<li class="${nowPage == pagenum ? 'active':'' }"><a href="${route}?page=${pagenum-1 }" class="page-link">${pagenum }</a></li>
										</c:forEach> <c:if test="${param.page < endPage - 1}">
											<li><a class="page-link" href="${route}?page=${param.page + 1}"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if></li>
								</ul>
							</nav>
						</div>
					</div>

				</div>

			</div>
			<div id="board-search">
				<div class="container">
					<div class="search-window" style="float: right;">
						<form action="${route}?page=${param.page }&keyword=${param.keyword }">
							<div class="search-wrap">
								<label for="search" class="blind"></label> <input type="text" name="keyword" placeholder="제목검색">
								<button type="submit" value="검색" class="btn btn-dark">검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>

<%@ include file="/resources/include/footer.jsp"%>
