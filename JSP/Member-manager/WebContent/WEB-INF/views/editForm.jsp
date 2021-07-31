<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정 화면</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<hr>
	<form action="memberEdit.do" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${ member.memberid }" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw" value="${ member.password }" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${ member.membername }" required></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="수정">
					<input type="reset">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>