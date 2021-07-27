<%@page import="ncs.member.util.ConnectionProvider"%>
<%@page import="ncs.member.util.UtilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ncs.member.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");

	Connection conn = null;
	try{
		conn = ConnectionProvider.getConnection();
		MemberDao dao = MemberDao.getInstance();
		
		request.setAttribute("member", dao.selectByIdx(conn, Integer.parseInt(idx)));
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		UtilClose.close(conn);
	}
%>
<jsp:forward page="edit_view.jsp"/>