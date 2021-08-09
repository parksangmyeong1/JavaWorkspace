<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${loginInfo eq null}">
	<script>
		alert('로그인이 필요한 페이지입니다.\n로그인 후 사용해주세요!!');
		history.go(-1);
</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
<title>My Page</title>
</head>
<body>
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
	<div class="contents">
		<h2>My Page</h2>
		<hr>
		<h3>
			${loginInfo}
		</h3>
	</div>
</body>
</html>
