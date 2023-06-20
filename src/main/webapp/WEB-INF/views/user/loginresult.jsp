<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<script>
			if('OK' == '${result}'){
				alert("로그인 완료!")
				location.href='/';
			}else if('FAIL' == '${result}'){
				alert("아이디 또는 비밀번호를 확인하세요.")
				history.go(-1);
			}else if('NONE_ID' == '${result}'){
				alert("존재하지 않는 ID 입니다. 회원가입을 진행하세요.")
				history.go(-1);
			}
		</script>
</body>
</html>