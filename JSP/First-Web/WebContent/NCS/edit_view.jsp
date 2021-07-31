<%@page import="ncs.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	Member member = (Member) request.getAttribute("member");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>edit_view</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<hr>
	<form action="member_edit.jsp" method="post">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td><input type="number" name="idx" value="${ member.idx }" readonly></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${ member.id }" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw" value="${ member.pw }" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${ member.name }" required></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="date" name="date" value="${ member.date }" required></td>
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