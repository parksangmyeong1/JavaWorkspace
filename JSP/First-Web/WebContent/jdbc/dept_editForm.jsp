<%@page import="jdbc.util.jdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="dept.domain.Dept"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//사용자가 전달하는 부서번호 받기
	String deptno = request.getParameter("deptno");

	// out.println(deptno);
	
	// 전달받은 부서 번호로 부서 정보를 가져온다. DB를 통해
	// 2. DB 연결
	// 초기화 이유 : ???
	Connection conn = null;
	DeptDao dao = null;
	try{
		conn = ConnectionProvider.getConnection();
		dao = DeptDao.getInstance();
		
		request.setAttribute("dept", dao.selectByDeptno(conn, Integer.parseInt(deptno))); 
	} catch(SQLException e){
		e.printStackTrace();
	}finally{
		jdbcUtil.close(conn);
	}
	
	
	// 부서정보를 form_view.jsp 전달 (공유)
%>
<jsp:forward page="form_view.jsp" />