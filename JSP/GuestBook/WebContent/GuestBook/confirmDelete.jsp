<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Confirm Delete</title>
</head>
<body>
	<h3>메시지를 삭제하려면 비밀번호를 입력하세요.</h3>
	<form action="messsageDelete.jsp" method="post">
		비밀번호 <input type="password" name="password"> 
		<input type="hidden" name="mid" value="${ param.mid }">
		<input type="submit" value="삭제">
	</form>
</body>
</html>