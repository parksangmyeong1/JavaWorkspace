<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 회원 리스트</title>
</head>
<body>

	<h2>post 리스트</h2>
		<hr>
		<table class="table">
			<tr>
				<!-- <th>postIdx</th>
					<th>memIdx</th> -->
				<th>카테고리</th>
				<th>제목</th>
				<!-- <th>postContent</th> -->
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천</th>
				<!-- <th>postDislike</th>
					<th>postRep</th> -->
			</tr>
			<c:forEach items="${postList}" var="post">
				<tr>
					<%-- <td>${post.postIdx}</td>
					<td>${post.memIdx}</td> --%>
					<td>${post.postSort}</td>
					<td>${post.postTitle}</td>
					<%-- <td>${post.postContent}</td> --%>
					<td>${post.postWriter}</td>
					<td><fmt:formatDate value="${post.postRegDate}" type="date"
							pattern="yyyy.MM.dd" /></td>
					<td>${post.views}</td>
					<td>${post.postLike}</td>
					<%-- <td>${post.postDislike}</td>
					<td>${post.postRep}</td> --%>
				</tr>
			</c:forEach>
		</table>
</body>
</html> 