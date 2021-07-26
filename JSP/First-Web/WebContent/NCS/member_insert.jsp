<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="ncs.member.util.UtilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ncs.member.Member"%>
<%@page import="ncs.member.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="ncs.member.Member" />
<jsp:setProperty property="*" name="member" />
<%
	request.setCharacterEncoding("utf-8");

/* 	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name"); */
	
	int resultCnt = 0;
	
	Connection conn = null;
	MemberDao dao = MemberDao.getInstance();
	
	try{
		conn = ConnectionProvider.getConnection();
		
		resultCnt = dao.insertMember(conn, member);
/* 		resultCnt = dao.insertMember(conn, new Member(0,id,pw,name)); */
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		UtilClose.close(conn);
	}
	
	if(resultCnt>0){
%>
			<script>
				alert('등록되었습니다.');
				location.href='main.jsp';
			</script>
		<%
	}else{
		%>
		<script>
			alert('오류가 발생되어 등록되지 않았습니다!\n이전 페이지로 이동합니다.');
			window.history.go(-1);
		</script>
	<%
	}
	
%>