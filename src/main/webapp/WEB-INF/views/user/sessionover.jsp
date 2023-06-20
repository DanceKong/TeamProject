<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세션만료 접근불가</title>
	</head>
	<body>
			<script>
			if('NO' == '${nosession}'){
				alert("세션 만료! - 잘못된 접근입니다.")
				location.href='login';
			}
		</script>
		
	
	</body>
</html>