<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Cart</title>
</head>
<body>

<%
// cartId 상태 확인 
String id = request.getParameter("cartId");
if (id == null || id.trim().equals("")) {
	response.sendRedirect("cart.jsp");
	return;
}

// 세션를 전부 날리지 않고 cartlist객체만 세션에서 제거
session.removeAttribute("cartlist");

response.sendRedirect("cart.jsp");


%>


</body>
</html>