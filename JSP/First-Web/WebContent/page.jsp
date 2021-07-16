<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page</title>
<style>
	body{ 
		text-align: center; 
		}
	#nav{
		font-size: 20px;
		}
	#wrap{
		width: 450px;
		margin: 0 auto;
		overflow: hidden;
	}
	#news{;
		float: left;
		padding: 10px;
	}
	#shopping{
		float: right;
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
	
	<%-- <jsp:include page="footer.jsp"> --%>
	
	<!-- 실행된 jsp -> html(text) 결과를 가져온다. -->
	<jsp:include page="footer.jsp">
		<jsp:param value="test@gamil.com" name="email"/>
		<jsp:param value="010-0000-0000" name="tel"/>
	</jsp:include>
</body>
</html>