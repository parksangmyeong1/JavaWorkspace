<%@page import="NCS.member.util.utilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="NCS.member.MemberDao"%>
<%@page import="NCS.member.util.connection"%>
<%@page import="NCS.member.Member"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Connection conn = null;	
	MemberDao dao = MemberDao.getInstance();
	
	try{
		conn = connection.getConnection();

		request.setAttribute("list", dao.getMemberList(conn));
	}catch(SQLException e){
		e.printStackTrace();
	} catch(Exception e){
		e.printStackTrace();
	}	finally{
		utilClose.close(conn);
	}
	
%>
<jsp:forward page="list_view.jsp"/>