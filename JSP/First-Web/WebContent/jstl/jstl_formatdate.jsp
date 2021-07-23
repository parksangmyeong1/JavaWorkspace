<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("now", new java.util.Date());
	%>
	
	
	${ now }<br>
	<!-- 홍콩 시간으로 변경 -->
<%-- <fmt:timeZone value="hongkong"> --%>
	<h3>날짜</h3>
	<!-- yyyy.mm.dd -->
	<fmt:formatDate value="${ now }"/> <br>
	<!-- yyyy.mm.dd -->
	<fmt:formatDate value="${ now }" type="date"/> <br>
	<!-- yyyy년-mm월-dd일 요일 -->
	<fmt:formatDate value="${ now }" type="date" dateStyle="full"/> <br>
	<!-- yy.mm.dd -->
	<fmt:formatDate value="${ now }" type="date" dateStyle="short"/> <br>

	<h3>시간</h3>
	<!-- a h:mm:ss -->
	<fmt:formatDate value="${ now }" type="time"/> <br>
	<!-- a h시 mm분 ss초 KST -->
	<fmt:formatDate value="${ now }" type="time" timeStyle="full"/> <br>
	<!-- a h:mm -->
	<fmt:formatDate value="${ now }" type="time" timeStyle="short"/> <br>
	
	<h3>both</h3>
	<!-- yyyy. mm. dd a h:mm:ss -->
	<fmt:formatDate value="${ now }" type="both"/> <br>
	<!-- yyyy년-mm월-dd일 요일 a h시 mm분 ss초 z -->
	<fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/> <br>
	
	<h3>패턴</h3>
	<fmt:formatDate value="${ now }" pattern="z a h:mm"/> <br>
	<fmt:formatDate value="${ now }" pattern="hh:mm:ss"/> <br>
	<fmt:formatDate value="${ now }" pattern="yyyy-mm-dd h:mm"/> <br>
	<fmt:formatDate value="${ now }" pattern="yyyy.mm.dd. a h:mm"/> <br>
	<fmt:formatDate value="${ now }" pattern="yyyy.mm.dd. a h:mm" timeZone="hongkong"/> <br>
<%-- </fmt:timeZone> --%>
</body>
</html>