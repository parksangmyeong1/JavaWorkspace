<%@page import="ncs.member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List_view</title>
</head>
<body>
	<h1>회원 리스트</h1>
	<hr>
	<button onclick="location.href='member_insertForm.jsp';">회원 정보 등록</button>
	<table border="1">
		<tr>
			<td>인덱스</td>
			<td>id</td>
			<td>pw</td>
			<td>name</td>
			<td>date</td>
			<td>관리</td>
		</tr>
		
		<c:forEach items="${ list }" var = "list">
			<tr>
				<td>${ list.idx }</td>
				<td>${ list.id }</td>
				<td>${ list.pw }</td>
				<td>${ list.name }</td>
				<td>${ list.date }</td>
				<td><a href="member_editForm.jsp?idx=${ list.idx }">수정</a></td>
				<td><a href="javascript:del_member(${ list.idx })">삭제</a></td>
			</tr>
		</c:forEach>
		
		<%-- <%
			if(list!=null && !list.isEmpty()){
				for(int i=0;i<list.size();i++){
					%>
					<tr>
						<td><%= list.get(i).getIdx()%></td>
						<td><%= list.get(i).getId()%></td>
						<td><%= list.get(i).getPw()%></td>
						<td><%= list.get(i).getName()%></td>
						<td><%= list.get(i).getDate()%></td>
						<td><a href="member_editForm.jsp?idx=<%= list.get(i).getIdx()%>">수정</a>
						<a href="javascript:del_member(<%=list.get(i).getIdx()%>)">삭제</a></td>
					</tr>
					<%
				}
			}
		%> --%>
	</table>
	<script>
		function del_member(idx){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href='member_delete.jsp?idx='+idx;
			}
		}
	</script>
</body>
</html>