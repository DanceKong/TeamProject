<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/recom_save" method = "post">
		작성자 : <input type="text" name = "writer" id="writer"><br>
		제목 : <input type="text" name = "title" id="title"><br>
		장르 : <input type="text" name = "genre" id = "genre"><br>
		내용 : <textarea name = content cols = "30" rows = "10" id = "content"></textarea><br>
		<input type="submit" value = "글작성" onclick="location.href='recom_save'">
	</form>
</body>
</html>