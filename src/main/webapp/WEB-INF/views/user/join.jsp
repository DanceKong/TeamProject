<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/resources/include/header.jsp" %>
<div class="login-box">
  <h2>Join</h2>
  <form name="regForm" action="join" method="post">
    <div class="user-box">
      <input type="text" name="username"  required="true">
      <label>아이디를 입력하세요</label>
    </div>
    <div class="user-box">
      <input type="password" name="password" required="true">
      <label>비밀번호를 입력하세요</label>
    </div>

    <div class="user-box">
      <input type="password" name="password_check" required="true">
      <label>비밀번호 확인</label>
    </div>
    <div class="user-box">
      <input type="text" name="name" required="true">
      <label>이름을 입력하세요</label>
    </div>
	
    <div class="user-box">
      <input type="tel" name="phone" required="true">
      <label>전화번호는 '-'를 빼고 입력하세요</label>
    </div>
    <div class="user-box">
      <input type="text" name="email" required="true">
      <label>이메일을 입력하세요</label>
    </div>
     <div class="user-box">
      <input type="text" name="address" required="true">
      <label>주소를 입력하세요</label>
    </div>		
<div>
<input type="button" value="회원가입" class="btn first" onclick=check() style="margin-left: 55px">
<input type="button" value="로그인" class="btn second" onclick="location.href='login'">
</div>
  </form>
</div>
	<script>
		function check(){
			let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			let pnum = /^[0-9]+$/;	
			let regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
			//form은 document.태그이름.태그이름으로 하위태그에 접근이 가능함...(dom접근)
			//console.log(documnet.regform.id.value); 공백이 출력됨
			if(regForm.username.value == ''){
				alert("아이디를 입력하세요.")
				return;
			}else if(regExp.test(regForm.username.value)){
				alert("아이디는 영문만 가능합니다")
				
				
			}else if(regForm.username.value.search(" ") != -1){
					alert("아이디	는 공백을 포함 할 수 없습니다.")
					return;
			}else if(regForm.username.value.length < 4 || regForm.username.value.length > 12){
				alert("아이디는 4글자 이상 12글자 이하로 입력하세요.")
				return;
			}else if(regForm.password.value == ''){
				alert("비밀번호를 입력하세요.")
				return;
			}else if(!reg.test(regForm.password.value)){
				alert("비밀번호는 8자 이상, 영문 대문자, 소문자, 특수문자, 숫자를 모두 포함해야합니다.")
			}else if(/(\w)\1\1\1/.test(regForm.password.value)){
				alert("비밀번호에 같은 문자를 4번이상 연속해서 사용할 수 없습니다.")
				return;
			}else if(regForm.password.value.search(" ") != -1){
				alert("비밀번호는 공백을 포함 할 수 없습니다.")
				return;
			}else if(regForm.password.value != regForm.password_check.value){
				alert("비밀번호 확인란을 확인해주세요. ")
				return;
			}else if(regForm.name.value ==''){
				alert("이름을 입력하세요.")
				return;
			}else if(regForm.phone.value ==''){
				alert("전화번호를 입력하세요.")
				return;
			}else if(!pnum.test(regForm.phone.value)){
				alert("전화 번호는 숫자만 입력 가능합니다.")
				return;
			}else if(regForm.phone.value.search("-") != -1){
				alert("전화번호에 '-'는 사용불가합니다.")
				return;
			}else if(regForm.email.value ==''){
				alert("이메일을 입력하세요.")
				return;
			}else if(regForm.email.value.search("@") == -1 || regForm.email.value.search(".") == -1){
				alert("이메일 형식 오류입니다.")
				return;
			}else if(regForm.address.value ==''){
				alert("주소를 입력하세요.")
				return;
			}else if(confirm("회원 가입을 하시겠습니까?")){
				regForm.submit(); //자바스크립트의 submit()는 form태그 submit기능
				
			}
		}
		
	</script>
	<%@include file="/resources/include/footer.jsp" %>