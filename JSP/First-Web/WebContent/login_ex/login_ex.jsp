<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// post일때 한글 인식 못함. 한글 인식을 위해서
	request.setCharacterEncoding("utf-8"); 
	// 나중에 데이터 전처리 해줘야한다.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 등록</title>
    <link rel="stylesheet" href="/First-Web/loginEx/css/default.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"
        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
    <script src="jQuery.js"></script>
</head>
<body>
    <div id="regFormArea">
        <h2 class="title_font">회원 정보 등록</h2>
        <form id="regForm" action="login_ex_result.jsp">
            <table>
                <tr>
                    <td>
                        <label for="userID">아이디</label>
                        <input type="text" id="userID" placeholder="아이디를 입력해주세요." name="id">
                        <div class="msg"></div>
                    </td>
                    <td>
                        <label for="userPW">비밀번호</label>
                        <input type="password" id="userPW" placeholder="비밀번호를 입력해주세요." name="pw">
                        <div class="msg"></div>
                    </td>
                    <td>
                        <label for="userRepw">비밀번호 확인</label>
                        <input type="password" id="userRepw" placeholder="다시한번 입력해주세요." name="repw">
                        <div class="msg"></div>
                    </td>
                    <td>
                        <label for="userName">이름</label>
                        <input type="text" id="userName" placeholder="이름을 입력해주세요." name="name">
                        <div class="msg"></div>
                    </td>
                    <td>
                        <input type="submit" value="등록">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>
