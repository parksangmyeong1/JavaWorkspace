<%@page import="NCS.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = (Member) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<hr>
	<form action="member_edit.jsp" method="post">
		<table border="1">
			<tr>
				<td>인덱스</td>
				<td><input type="number" name="idx" value="<%= member.getIdx()%>" readonly></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="<%= member.getId()%>" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw" value="<%= member.getPw()%>" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= member.getName()%>" required></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="date" name="date" value="<%= member.getDate()%>" required></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="등록">
					<input type="reset">
				</td>
		</tr>
		</table>
	</form>
</body>
</html>