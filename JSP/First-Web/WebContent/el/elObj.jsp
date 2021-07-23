<%@page import="ncs.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "손흥민");
	session.setAttribute("name", "이강인");
	application.setAttribute("name", "박지성");
	
	Member member = new Member();
	member.setId("cool");
	member.setName("COOL");
	member.setPw("1234");
	session.setAttribute("member", member);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL Object</title>
</head>
<body>
	표현식 : <span><%= request.getAttribute("name")%></span> <br>
	표현 언어1 : <span>${ requestScope.name }</span><br>
	내장객체의 표현식이 생략되었을 때 규칙<br>
	1. pageScope의 속성을 찾는다
	2. requestScope의 속성을 찾는다
	3. sessionScope
	4. applicationScope <br>
	표현 언어2 : <span>${ name }</span><br>
	표현 언어3 : <span>${ sessionScope.name }</span><br>
	표현 언어4 : <span>${ applicationScope.name }</span><br>
	
	<hr>
	param.code : <%= request.getParameter("code") %> <br>
	param.code : ${ param.code }
	
	<hr>
	pageContext : <%= pageContext.getRequest().getServletContext().getContextPath() %><br>
	pageContext : ${ pageContext.request.requestURL } <br>
	pageContext : ${ pageContext.request.requestURI } <br>
	pageContext : ${ pageContext.request.contextPath } <br>
	<%= request.getContextPath() %>
	
	<br>
	<hr>
	${ true } / ${ false } / ${ 100 } / ${ '손흥민' } / ${ null } <!-- null은 공백으로 보인다 -->
	
	<br>
	<hr>
	표현언어 : ${ member } / 표현식 : 
	<%= session.getAttribute("member") %><br>
	
	<!-- member.getId() -->
	표현언어 : ${ member.id } / 표현식 : 
	<%= ((Member)session.getAttribute("member")).getId() %><br>
	

</body>
</html>