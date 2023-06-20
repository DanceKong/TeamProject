<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/resources/include/header.jsp" %>


<div class="login-box">
  <h2>회원탈퇴 비밀번호 확인</h2>
  <form name="regForm" action="delete" method="post">
    <div class="user-box">
      <input type="password" name="password"  required="true">
      <label>비밀번호 입력란</label>
    </div>
    <div class="user-box">
      <input type="password" name="password_check" required="true">
      <label>비밀번호 확인란</label>
	</div>
	<div>
    <input type="button" value="계정삭제" class="btn first" onclick="check()">
    <input type="button" value="마이페이지" class="btn second" onclick="location.href='mypage'">
    </div>
	</form>
</div>
   
   <script>
      function check(){
			let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
     		if(regForm.password.value == ''){
				alert("비밀번호를 입력해주세요.")
				return;
			}else if(regForm.password.value != regForm.password_check.value){
				alert("비밀번호가 일치하지않습니다. 확인해주세요.")
			return;
			 }else if(confirm("삭제하면 복구하실 수 없습니다. 계정을 삭제하시겠습니까?")){
				document.regForm.submit();
			 }
      }
   </script>
   
   
<%@include file="/resources/include/footer.jsp" %>