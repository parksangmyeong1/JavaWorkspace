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
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="naver_login.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js" 
        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
        crossorigin="anonymous">
    </script>
    <script src="manager.js"></script>
    <title>NAVER</title>

<style>
</style>
<script>
</script>
</head>
<body>
	<div class="wrap">
        <div class="container">
            <div id="logo">
                <a href="#">
                    <img src="naver_logo.png" alt="naver_logo">
                </a>
            </div>
            <div id="login_section">
                <form action="signup_result.jsp" type="get" class="login" id="login_check">
                    <input type="text" class="id" placeholder="아이디" id="id">
                    <input type="password" class="pw" placeholder="비밀번호" id="pw">
                    <input type="submit" class="login_btn" value="로그인">
                </form>
            </div>
        </div>
    </div>
    <div id="list">
    </div>
</body>
</html>