<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   if(session.getAttribute("username")==null){
   response.sendRedirect("/sessionover"); 
}
%>
<%@ include file="/resources/include/header.jsp" %>


	
      <form>
      	<div align="center" class="login-box">
         <h2>Mypage</h2>
         <hr>
         <span style="color: white; font-size: 20px;">${sessionScope.username } [ ${sessionScope.name } ] 님의 <br> 회원 정보를 관리합니다.</span>
         <hr>
         <br>
         <br>
         <input type="button" value="회원정보 변경" class="btn first" onclick="location.href='update'" style="margin-bottom:-10px" >
         <input type="button" value="로그아웃" class="btn second" onclick="location.href='logout'" style="margin-left:-10px; margin-bottom:-10px;">
         <input type="button" value="비밀번호 변경" class="btn first" onclick="location.href='pwupdate'" style="margin-right: -10px">
         <input type="button" value="회원탈퇴" class="btn second" onclick="location.href='delete'">
      	</div>
      </form>
       
         
         
   

<%@ include file="/resources/include/footer.jsp" %>