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
<title>Naver - Login Page</title>
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
                <form id="login_check" action="signup_result.jsp" type="get" class="login">
                    <input id="id" type="text" name="userId" class="id" placeholder="아이디">
                    <div id="id_msg"></div>
                    <input id="pw" type="password" name="userPw"  class="pw" placeholder="비밀번호">
                    <div id="pw_msg"></div>
                    <input type="submit" class="login_btn" value="로그인">
                </form>
            </div>
        </div>
    </div>
    <h1>현재 회원 정보</h1>
	<hr>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=userId %>@naver.com</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=userPw %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=userName %></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><%=year %>년 <%=month %>월 <%=day %>일</td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender %></td>
		</tr>
		<tr>
			<td>본인 확인 이메일</td>
			<td><%=email %></td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td><%=tel %></td>
		</tr>
	</table>
	<h1>현재 회원 정보</h1>
	<hr>
	<div id="list">
</body>
</html>