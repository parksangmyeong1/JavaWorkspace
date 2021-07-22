<%@page import="ncs.member.util.ConnectionProvider"%>
<%@page import="ncs.member.util.UtilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ncs.member.MemberDao"%>
<%@page import="ncs.member.Member"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;	
	MemberDao dao = MemberDao.getInstance();
	
	try{
		conn = ConnectionProvider.getConnection();

		request.setAttribute("list", dao.getMemberList(conn));
	}catch(SQLException e){
		e.printStackTrace();
	} catch(Exception e){
		e.printStackTrace();
	}	finally{
		UtilClose.close(conn);
	}
%>
<jsp:forward page="list_view.jsp"/>