<%@page import="NCS.member.util.utilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="NCS.member.MemberDao"%>
<%@page import="NCS.member.util.connection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");

	Connection conn = null;
	try{
		conn = connection.getConnection();
		MemberDao dao = MemberDao.getInstance();
		
		request.setAttribute("member", dao.selectByIdx(conn, Integer.parseInt(idx)));
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		utilClose.close(conn);
	}
	
%>
<jsp:forward page="edit_view.jsp"/>