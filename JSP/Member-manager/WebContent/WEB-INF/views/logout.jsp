<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert('로그아웃 되었습니다.');
	location.href = '<c:url value='/' />';
	// location.href = 'index.jsp';
</script>
