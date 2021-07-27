<%@page import="ncs.member.util.UtilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ncs.member.util.ConnectionProvider"%>
<%@page import="ncs.member.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String idx = request.getParameter("idx");
	
	int resultCnt = 0;
	Connection conn = null;
	
	try{
	
	MemberDao dao = MemberDao.getInstance();
	
	conn = ConnectionProvider.getConnection();
	
	resultCnt = dao.deleteMember(conn, Integer.parseInt(idx));
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		UtilClose.close(conn);
	}
	
	if(resultCnt>0){
	%>
		<script>
			alert('삭제되었습니다.');
			location.href="main.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert('해당 데이터를 찾지 못했습니다.');
			location.href="main.jsp";
		</script>
		<%
	}
	
	%>
