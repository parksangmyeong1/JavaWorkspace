<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 회원 리스트</title>
<c:if test="${ param.deleteResult eq 1 }">
	<script>
		alert('해당 게시물이 삭제되었습니다.');
	</script>
</c:if>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
		<div id="container">
        <div class="Wrapper">
            <!-- sidebar -->
            <div class="sidebar">
                <div class="floating-banner">
                    <ul class="tabs">
                        <li class="shortcut_title">
                            <a href="#">단축키<img src="/cobsp/images/shortkey.png"></a>
                        </li>
                    </ul>
                    <ul class="tab-contents-container">
                        <div class="tab-contents" id="tab1-contents">
                            <ul class="shortcut_keys">
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/1.png"/>회사소개</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/2.png"/>모임</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/3.png"/>게시판</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/4.png"/>자유게시판</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/5.png"/>잡담게시판</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/6.png"/>카페</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/7.png"/>게임</a></li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
            <div id="content">
                <!-- contents -->
                <div class="contents">
                    <div class="board_header">
                        <h2><a href="#">COB 게시판</a></h2>
                    </div>
                    <div class="board_nav">
                        <div class="nav_left">
                            <a class="home" href="#">
                                <img style="vertical-align:middle;" src="https://img.icons8.com/material-outlined/24/000000/home-page.png"/>
                            </a>
                            <a class="a1" href="#">전체</a>
                        </div>
                        <div class="nav_right">
                            <li><a href="#" style="color:#003f7f">잡담</a></li>
                            <li><a href="#" style="color:#007fff" >질문</a></li>
                            <li><a href="#" style="color:#00bf5f" >후기</a></li>
                            <li><a href="#" style="color:#7f3f00" >드로우/출시</a></li>
                            <li><a href="#" style="color:#4f007c" >게임TIP</a></li>
                           	<li><a href="#" style="color:#ff7f00" >정보/세일</a></li>
                            <li><a href="" style="color:#ffaaaa" >지역</a></li>	
                            <li><a href="#" style="color:#000000" >기타</a></li>
                            <li><a href="#" style="color:#ff0000" >공지</a></li>
                        </div>
                        <div>
                            <select class="dataPerPage">
                                <option value="10">10개씩</option>
                                <option value="15">15개씩</option>
                                <option value="20">20개씩</option>
                                <option value="25">25개씩</option>
                                <option value="30">30개씩</option>
                                <option value="35">35개씩</option>
                            </select>
                        </div>
                        <div class="check_box">
                            <input type="checkbox" id="notice_hidden">
                            <span class="icon"></span>
                            <label for="notice_hidden">공지 숨기기</label>
                        </div>
                    </div>
                    <div>
                        <table>
                            <thead style="height: 35px;">	
                                <tr>
                                    <th scope="col" class="m_no">
                                        <span>카테고리</span>
                                    </th>	
                                    <th scope="col" class="title">
                                    	<span>제목</span>
                                    </th>
                                    <th scope="col">
                                        <span>작성자</span>
                                    </th>																
                                    <th scope="col">		
                                        <span>작성일</span>
                                    </th>																
                                    <th scope="col" class="m_no">		
                                        <span>조회수</span>		
                                    </th>														
                                    <th scope="col" class="m_no">				
                                        <span>좋아요</span>			
                                    </th>						
                                </tr>	
                            </thead>
                            <tbody >
								<c:forEach items="${postList}" var="post">
									<tr>
										<td>${post.postSort}</td>
										<td><span onClick="addViews(${post.postIdx})"><a href="<c:url value='/post/postDetail?postIdx=${post.postIdx}'/>">${post.postTitle}</a><span></td>
										<%-- <td>${post.postContent}</td> --%>
										<td>${post.postWriter}</td>
										<td><fmt:formatDate value="${post.postRegDate}" type="date"
												pattern="yyyy.MM.dd" /></td>
										<td>${post.views}</td>
										<td>${post.postLike}</td>
									</tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- search_bar -->
                <div class="search_wrap">
                    <div class="search_bar">
                        <input type="text" placeholder="검색어 입력">
                        <button class="search_btn">검색</button>
                    </div>
                    <div class="search_categori">
                        <span>	
                            <select>
                                <option value="title_content">제목+내용</option>
                                <option value="title">제목</option>
                                <option value="nick_name">닉네임</option>		
                            </select>
                        </span>
                    </div>
                    <!-- 글쓰기 페이지로 보내기 -->
                    <a href="<c:url value='/post/write'/>" class="btn_write">글쓰기</a>
                </div>
                <!-- paging_bar -->
                <div class="page_wrap">
                    <div class="page_nation">
                        <a href="#" class="first"><img src="/cobsp/images/page_pprev.png"></a>
                        <a href="#" class="prev"><img src="/cobsp/images/page_prev.png"></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                        <a href="#">8</a>
                        <a href="#">9</a>
                        <a href="#">10</a>
                        <a href="#" class="next"><img src="/cobsp/images/page_next.png"></a>
                        <a href="#" class="last"><img src="/cobsp/images/page_nnext.png"></a>
                    </div>
                 </div>
            </div>
        </div>
    </div>
    
    <script>
	 // 조회수 증가
	 function addViews(postIdx){
		 $.ajax({
				url : '<c:url value="/views/addViews"/>',    			
				type : "get",
				data : {"postIdx" : postIdx},
				async : false,
				success : function(){
					alert('성공');
				},
				error : function(){
					alert("오류발생");
				}
			});
	 }
    </script>
</body>
</html> 