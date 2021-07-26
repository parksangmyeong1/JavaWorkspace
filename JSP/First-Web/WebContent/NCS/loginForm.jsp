<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	CookieBox cBox = new CookieBox(request);
	
	String reid = cBox.isCookie("reid") ? cBox.getValue("reid") : "";
	String checked = cBox.isCookie("reid") ? "checked" : "";
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginForm</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/NCS/css/default.css">
</head>
<body>

	<%@ include file="frame/header.jsp"%>
	<%@ include file="frame/nav.jsp"%>

	<div class="contents">
		<h2>Login</h2>
		<hr>
		<form action="login.jsp" method="post">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="memberid" value="${ cookie.reid.value }"></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="checkbox" name="reid" value="on" 
						${ cookie.reid.value != null ? 'checked' : '' }> 
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