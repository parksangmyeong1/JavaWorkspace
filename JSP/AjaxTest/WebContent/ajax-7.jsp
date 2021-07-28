<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax Find&Each</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function(){
		
		$.ajax({
			url : 'data.xml',
			success : function(data){
				$(data).find('product').each(function(){
					var pname = $(this).find('name').text();
					var price = $(this).find('price').text();
					var html = '<h3>이름 : '+ pname +' , 가격 : ' + price + '</h3>';
					$('body').append(html);
				});
			}
		});
	});
</script>
</head>
<body>

</body>
</html>