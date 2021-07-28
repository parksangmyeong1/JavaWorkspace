<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax Basic2</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function(){
		
		$.ajax({
			url : 'data.html',
			success : function(data){
				$('body').html(data);
			}
		});
	});
</script>
</head>
<body>
	ajax-2.jsp
</body>
</html>