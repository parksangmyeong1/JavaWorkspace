<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberRegForm Page</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>                <!-- /First-Web/member/login.jsp -->
		<form method="post" ><!-- enctype="multipart/form-data" -->
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="memberid" id="memberid">
						<span id="msg" class="display_none"></span>
						<img id="loadingimg" class="display_none" alt="loading" src="<c:url value="/image/loading.gif"/>"> 
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="membername"></td>
				</tr>
				<!-- <tr>
					<td>사진</td>
					<td><input type="file" name="photo"></td>
				</tr> -->
				<tr>
					<td></td>
					<td>
						<input type="submit" value="회원가입">
						<input type="reset" >
					</td>
				</tr>
			</table>
		</form>
</body>
</html>