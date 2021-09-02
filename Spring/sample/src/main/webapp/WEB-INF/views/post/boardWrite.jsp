<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<link href="/js/summernote-ko-KR.js">
<title>글쓰기</title>

<script>
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: 'content',
	    minHeight: 500,             // 최소 높이
	    maxHeight: null,             // 최대 높이
	    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	    lang: "ko-KR",					// 한글 설정
	    /* callbacks: {
			onImageUpload: function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
		            sendFile(files[i], this);
				}
	        }
		} */
	});
	/* function sendFile(files, el) {
		var form_data = new FormData();
		form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '/uploadSummernoteImageFile',
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage', img_name);
          		console.log('성공');
        	},
        	error: function(){
        		console.log('에러');
        	}
      	});
    }
	 */
});
</script>
</head>
<body>
<h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" method="post">
		<input type="number" name="memIdx" style="width: 20%;" placeholder="멤버 idx"/><br>
		<input type="text" name="postWriter" style="width: 20%;" placeholder="작성자"/><br>
		<input type="text" name="postSort" style="width: 20%;" placeholder="카테고리"/><br>
		<input type="text" name="postTitle" style="width: 40%;" placeholder="제목"/>
		<br><br> 
		<textarea id="summernote" name="postContent"></textarea>
		<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
<script>
	function goWrite(frm) {
		var postTitle = frm.postTitle.value;
		var postWriter = frm.postWriter.value;
		var postContent = frm.postContent.value;
		
		if (postWriter.trim() == ''){
			alert("작성자를 입력해주세요");
			return false;
		}
		if (postTitle.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		
		if (postContent.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
	}
	
	// 콜백함수
	function uploadSummernoteImageFile(file, editor) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/uploadSummernoteImageFile",
            contentType : false,
            processData : false,
            success : function(data) {
                //항상 업로드된 파일의 url이 있어야 한다.
                $(editor).summernote('insertImage', data.url);
            }
        });
    }
</script>
</body>
</html>