<%@page import="domain.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 리스트</title>
<style>
	td {
		text-align: center;
		padding: 5px 10px;
	}
	
	button {
		margin: 5px 0;
	}
</style>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
</head>
<body>
	<%@ include file="/WEB-INF/frame/header.jsp"%>
	<%@ include file="/WEB-INF/frame/nav.jsp"%>
	<h1>부서 리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<th>등록번호</th>			
			<th>아이디</th>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>관리</th>
		</tr>
		<c:if test="${boardList ne null and not empty boardList }">	
		<c:forEach items="${boardList}" var="board">			
		<tr>
			<td>${board.boardidx}</td>			
			<td>
				<%-- <img src="<c:url value="/upload/${member.memberphoto}"/>" height="30"> --%>
			${board.id}	</td>
			<td>${board.title}</td>
			<!-- 임시로 내용 보여주기 -->
			<td>${board.content}</td>
			<td>${board.hit}</td>
			<td>${board.boardregdate}</td>
			<td>
				<a href="#">수정</a> 
				<a href="#">삭제</a>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	<!-- <script>
		function delDept(idx){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href='memberDel.do?idx='+idx;
			}
		}
	</script> -->
</body>
</html>