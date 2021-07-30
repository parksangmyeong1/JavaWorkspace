<%@page import="domain.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
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
			<th>idx</th>			
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
	<%--
		if(list!=null && !list.isEmpty()){
			for(int i=0; i<list.size(); i++){
				--%>
		<c:if test="${resultList ne null and not empty resultList }">	
		<c:forEach items="${resultList}" var="member">			
		<tr>
			<td>${member.idx} <%--= list.get(i).getIdx() --%></td>			
			<td>
				<img src="<c:url value="/upload/${member.memberphoto}"/>" height="30">
			${member.memberid} <%--= list.get(i).getMemberid() --%></td>
			<td>${member.password} <%--= list.get(i).getPassword() --%></td>
			<td>${member.membername} <%--= list.get(i).getMembername() --%></td>
			<td>${member.regdate} <%--= list.get(i).getRegdate() --%></td>
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
				//location.href = ''+idx;
			}
		}
	</script> -->
</body>
</html>