<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
	<ul>
		<c:if test="${ loginInfo eq null }">
			<li><a href="<c:url value='/member/regMember' />">회원가입</a></li>
			<li><a href="<c:url value='/member/login' />">로그인</a></li>
		</c:if>
		<c:if test="${ loginInfo ne null }">
			<li><a href="<c:url value='/member/logout' />">로그아웃</a></li>
			<li><a href="<c:url value='/member/memberList' />">회원리스트</a></li>
		</c:if>
			<li><a href="<c:url value='/member/myPage' />">MyPage</a></li>
			<li><a href="<c:url value='/member/boardRegForm' />">게시판</a></li>
			<li><a href="<c:url value='/member/boardList' />">게시판리스트</a></li>
	</ul>
</nav>