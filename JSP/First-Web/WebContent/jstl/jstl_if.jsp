<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL_If</title>
</head>
<body>
	<c:if test="${ 10>0 }">
		참일때만 보여집니다.
	</c:if>
	
	이름 : ${ members[1].name }
	<c:if test="${ members[1].name eq null }">
		입력된 정보가 없습니다.
	</c:if>
	
	<c:if test="${ members[0].name == 'COOL'}" var="result" scope="request" />
	
	<br> members[0].name == 'COOL' : 
	${ result }
	
</body>
</html>