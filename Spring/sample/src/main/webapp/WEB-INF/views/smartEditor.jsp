<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>smarteditor</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>  
<script type="text/javascript" src="<c:url value='/smarteditor2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
</head>
<body>
	<h1>초기화면</h1>
		<form action="">
			<span>제목</span><input type="text" name="postTitle">
			<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
			<button type="button" class="btn">작성내용 콘솔에 찍기!!</button>
		</form>
</body>
	<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "<c:url value='/smarteditor2/SmartEditor2Skin.html'/>",
		fCreator: "createSEditor2"
	});
	
	$(".btn").on("click", function() {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		var value = document.getElementById("ir1").value;
		console.log(value);
	});
	</script>
</html>