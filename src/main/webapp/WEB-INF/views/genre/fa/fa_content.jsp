<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/include/h2.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<%
if (session.getAttribute("username") == null) {
	response.sendRedirect("/sessionover");
}
%>

<head>
<style>
.textareas{
    overflow:hidden;
    height:auto;
    }
.min-width {
	width: 1080px;
	margin: 0 auto;
	margin-top: 60px;
	margin-bottom: 50px;
}

.left-box {
	float: left;
}

.writer_info {
	margin-right: 6px;
	font-size: 13px;
	font-weight: 700;
}

.se-section-text.se-l-default .se-text-paragraph {
	line-height: 1.8;
	white-space: break-spaces;
}

.CommentWriter {
	margin: 12px 0 29px;
	padding: 16px 10px 10px 18px;
	border: 2px solid var(- -skinCommentWriterBorder);
	border-radius: 6px;
	box-sizing: border-box;
	background: var(- -skinCommentWriterBg);
}

.CommentWriter textarea {
	height: auto; /* 내용의 길이에 따라 자동으로 높이 조정 */
	resize: none; /* 사용자가 크기를 조정할 수 없도록 함 */
	overflow: auto; /* 내용이 넘칠 경우 스크롤바 생성 */
}

.my-box {
	border: 1px solid;
	padding: 10px;
	width: auto;
	margin: 12px 0 29px;
	padding: 16px 10px 10px 18px;
	border-radius: 6px;
	box-sizing: border-box;
	overflow: auto
}

.right-box {
	float: right;
}

.comment_inbox_text {
	overflow-x: hidden;
	overflow-y: auto;
	display: block;
	width: 100%;
	min-height: 17px;
	padding-right: 1px;
	border: 0;
	font-size: 13px;
	-webkit-appearance: none;
	resize: none;
	box-sizing: border-box;
	background: transparent;
	color: var(- -skinTextColor);
	outline: 0;
}

.comment_info_date {
	margin-right: 8px;
}

.rounded-box {
	border-radius: 10px;
	border: 1px solid #ccc;
	padding: 10px;
	position: relative;
}

.rounded-box .comment-btn {
	margin: 10px;
	position: absolute;
	float: right;
	bottom: 7px;
}

.register_box .button {
	display: inline-block;
	min-width: 46px;
	height: 34px;
	line-height: 36px;
	font-size: 13px;
	color: #b7b7b7;
	border-radius: 6px;
	box-sizing: border-box;
	font-weight: 700;
	text-align: center;
	vertical-align: top;
}

.modify-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.comment-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.delete-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.list-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.modi-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.mt-6 {
	margin-top: 0.5rem !important;
	margin-bottom: 0.8rem;
}

.scroll::-webkit-scrollbar {
	display: none;
}
</style>
</head>

<body class="">
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

		<div id="layoutSidenav_content" style="bottom: 56px;">

			<main class="min-width">
				<a>${one.genre}/${one.category }</a>
				<h2 class="mt-6" style="text-align: left;">게시판 글 내용 보기</h2>
				<div class="row">
					<div class="row-col-xl-1">
						<div class="card mb-4">
							<div class="card-header">
								<div style="padding: 5px" class="writer_info">
									<h2>${one.title }</h2>
								</div>
								<img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77" alt="프로필 사진" width="36" height="36"><span class="blind"></span>&nbsp; <span style="font-size: 1.2em" class="writer_info">${one.writer }</span> <span style="font-size: 0.7em" class="writer_info">${one.regdate }</span>
								<h3 class="left-box"></h3>
							</div>

							<form>
								<div class="card-body">
									<br>
									<c:if test="${not empty one.filename }">
										<img style="width: 300px; height: auto;" src="/resources/files/${one.filename }">
										<br>
									</c:if>
									<br>
									<div class="text_box">
										<pre>${one.content }</pre>
										<div class="count"></div>
										<br>
									</div>

								</div>

							</form>

						</div>
						<input style="float: right" type="button" class="list-btn" value="목록" onclick=listnum()>
						<input style="float: right" class="modi-btn" type="button" value="수정" onclick="modi()">
					</div>

				</div>


				<!-- 댓글 작성 부분 -->
				<br>
				<div class="rounded-box">
					<div style="padding: 9px">
						<img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77" alt="프로필 사진" width="36" height="36"><span class="blind"></span>&nbsp; <input type="text" id="commentWriter" style="border: none" value="${sessionScope.username }" readonly><br>
					</div>
					<textarea class="scroll" id="commentContents" style="outline: none; border: none; resize: none; margin-left: 8px" rows="5" cols="125" placeholder="내용" required></textarea>


					<input style="float: right" type="button" value="댓글작성" onclick="commentWrite()" class="comment-btn">

				</div>
				<br>


				<!-- 댓글 출력 부분 -->
				<div id="comment-list">
					<table class="table">
						<tr>
							<th style="width: 10%;">작성자</th>
							<th style="width: 60%;">내용</th>
							<th style="width: 18%;">작성시간</th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach var="comment" items="${commentList }">
							<tr>
								<td>${comment.commentWriter }</td>
								<td>${comment.commentContents }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentCreatedTime }" /></td>
								<td><button class="modify-btn" id="comment-modify-btn" onclick="Popup('${comment.id}', '${comment.commentWriter }')">수정</button></td>
								<td><button class="delete-btn" id="comment-delete-btn" onclick="deleteCheck('${comment.id}', '${comment.commentWriter }')">삭제</button></td>

							</tr>
						</c:forEach>
					</table>
				</div>

				<script>
				function modi() {
					if('${one.writer}' != '${sessionScope.username}') {
						alert("수정 권한이 없습니다");
					}else{
						location.href='fa_modifi?num=${one.num}&page=${param.page}';
					}
				}
				</script>

				<!-- 댓글 수정 -->
				<script>
               function Popup(id, writer){
                  if(writer != '${sessionScope.username}') {
                     alert("수정 권한이 없습니다");
                  }else {
                     window.open("/commMo?id="+id+"&num=${one.num}", "_blank", "width=800, height=200, left=600, top=700");
                  }
            }
               </script>

				<!-- 댓글 작성 -->
				<script>
               const commentWrite = () => {
                  const writer = document.getElementById("commentWriter").value;
                  const contents = document.getElementById("commentContents").value;
                  const id = ${one.num};
                  
                  $.ajax({
                     type:"post",
                     url: "/comment/save",
                     data:{
                        "commentWriter": writer,
                        "commentContents": contents,
                        "boardNum": id
                     },
                     success: function(res){
                        redirct:history.go(0);
                          },
                          error: function (err) {
                              console.log("요청실패", err);
                          }
                       });
                   };
             </script>

				<script>
               function deleteCheck(id, writer){
                  /* const writer = document.getElementById("comWriter").innerText; */
                  
                  if(writer != '${sessionScope.username}'){
                     alert("삭제 권한이 없습니다")
                     return;
                  }else if(confirm("게시글을 삭제하시겠습니까?")){
                     location.href="comment/deleteById?id="+id+"&num=${one.num }";
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
                        history.go(-3);
                     }else if(${sessionScope.listnum} == null){
                        location.href="board?page="+"${param.page}"+"&keyword="+"${param.keyword }";
                     }
                  }
            </script>
			</main>
			<%@ include file="/resources/include/footer.jsp"%>
</body>