<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/resources/include/header.jsp" %>

<div class="login-box">
  <h2>회원정보 수정</h2>
  <form name="regForm" action="update" method="post">
 <div class="user-box">
      <input type="hidden" name="id" value= "${user.getId()}"  readonly>
    </div>    
	<div class="user-box">
      <input type="text" name="username" value= "${user.getUsername()}"  readonly  required="true">
      
    </div>
    <div class="user-box">
      <input type="password" name="password"  value= "${user.getPassword()}" readonly required="true">
      
    </div>


    <div class="user-box">
      <input type="text" name="name" value="${user.getName() }" required="true">
      <label>이름을 입력하세요</label>
    </div>
	
    <div class="user-box">
      <input type="tel" name="phone"  value="${user.getPhone() }" required="true">
      <label>전화번호는 '-'를 빼고 입력하세요</label>
    </div>
    <div class="user-box">
      <input type="text" name="email"  value="${user.getEmail()}" required="true">
      <label>이메일을 입력하세요</label>
    </div>
     <div class="user-box">
      <input type="text" name="address" value="${user.getAddress() }" required="true">
      <label>주소를 입력하세요</label>
    </div>		
<div>
            <input type="button" value="정보수정" class="btn first" onclick=check()>
            <input type="button" value="마이페이지" class="btn second" onclick="location.href='mypage'">
</div>
  </form>
</div>
 <script>
      function check(){
         let pnum = /^[0-9]+$/;	
  		 if(regForm.name.value ==''){
            alert("이름을 입력하세요.")   
            return;
         	}else if(regForm.phone.value ==''){
				alert("전화번호를 입력하세요.")
				return;
			}else if(!pnum.test(regForm.phone.value)){
				alert("전화 번호는 숫자만 입력 가능합니다.")
				return;
			} else if(regForm.phone.value.search("-") != -1){
				alert("전화번호에 '-'는 사용불가합니다.")
				return;
			}else if(regForm.email.value ==''){
				alert("이메일을 입력하세요.")
				return;
			}else if(regForm.email.value.search("@") == -1 || regForm.email.value.search(".") == -1){
				alert("이메일 형식 오류입니다.")
				return;
			}else if(regForm.address.value ==''){
				alert("주소입력하세요.")
				return;
			}else if(confirm("정보를 수정 하시겠습니까?")){
            document.regForm.submit();
         }

      }
      
   </script>
   
   <%@include file="/resources/include/footer.jsp" %>