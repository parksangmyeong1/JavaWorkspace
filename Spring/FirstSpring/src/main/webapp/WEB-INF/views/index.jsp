<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Spring MVC
</h1>
<hr>
	<ul>
		<li><a href="<c:url value="/hello"/>">/greeting</a></li>
		<li><a href="<c:url value="/member/loginForm"/>">/member/loginForm</a></li>
		<li><a href="<c:url value="/member/regForm"/>">/member/regform</a></li>
	</ul>
</body>
</html>
