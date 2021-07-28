<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function(){
		
		/* $.get('data.html', function(data){
			$('body').html(data);
		}); */
		
		$.post('data.html', function(data){
			$('body').html(data);
			
		});
	});
</script>
</head>
<body>
	ajax-4.jsp
</body>
</html>