<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입 페이지</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
<script src="/js/regForm.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<div class="contents">
		<h2>회원가입</h2>
		<hr>
		<form method="post" > 
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
				<tr>
					<td>사진</td>
					<td><input type="file" name="photo"></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="submit" value="회원가입">
						<input type="reset">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>