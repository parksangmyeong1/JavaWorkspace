<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-1.12.4.js" 
        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
        crossorigin="anonymous">
    </script>
    <script src="../js/manager.js"></script>
<title>Naver - Login Result</title>
</head>
<body>
	
	<h1><%= userId %>님 로그인 성공 하셨습니다.</h1>
	
</body>
</html>