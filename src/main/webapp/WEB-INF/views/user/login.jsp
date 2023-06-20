<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/resources/include/header.jsp" %>

<div class="login-box">
  <h2>Login</h2>
  <form name="regForm" action="login" method="post">
    <div class="user-box">
      <input type="text" name="username"  required="true">
      <label>Username</label>
 	 </div>
     <div class="user-box">
      <input type="password" name="password" required="true">
      <label>Password</label>
    </div>
	<div>
		<input type="button" value ="로그인" class="btn first" onclick=check() style="margin-left: 70px">
		<input type="button" value ="회원가입" class="btn second" onclick="location.href='join'">
	</div>
  </form>
</div>
	<script>
		function check(){
			//form은 document.태그이름.태그이름으로 하위태그에 접근이 가능함...(dom접근)
			//console.log(documnet.regform.id.value); 공백이 출력됨
			if(document.regForm.username.value == ''){
				alert("아이디는 필수 사항입니다.")
				return;
			}else if(document.regForm.password.value == ''){
				alert("비밀번호는 필수 사항입니다.")
				return;
			}else if(confirm("로그인 하시겠습니까?")){
				document.regForm.submit(); //자바스크립트의 submit()는 form태그 submit기능
				
			}
		}
		
	</script>
	<%@include file ="/resources/include/footer.jsp" %>
