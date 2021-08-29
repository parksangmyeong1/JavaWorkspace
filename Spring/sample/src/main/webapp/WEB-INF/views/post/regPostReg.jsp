<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판 등록 화면</h1>
	
	<form method="post">
			<table>
				<tr>
					<td>멤버 idx</td>
					<td>
						<input type="number" name="memIdx" id="memIdx" class="form-control m-2">
						</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>
						<input type="text" name="postWriter" class="form-control m-2">
						</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<input type="text" name="postSort" class="form-control m-2">
						</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="postTitle" ></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="postContent" ></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="등록" > <input type="reset" >
					</td>
				</tr>
			</table>
		</form>
</body>
</html>