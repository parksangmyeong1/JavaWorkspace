<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form 
    method = "post"
    action = "<%=request.getContextPath()%>/ch02_servlet/login.do"
  >
    <!-- 가상 URL 맵핑 해주어야 합니다. -->
    아이디 <input name="id" />
    <br/>
    비밀번호 <input type="password" name="pass">
    <br/>
    <input type="submit" value="로그인">
  </form>
  <!-- 로그인 실패시 메세지 -->
  <!-- param.변수 => request.getParameter("변수") -->
  <span style="color: red;">${param.message}</span>
	
</body>
</html>