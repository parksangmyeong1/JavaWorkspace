<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project</title>
</head>
<body>
	<h1>초기화면</h1>
	<a href="<c:url value='/post/postReg'/>">naverEditor</a>
	<a href="<c:url value='/post/test'/>">ckeditor</a>
	<a href="<c:url value='/write'/>">summernote</a>
</body>
</html>