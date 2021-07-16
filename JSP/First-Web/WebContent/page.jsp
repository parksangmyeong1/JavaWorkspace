<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page</title>
<style>
	body{ 
		text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */ 
		}
	#nav{
		font-size: 20px;
		overflow: hidden;
		
		}
	#wrap{
		margin: 0 auto;
		overflow: hidden;
		text-align: center;
	}
	#wrap>div{
		float: left;
		padding: 10px;
	}
</style>
<script>
</script>
</head>
<body>
	<%@include file="Include/header.jsp"%>
	<%-- <%@include file="WEB-INF/header.jsp"%> --%>
	<hr>
	<%@include file="Include/nav.jsp"%>
	<div id="wrap">
		<%@include file="Include/news.jsp"%>
		<%@include file="Include/shopping.jsp"%>
	</div>
</body>
</html>