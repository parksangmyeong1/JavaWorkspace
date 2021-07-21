<%@page import="jdbc.util.jdbcUtil"%>
<%@page import="dept.domain.Dept"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 사용자가 입력한 데이터를 받고 -> 처리 -> 결과를 속성에 저장 -> view 지정
	
	// 입력데이터의 한글 처리!
	request.setCharacterEncoding("utf-8");
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	int resultCnt = 0;
	// 2. DB 처리 : insert
	

	Connection conn = null;
	DeptDao dao = DeptDao.getInstance();
	
	try{
		
		conn = ConnectionProvider.getConnection();
		resultCnt = dao.insertDept(conn, new Dept(Integer.parseInt(deptno),dname,loc));

	}catch(Exception e){
		
	}finally{
		jdbcUtil.close(conn);
	}
	//	2) js
	if(resultCnt>0){
		%>
			<script>
				alert('등록되었습니다.');
				location.href='dept_list.jsp';
			</script>
		<%
	} else{
		%>
		<script>
			alert('오류 발생으로 등록되지 않았습니다.\n 입력 페이지로 이동합니다.');
			// location.herf='dept_regForm.jsp';
			window.history.go(-1);
		</script>
		<%
	}
	

%>