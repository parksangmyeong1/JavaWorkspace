<%@page import="ncs.member.LoginInfo"%>
<%@page import="ncs.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");

	if( loginInfo == null){
%>
<script>
	alert('로그인이 필요한 페이지입니다.\n로그인 후 사용해주세요!!');
	location.href='${pageContext.request.contextPath}/NCS/loginForm.jsp';
</script>
<%
	}else{
%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ loginInfo != null }">

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/NCS/css/default.css"> 
</head>
<body>

<%@ include file="frame/header.jsp" %>
<%@ include file="frame/nav.jsp" %>

	<div class="contents">
	
		<h2>My Page</h2>
		<hr>
		<h3>
			${ loginInfo }
		</h3>
	
	</div>

</body>
</html>
<%-- <%}%> --%>
</c:if>