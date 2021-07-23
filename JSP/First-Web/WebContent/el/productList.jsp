<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="product" class="product.Product" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 리스트 : 원하시는 상품을 선택하세요</h1>
	<form action="productSelect.jsp">
		<select name="select">
			<%
				for(int i=0;i<product.getProductList().length;i++){
					out.println("<option>" + product.getProductList()[i] + "</option>");
				}
			%>
		</select>
		<input type="submit">
	</form>
</body>
</html>
<!-- 1. session 객체(scope)의 product(id) 이름의 속성이 있는지 확인 
2. 있다면 -> 현재 product 이름의 변수에 session 영역에 저장되어 있는 객체를 저장
3. 없다면 -> product.Product 클래스로 객체 생성하고 
		  session영역의 속성에 객체를 저장 product 이름으로 저장
Product p session.getAttribute("product");
if(p==null){
	p = new Product();
	session.setAttribute("prodect", p);
} -->

<%-- <%= product %>
<br>
${ product } --%>