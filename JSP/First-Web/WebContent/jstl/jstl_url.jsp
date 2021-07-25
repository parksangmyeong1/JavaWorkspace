<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
	<c:url value="/index.jsp" var="urlIndex"/>
	${ urlIndex } <br>
	<a href="${ urlIndex }">홈으로 가기</a><br>
	<c:url value="index.jsp" /><br>
	<a href="<c:url value="index.jsp"/>">링크 연동</a>
	</h3>
	
	<c:url value="/index.jsp" var="homeUrl">
		<c:param name="type" value="sub"/>
		<c:param name="index">1</c:param>
	</c:url>
	
	<a href="${ homeUrl }">${ homeUrl }</a>
</body>
</html>