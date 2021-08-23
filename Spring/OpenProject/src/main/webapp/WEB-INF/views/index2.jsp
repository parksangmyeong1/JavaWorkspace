<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<%@ include file="/WEB-INF/views/frame/bootstrap_metaheader.jsp"%>
<title>Offcanvas template · Bootstrap v4.6</title>
<style>
	.bg-orange {
		background: orange;
	}
	
	.bg-red {
		background: red;
	}
	
	.nav-link {
		color: white !important; /* 최우선적으로 실행 */
	}
</style>
</head>
<body class="bg-light">

	<%@ include file="/WEB-INF/views/frame/bootstrap_header.jsp"%>

	<main role="main" class="container">
	
		<div class="my-3 p-3 bg-white rounded shadow-sm">
			test
		</div>
		
	</main>

	<%@ include file="/WEB-INF/views/frame/bootstrap_footer.jsp"%>

</body>
</html>