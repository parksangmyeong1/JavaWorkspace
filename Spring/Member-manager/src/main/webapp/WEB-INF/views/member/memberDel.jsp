<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ resultDel > 0 }">
	<script>
		alert('삭제되었습니다.');
		location.href="<c:url value="/member/logout"/>";
	</script>
</c:if>
<c:if test="${ resultDel eq 0 }">
	<script>
		alert('해당 데이터를 찾지 못했습니다.');
		location.href="<c:url value="/member/memberList"/>";
	</script>
</c:if>
