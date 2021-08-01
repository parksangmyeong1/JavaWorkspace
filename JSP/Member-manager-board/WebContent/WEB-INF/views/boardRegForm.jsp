<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/regForm.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="<c:url value='/javascript/regForm.js'/>"></script>
</head>
<body>
	<%@ include file="/WEB-INF/frame/header.jsp"%>
	<%@ include file="/WEB-INF/frame/nav.jsp"%>
	<div class="contents">
		<h2>게시판 작성</h2>
		<hr>
		<form action="writeboard.do" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td> <input type="text" name="id" value="${ member.memberid }" readonly> </td>
			</tr>
			<tr>
				<td>제목</td>
				<td> <input type="text" name="title" required> </td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="10" cols="30"></textarea> 
				</td>
			</tr>
			<tr>
				<td></td>
				<td> <input type="submit" value = "메시지 남기기"> </td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>