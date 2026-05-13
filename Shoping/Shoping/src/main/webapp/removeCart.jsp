<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Item</title>
</head>
<body>
<%-- 삭제할 상품의 ID를 가져오기 --%>
<%
String id = request.getParameter("id");
if (id == null || id.trim().equals("")){
	response.sendRedirect("cart.jsp");
	return;
}
// 세션에서 장바구니 리스트 호출
ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
if(cartList != null){
	// 리스트를 돌며 해당ID를 가진 상품을 찾아 삭제
	for (int i = 0; i < cartList.size(); i++) {
            Product goodsQnt = cartList.get(i);
            if (goodsQnt.getProductId().equals(id)) {
                cartList.remove(goodsQnt);
                break; // 찾아서 삭제했으면 반복문을 빠져나갑니다.
            }
        }
} // 완료 이후에는 다시 장바구니 페이지로 돌아간다.
response.sendRedirect("cart.jsp");
%>


</body>
</html>