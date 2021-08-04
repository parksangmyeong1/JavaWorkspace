<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>                <!-- /First-Web/member/login.jsp -->
	<table>
		<tr>
			<td>아이디</td>
			<td>${ mid }, ${ mid }, ${ memberReq.memberid }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${ mpw }, ${ mpw }, ${ memberReq.password }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${ mname }, ${ mname }, ${ memberReq.membername }</td>
		</tr>
		<!-- <tr>
			<td>사진</td>
			<td><input type="file" name="photo"></td>
		</tr> -->
	</table>
</body>
</html>