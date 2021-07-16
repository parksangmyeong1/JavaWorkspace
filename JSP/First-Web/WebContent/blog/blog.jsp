<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <style>
        /* 전체 */
        *{
            font-family: 'Nanum Gothic', sans-serif;
            margin: 0;
            padding: 0;
        }
        /* body 부분 */
        body{
            padding-top: 30px;
        }
        /* class 부분 */
        .div_algin_center{
            margin: 0 auto;
        }
        .border{
            border: 1px solid #AAA;
        }
        .font_size_200px{
            font-size: 200%;
        }
        .text_left{
            text-align: left;
        }
        .display_inline{
            display: inline;
        }
        .line_height{
            line-height: 180%;
        }
        .padding_bottom{
            padding-bottom: 10px;
        }
        .padding_top{
            padding-top: 10px;
        }
        /* ID 부분 */
        #wrap{
            width: 800px;
            overflow: hidden;
            padding-top: 10px;
        }
        #main{
            width: 800px;
            padding: 20px;
        }
        /* li 부분 */
        li{
            list-style:none;
        }
        /*header 부분*/
        header{
            width: 798px;
            height: 80px;
            
            padding-left: 50px;
            padding-top: 20px;
        }
        /*nav 부분*/
        nav {
            border-top: 1px solid #DDD;
            border-bottom: 1px solid #DDD;
            padding-top: 15px;
            padding-bottom: 15px;
            width: 798px;
            overflow: hidden;
        }
        nav ul{
            float: left;
            overflow: hidden;
        }
        nav li {
            float: left;
            display: inline;
            padding-left: 15px;
        }
        nav input{
            border: 1px solid #DDD;
        }
        nav input[type=text]{
            float: right;
            border-radius: 10px 0 0 10px;
            width: 200px;
            height: 20px;
            padding: 0 10px;
        }
        nav input[type=button]{
            margin-top: 1px;
            float: right;
            border-radius: 0 10px 10px 0;
            width: 50px;
            height: 22px;
            padding: 0 10px;
        }
        a{
            color: black;
            text-decoration: none;
        }
        a:hover{
            text-decoration: underline;
        }
        /* section 부분 */
        section{
            width: 598px;
            height: fit-content;
            float: left;
            border-bottom: 1px solid black;
        }
        /* aside 부분 */
        aside{
            width: 198px;
            height: auto;
            text-emphasis: 200px;
            float: right;
        }
        /* footer 부분 */
        footer{
            width: 798px;
            height: 30px;
        }
        
    </style>
</head>
<body>
    <div id="main" class="div_algin_center">
    	<!-- header -->
        <%@ include file="header.jsp" %>
        <!-- nav -->
        <%@ include file="nav.jsp" %>
            
        <div id="wrap" class="div_algin_center">
            <!-- aside -->
            <%@ include file="aside.jsp" %>
            <div id="section_collect">
                <!-- section -->
                <%@ include file="section.jsp" %>
            </div>
            
        </div>
        <!-- footer -->
        <%@ include file="footer.jsp" %>
    </div>

</body>
</html>