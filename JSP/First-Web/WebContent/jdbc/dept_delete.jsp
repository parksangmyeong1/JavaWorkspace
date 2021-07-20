<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//사용자가 전달하는 deptno 받고
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	int resultCnt = 0;
	
	// DB에 있는 데이터를 삭제
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	conn = ConnectionProvider.getConnection();
	
	// 실행 결과에 맞는 응답
	String sqlDelete = "delete from dept where deptno=?";
	pstmt = conn.prepareStatement(sqlDelete);
	
	pstmt.setInt(1, Integer.parseInt(deptno));
	
	resultCnt = pstmt.executeUpdate();
	
	if(resultCnt>0){
		%>
		<script>
			alert('삭제되었습니다.');
			location.href="dept_list.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert('해당 데이터를 찾지 못했습니다.');
			location.href="dept_list.jsp";
		</script>
		<%
	}
%>