<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session View</title>
<style>
</style>
<script>
</script>
</head>
<body>
	<%
		// 로그인 후 사용자(회원)의 이름을 세션 속성에 저장
		// object 반환이라서 String으로 변환해줘야함
		String userName = (String) session.getAttribute("userName");
	
		if(userName==null){
			out.println("<script>alert('로그인이 필요한 페이지입니다.');</script>");
		}
	%>
	<h1>세션의 속성에 저장된 userName : <%=session.getAttribute("userName") %></h1>
	<h3><a href="logout.jsp">로그아웃</a></h3>
</body>
</html>