<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="naver_signUp.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js" 
        integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
        crossorigin="anonymous">
    </script>
    <script src="manager.js"></script>
<style>
</style>
<script>
</script>
</head>
<body>
	<div id="wrap">
        <div id="container">
            <div id="logo" class="margin">
                <a href="#">
                    <img src="naver_logo.png" alt="naver_logo">
                </a>
            </div>
            <div>
                <form id="regForm" action="loginpage.jsp" type="get">
                    <label for="id"></label><h3>아이디</h3>
                        <div id="id_outer" class="margin border bcak_color focus">
                            <input type="text" id="id" name="userId">
                            <span>@naver.com</span>
                        </div>
                        <div id="id_msg"></div>
                    </label>
                    <label for="pw"><h3>비밀번호</h3>
                        <div id="pw_outer" class="margin border bcak_color focus">
                            <input type="password" id="pw" class="pw_form" name="userPw">
                            <span class="pw_logo"><img src="lock.PNG" width="24", height="24">
                            </span>
                        </div>
                        <div id="pw_msg"></div>
                    </label>
                    <label for="repw"><h3>비밀번호 재확인</h3>
                        <div id="repw_outer" class="margin border bcak_color focus">
                            <input type="password" id="repw" class="pw_form" name="userRepw">
                            <span class="repw_logo"><img src="unlock.PNG" width="24", height="24">
                            </span>
                        </div>
                        <div id="repw_msg"></div>
                    </label>
                    <label for="name"><h3>이름</h3>
                        <input type="text" id="name" class="margin border focus" name="userName">
                        <div id="name_msg"></div>
                    </label>
                    <div id="date">
                        <label for="year"><h3>생년월일</h3>
                            <input type="text" id="year" class="margin border padding focus" placeholder="년(4자)" name="year">
                        </label>
                        <select id="month" class="border padding" name="month">
                            <option selected>월</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        <input type="text" id="day" class="border padding focus" placeholder="일" name="day">
                    </div>
                    <label for="gender"><h3>성별</h3>
                        <select id="gender" class="margin border padding" name = "gender">
                            <option selected>성별</option>
                            <option>남자</option>
                            <option>여자</option>
                            <option>선택 안함</option>
                        </select>
                    </label>
                    <label for="email"><h3>본인 확인 이메일(선택)</h3>
                        <input type="email" id="email" class="margin border focus" placeholder="선택입력" name="email">
                    </label>
                    <label for="country"><h3>휴대전화</h3>
                        <select id="country" class="margin border padding" name="county">
                            <option selected>대한민국 +82</option>
                            <option>가나 +233</option>
                            <option>가봉 +231</option>
                            <option>가이나나 +592</option>
                            <option>감비아 +220</option>
                            <option>과테말라 +502</option>
                        </select>
                        <input type="tel" id="tel" class="margin border focus" placeholder="전화번호 입력" name="tel">
                    </label>
                    <input type="tel" id="checknumber" class="margin border focus" placeholder="인증번호를 입력하세요">
                    <input type="submit" id="signupbtn" class="margin border" value="가입하기">
                </form>
            </div>
            <footer>
                <ul>
                    <li>
                        <a href="#">이용약관</a>
                    </li>
                    <li>
                        <a href="#">개인정보처리방침</a>
                    </li>
                    <li>
                        <a href="#">책임과 한계와 법적고지</a>
                    </li>
                    <li>
                        <a href="#">회원정보 고객센터</a>
                    </li>
                <div>
                    <a href="#"><img src="naver_logo.png" width="20px" height="10px"></a>
                Copyright <a href="#">NAVER Corp.</a> All Rights Reserved.
                </div>
                </ul>
            </footer>
        </div>
    </div>
</body>
</html>