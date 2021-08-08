<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인 화면</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<%@ include file="/WEB-INF/views/frame/nav.jsp" %>

	<div class="contents">
		<h2>Login</h2>
		<hr>
		<form action="<c:url value='/member/login'/>" method="post">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="memberid" value="${cookie.reId.value}"></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<th></th>
					<td>
					<input type="checkbox" name="reid" value="on" ${cookie.reId ne null ? 'checked' : ''}> 
					아이디 기억하기
					</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="submit"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>