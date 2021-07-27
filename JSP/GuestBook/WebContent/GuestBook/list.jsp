<%@page import="guest.domain.MessageListView"%>
<%@page import="guest.service.MessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 사용자로부터 페이지 번호를 받는다. list.jsp?page=3 형식으로
	String pageNumStr = request.getParameter("page");
	
	// list.jsp로 넘어올 경우를 위해서 설정
	// default 값 
	int pageNum = 1;
	// null이 아니면 받아온 값 설정
	if(pageNumStr != null){
		pageNum = Integer.parseInt(pageNumStr); 
	}
	
	MessageListView listView = MessageListService.getInstance().getMessageList(pageNum);

	request.setAttribute("listView", listView);
%>
<jsp:forward page="list_view.jsp"/>