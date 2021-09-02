<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 게시글 보기</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<body>
	<table>
		<tr>
			<td>${postDetail.postTitle}</td>
			<td>${postDetail.postSort}</td>
			<td>${postDetail.postContent}</td>
			<td>${postDetail.postWriter}</td>
			<td><fmt:formatDate value="${postDetail.postRegDate}" type="date"
					pattern="yyyy.MM.dd" /></td>
			<td>${postDetail.views}</td>
			<td>${postDetail.postLike}</td>
			<td>${postDetail.postDislike}</td>
			<td>${postDetail.postRep}</td>
		</tr>
	</table>
</body>
</html> 