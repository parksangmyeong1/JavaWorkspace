<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post일때 한글 인식 못함. 한글 인식을 위해서
/* 	request.setCharacterEncoding("utf-8"); */ 
	// 나중에 데이터 전처리 해줘야한다.
	String userName = request.getParameter("username");
	String job = request.getParameter("job");
	
	String[] interests = request.getParameterValues("interest");
	
	request.setAttribute("userName", userName);
	request.setAttribute("job", job);
	request.setAttribute("age", 30); // 30 -> auto Boxing
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>
		<table border="1">
			<tr>
				<td>이름</td>
				<td>
				<%= userName %>
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
				<%= job %>
				</td>
			</tr>
			<tr>
				<td>관심사항</td>
				<td>
				<% 
					
				if(interests != null && interests.length > 0){
					for(int i=0;i<interests.length;i++){
						out.println(interests[i]+"<br>");
					}
				}
				
				%>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<jsp:include page="view.jsp"/>
				</td>
			</tr>
		</table>
</body>
</html>