<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 등록</title>
</head>
<body>
	<h1>회원 정보 등록</h1>
	<hr>
	<form action="member_insert.jsp" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="photo" required></td>
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