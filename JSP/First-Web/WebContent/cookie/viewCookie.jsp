<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Cookie[] cookies = request.getCookies();
	CookieBox cBox = new CookieBox(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewCookie</title>
<style>
</style>
<script>
</script>
</head>
<body>
	name = <%= cBox.getValue("name") %> <br>
	number = <%= cBox.getValue("number") %> <br>
	age = <%= cBox.getValue("age") %>
	<%
		/* if(cookies!=null & cookies.length>0){
			for(int i=0;i<cookies.length;i++){
				// getName() : 쿠키의 이름 반환
				String name = cookies[i].getName();
				// getValue() : 쿠키의 값을 반환
				String value = cookies[i].getValue();
				
				out.println("<h1> " + name + " = " + value + "</h1>");
			}
		} */
	%>
	
	<a href="editCookie.jsp">쿠키 수정</a>
	<a href="deleteCookie.jsp">쿠키 삭제</a>
</body>
</html>