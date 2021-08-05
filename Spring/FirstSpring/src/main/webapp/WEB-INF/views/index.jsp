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
		<li><a href="<c:url value="/hello"/>">/hello</a></li>
		<li><a href="<c:url value="/member/login"/>">/member/login</a></li>
		<li><a href="<c:url value="/member/regForm"/>">/member/regform</a></li>
		<li><a href="<c:url value="/order/order"/>">/order/order</a></li>
		<li><a href="<c:url value="/cookie/make"/>">/cookie/make</a></li>
		<li><a href="<c:url value="/header/header"/>">/header/header</a></li>
		<li><a href="<c:url value="/view/view1"/>">/view/view1</a></li>
		<li><a href="<c:url value="/search/search"/>">/search/search</a></li>
		<li><a href="<c:url value="/upload/uploadForm"/>">/upload/uploadForm</a></li>
	</ul>
</body>
</html>
