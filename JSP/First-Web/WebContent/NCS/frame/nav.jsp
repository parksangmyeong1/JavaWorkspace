<%@page import="ncs.member.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%
	Object loginObj = session.getAttribute("loginInfo");
%> --%>
	<nav>
		<ul>
			<c:if test="${ loginInfo == null }">
				<li><a href="${pageContext.request.contextPath}/NCS/member_insertForm.jsp">회원가입</a></li>
				<li><a href="${pageContext.request.contextPath}/NCS/loginForm.jsp">로그인</a></li>
			</c:if>
			<c:if test="${ loginInfo != null }">
				<li><a href="${pageContext.request.contextPath}/NCS/logout.jsp">로그아웃</a></li>
			<li><a href="${pageContext.request.contextPath}/NCS/main.jsp">회원리스트</a></li>
			</c:if>
			<li><a href="${pageContext.request.contextPath}/NCS/myPage.jsp">MyPage</a><li>
			<%-- <%if (loginObj == null){%>
			<li><a href="${pageContext.request.contextPath}/NCS/member_insertForm.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/NCS/loginForm.jsp">로그인</a></li>
			<%} else{%>
			<li><a href="${pageContext.request.contextPath}/NCS/logout.jsp">로그아웃</a></li>
			<li><a href="${pageContext.request.contextPath}/NCS/main.jsp">회원리스트</a></li>
			<%} %>
			<li><a href="${pageContext.request.contextPath}/NCS/myPage.jsp">MyPage</a><li> --%>
		</ul>
	</nav>