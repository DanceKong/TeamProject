<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/resources/include/header.jsp" %>


<div class="login-box">
  <h2>비밀번호 수정</h2>
  <form name="regForm" action="pwupdate" method="post">
    <div class="user-box">
      <input type="password" name="password"  required="true">
      <label>8자 이상, 영문 대/소문자</label>
    </div>
    <div class="user-box">
      <input type="password" name="password_check" required="true">
      <label>특수문자 숫자 모두 포함</label>
	</div>
	<div>
    <input type="button" value="비밀번호수정" class="btn first" onclick="check()">
    <input type="button" value="마이페이지" class="btn second" onclick="location.href='mypage'">
    </div>
	</form>
</div>

 <script>
      function check(){
         let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
           if(regForm.password.value == ''){
            alert("비밀번호란을 입력하세요.")
            return;
         }else if(!reg.test(regForm.password.value)){
            alert("비밀번호는 8자 이상, 영문 대문자, 소문자, 특수문자, 숫자를 모두 포함해야합니다.")
            return;
         }else if(/(\w)\1\1\1/.test(regForm.password.value)){
            alert("비밀번호에 같은 문자를 4번이상 연속해서 사용할 수 없습니다.")
            return;
         }else if(regForm.password.value.search(" ") != -1){
            alert("비밀번호는 공백을 포함 할 수 없습니다.")
         return;
         }else if(regForm.password_check.value == ''){
             alert("비밀번호 확인란을 입력하세요.")
         }else if(regForm.password.value != regForm.password_check.value){
            alert("비밀번호 확인란을 확인해주세요. ")
         return;
          }else if(confirm("비밀번호를 변경하시겠습니까?")){
            document.regForm.submit();
          }
      }
   </script>
   
   
   <%@include file="/resources/include/footer.jsp" %>
   
   