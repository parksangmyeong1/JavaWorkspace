<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userRepw = request.getParameter("userRepw");
	String userName = request.getParameter("userName");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-1.12.4.js" 
        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
        crossorigin="anonymous">
    </script>
    <script src="manager.js"></script>
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>
	<div id="list">
	</div>
</body>
</html>