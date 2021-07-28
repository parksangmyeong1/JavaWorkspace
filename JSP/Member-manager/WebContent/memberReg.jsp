<%@page import="service.MemberRegService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="util.ConnectionProvider"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int result = MemberRegService.getInstance().regMember(request);
	//request.setAttribute("result", result);
%>
<jsp:forward page="reg_view.jsp"/>
	
<%-- <%
	//request.setCharacterEncoding("utf-8");
%> --%>
<%-- <jsp:useBean id="member" class="domain.Member" />
<jsp:setProperty property="*" name="member" /> --%>

<%-- <%
	//out.println(member);

	int result = 0;
	Connection conn = null;
	MemberDao dao = null;

	try {
		conn = ConnectionProvider.getConnection();
		dao = MemberDao.getInstance();

		result = dao.insertMember(conn, member);

	} catch (SQLException e) {
		e.printStackTrace();
	}

	//out.println(result);

	if (result > 0) {
%> --%>




