<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax Basic</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function(){
		
		$.ajax('data.html', {	// 경로, 속성
			success: function(data){	// 매개변수
				$('body').append(data); // data를 body뒤에
			}
		});
	});
</script>
</head>
<body>
	ajax-1.jsp
</body>
</html>