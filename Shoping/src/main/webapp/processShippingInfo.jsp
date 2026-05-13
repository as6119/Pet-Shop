<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processShippingInfo</title>
</head>
<body>

<%
    // 한글 깨짐 방지 설정
    request.setCharacterEncoding("UTF-8");
    String cartId = session.getId();


    // 폼에서 넘어온 데이터 받기
    String name = request.getParameter("name");
    String shippingDate = request.getParameter("shippingDate");
    String addressName = request.getParameter("addressName");

    // 쿠키 생성 (한글은 인코딩이 필요합니다)
    Cookie cookieName = new Cookie("Shipping_Name", URLEncoder.encode(name, "UTF-8"));
    Cookie cookieDate = new Cookie("Shipping_Date", URLEncoder.encode(shippingDate, "UTF-8"));
    Cookie cookieAddress = new Cookie("Shipping_AddressName", URLEncoder.encode(addressName, "UTF-8"));

    // 쿠키 유효 기간 설정 (예: 24시간)
    cookieName.setMaxAge(24 * 60 * 60);
    cookieDate.setMaxAge(24 * 60 * 60);
    cookieAddress.setMaxAge(24 * 60 * 60);
    
 // [추가] 주문 번호용 쿠키 생성
    Cookie cookieCartId = new Cookie("Shipping_CartId", URLEncoder.encode(cartId, "UTF-8"));
    cookieCartId.setMaxAge(24 * 60 * 60); // 24시간 유지

    // 브라우저로 쿠키 전송
    response.addCookie(cookieName);
    response.addCookie(cookieDate);
    response.addCookie(cookieAddress);
    response.addCookie(cookieCartId);
    

    // 주문 확인 페이지로 이동
    response.sendRedirect("orderConfirmation.jsp");
%>

</body>
</html>