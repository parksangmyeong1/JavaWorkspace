<%@page import="ncs.member.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Object loginObj = session.getAttribute("loginInfo");
	
%>
	<nav>
		<ul>
			<%if (loginObj == null){%>
			<li><a href="<%= request.getContextPath()%>/NCS/member_insertForm.jsp">회원가입</a></li>
			<li><a href="<%= request.getContextPath()%>/NCS/loginForm.jsp">로그인</a></li>
			<%} else{%>
			<li><a href="<%= request.getContextPath()%>/NCS/logout.jsp">로그아웃</a></li>
			<li><a href="<%= request.getContextPath()%>/NCS/main.jsp">회원리스트</a></li>
			<%} %>
			<li><a href="<%= request.getContextPath()%>/NCS/myPage.jsp">MyPage</a><li>
		</ul>
	</nav>