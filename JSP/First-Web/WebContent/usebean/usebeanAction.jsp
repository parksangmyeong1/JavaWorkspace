<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="member.Member1" scope="request" />

<!-- 
	1. request 속성에 member 라는 속성을 찾는다.
	2. member가  member.Member 타입의 객체인지 확인!
	3-1. 있다면 request.getAttribute("member");
	3-2. 없다면 new members.Member() 생성, request.setAttribute("member", new member.Member());
 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= member %>
	<br>
	<%= member.getName() %>
</body>
</html>