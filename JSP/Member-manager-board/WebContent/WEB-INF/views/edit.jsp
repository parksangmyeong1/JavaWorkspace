<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ resultEdit > 0 }">
	<script>
		alert('수정되었습니다.');
		location.href="<c:url value="/memberList.do"/>";
	</script>
</c:if>
<c:if test="${ resultEdit eq 0 }">
	<script>
		alert('해당 데이터를 찾지 못했습니다.');
		location.href="<c:url value="/memberList.do"/>";
	</script>
</c:if>
