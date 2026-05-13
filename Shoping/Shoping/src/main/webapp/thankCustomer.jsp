<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
    
<%
    String shipping_cartId = "";
    Cookie[] cookies = request.getCookies();
    
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) { 
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();

            if (n.equals("Shipping_CartId")) {
                shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
            }
            
            // 사용이 끝난 배송 관련 쿠키 삭제
            if (n.startsWith("Shipping_")) {
                thisCookie.setMaxAge(0);
                thisCookie.setPath(request.getContextPath());
                response.addCookie(thisCookie);
            }
        }
    }
    // 장바구니 세션 비우기
    session.removeAttribute("cartlist");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <%-- 디자인 통일감을 위한 폰트 및 아이콘 설정 --%>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <title>Order Complete</title>

    <style>
        body { font-family: 'Noto Sans KR', sans-serif; background-color: #fdfdfd; }
        
        /* 상단 축하 배너 */
        .complete-header {
            background: linear-gradient(to bottom, #FFF8E1, #ffffff);
            padding: 80px 0;
            border-bottom: 1px solid #FFECB3;
            margin-bottom: 40px;
            text-align: center;
        }
        .header-title {
            font-family: 'Fredoka One', cursive;
            color: #FF6F00;
            font-size: 3.5rem;
            margin-top: 20px;
        }

        /* 완료 카드 컨테이너 */
        .complete-container {
            background: #ffffff;
            padding: 60px 40px;
            border-radius: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.03);
            border: 1px solid #f1f1f1;
            margin-bottom: 100px;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        /* 체크 아이콘 애니메이션 스타일 */
        .success-icon {
            font-size: 5rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        /* 주문 번호 박스 */
        .order-number-box {
            background-color: #FAFAFA;
            border: 2px dashed #FFECB3;
            border-radius: 15px;
            padding: 20px;
            margin: 30px 0;
        }
        .order-label {
            font-weight: 700;
            color: #8D6E63;
            text-transform: uppercase;
            font-size: 0.9rem;
            display: block;
            margin-bottom: 5px;
        }
        .order-id {
            font-family: 'Fredoka One', cursive;
            font-size: 1.8rem;
            color: #5D4037;
        }

        /* 버튼 스타일 */
        .btn-home {
            background: linear-gradient(45deg, #FFB300, #FF6F00);
            color: #fff;
            border: none;
            border-radius: 50px;
            padding: 15px 50px;
            font-weight: 700;
            font-size: 1.1rem;
            box-shadow: 0 5px 20px rgba(255, 111, 0, 0.2);
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        .btn-home:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 111, 0, 0.3);
            color: #fff;
            text-decoration: none;
        }
    </style>
</head>

<body>
<jsp:include page="menu.jsp" />

<div class="complete-header">
    <div class="container">
        <i class="fas fa-gift fa-3x text-warning"></i>
        <h1 class="header-title">Thank You!</h1>
        <p class="text-muted text-uppercase" style="letter-spacing: 3px;">Your order has been placed</p>
    </div>
</div>

<div class="container">
    <div class="complete-container">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        
        <h2 style="font-weight: 700; color: #5D4037; margin-bottom: 15px;">Order Successfully Completed!</h2>
        <p class="text-muted">We have received your order and will start processing it right away.<br>
        A confirmation message will be sent to your email.</p>

        <%-- 주문 번호 출력 섹션 --%>
        <div class="order-number-box">
            <span class="order-label">Order Number</span>
            <span class="order-id"><%= shipping_cartId %></span>
        </div>

        <div class="mt-5">
            <p class="mb-4 text-muted">Want to see more amazing products?</p>
            <a href="./products.jsp" class="btn btn-home">
                <i class="fas fa-shopping-bag mr-2"></i> Continue Shopping
            </a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>