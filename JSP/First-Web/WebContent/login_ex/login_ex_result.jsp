<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html lang="en">
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
 	<!-- header 시작 -->
    <header>
        <h1 class="title_font">Member Manager</h1>
    </header>
    <!-- <hr> -->
    <!-- header 끝-->

    <!-- 회원 등록 폼 시작 -->
    <div id="viewMemberArea">
            <fieldset>
                <legend>회원 리스트</legend>
                <form action="myInfoPage.jsp" method="post">
                    <table>
                        <thead id="thead">
                            <tr>
                                <td id=managerI>index</td>
                                <td>아이디(이메일)</td>
                                <td>비밀번호</td>
                                <td>이름</td>
                                <td id="manager">관리</td>
                            </tr>
                        </thead>
                        <tbody id="list">
                        </tbody>
                    </table>
                </form>
            </fieldset>
        </div>
        <div id="editMemberArea" style="display: none;">
            <fieldset>
                <legend>데이터 수정</legend>
                <div id="close"><input type="button" id="closebutton" value="닫기"></div>
                <form>
                    <table>
                        <tr>
                            <td>
                                <label for="editId">아이디(이메일)</label>
                                <input type="text" id="editId" disabled>
                                <input type="hidden" id="index">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="editPw">비밀번호</label>
                                <input type="password" id="editPw" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="editRepw">비밀번호 확인</label>
                                <input type="password" id="editRepw" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="editName">이름</label>
                                <input type="text" id="editName" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="수정">
                            </td>
                        </tr>
                    </table>
                </form>
            </fieldset>
        </div>

   </body>
</html>