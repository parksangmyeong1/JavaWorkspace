<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 로그인</title>
<%@ include file="/WEB-INF/views/frame/bootstrap_metaheader.jsp" %>
</head>
<body>
<%-- <%@ include file="/WEB-INF/views/frame/header.jsp" %>
<%@ include file="/WEB-INF/views/frame/nav.jsp" %> --%>
	<%@ include file="/WEB-INF/views/frame/bootstrap_header.jsp"%>
	
	<main role="main" class="container">
	
		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<h2>Login Page</h2>
		<hr>
		<form method="post">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" class="form-control m-2" name="memberid" value="${cookie.reid.value}"></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" class="form-control m-2" name="password"></td>
				</tr>
				<tr>
					<th></th>
					<!-- = checked -->
					<td>
					<input type="checkbox" class="form-ckeck-input" name="reid" value="on" ${cookie.reid ne null ? 'checked' : ''}> 
					아이디 기억하기
					<%-- <input type="hidden" name="redirectUri" value="${ redirectUri ne null ? redirectUri : '' }"> --%>
					<input type="hidden" name="redirectUri" value="${ param.referer}">					
					</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="submit" class="form-control btn btn-primary m-2" value="로그인"></td>
				</tr>
			</table>
		</form>
		</div>
		
	</main>
	
	<%@ include file="/WEB-INF/views/frame/bootstrap_footer.jsp"%>
</body>
</html>