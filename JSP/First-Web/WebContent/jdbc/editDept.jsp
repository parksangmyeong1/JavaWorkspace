<%@page import="jdbc.util.jdbcUtil"%>
<%@page import="dept.domain.Dept"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	int resultCnt = 0;
	// 2. DB 처리 : insert

	Connection conn = null;
	DeptDao dao = null;
	
	try{
		conn = ConnectionProvider.getConnection();
		dao = DeptDao.getInstance();
		
		resultCnt = dao.updateDept(conn, new Dept(Integer.parseInt(deptno),dname,loc));
		
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		jdbcUtil.close(conn);
	}
	
	if(resultCnt>0){
		%>
		<script>
			alert('수정되었습니다.');
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