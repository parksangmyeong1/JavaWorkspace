<%@page import="NCS.member.util.utilClose"%>
<%@page import="java.sql.SQLException"%>
<%@page import="NCS.member.Member"%>
<%@page import="NCS.member.MemberDao"%>
<%@page import="NCS.member.util.connection"%>
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
		conn = connection.getConnection();
		
		resultCnt = dao.updateMember(conn, new Member(Integer.parseInt(idx),id,pw,name,date));
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		utilClose.close(conn);
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