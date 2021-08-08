<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 리스트</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
<style>
	td {
		text-align: center;
		padding: 5px 10px;
	}
	
	button {
		margin: 5px 0;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<h1>부서 리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<th>회원번호</th>			
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
		<c:if test="${resultList ne null and not empty resultList }">	
		<c:forEach items="${resultList}" var="member">			
		<tr>
			<td>${member.idx}</td>			
			<td>
				<img src="<c:url value="/fileupload/${member.memberphoto}"/>" height="30">
			${member.memberid}	</td>
			<td>${member.password}</td>
			<td>${member.membername}</td>
			<td>${member.regdate}</td>
			<td>
				<a href="#">수정</a> 
				<a href="#">삭제</a>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
<!-- 	<script>
		function delDept(idx){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href='memberDel.do?idx='+idx;
			}
		}
	</script> -->
</body>
</html>