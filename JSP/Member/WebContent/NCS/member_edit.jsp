<%@page import="ncs.member.util.ConnectionProvider"%>
<%@page import="ncs.member.util.UtilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ncs.member.Member"%>
<%@page import="ncs.member.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String idx = request.getParameter("idx");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String date = request.getParameter("date");
	
	int resultCnt = 0;
	
	Connection conn = null;
	MemberDao dao = MemberDao.getInstance();
	
	try{
		conn = ConnectionProvider.getConnection();
		
		resultCnt = dao.updateMember(conn, new Member(Integer.parseInt(idx),id,pw,name,date));
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		UtilClose.close(conn);
	}

	if(resultCnt>0){
%>
			<script>
				alert('수정되었습니다.');
				location.href='main.jsp';
			</script>
		<%
	}else{
		%>
		<script>
			alert('해당 데이터를 찾지 못했습니다.');
			location.href='main.jsp';
		</script>
	<%
	}
%>