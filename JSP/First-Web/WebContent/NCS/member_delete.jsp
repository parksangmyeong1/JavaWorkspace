<%@page import="NCS.member.MemberDao"%>
<%@page import="NCS.member.util.connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String idx = request.getParameter("idx");
	
	int resultCnt = 0;
	
	Connection conn = null;
	MemberDao dao = MemberDao.getInstance();
	
	conn = connection.getConnection();
	
	resultCnt = dao.deleteMember(conn, Integer.parseInt(idx));
	
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