<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>

<%
    // 배송 정보를 쿠키에서 가져오기
    String shipping_name = "";
    String shipping_date = "";
    String shipping_addressName = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();
            
            if (n.equals("Shipping_Name")) shipping_name = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
            if (n.equals("Shipping_Date")) shipping_date = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
            if (n.equals("Shipping_AddressName")) shipping_addressName = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <title>Order Confirmation</title>

    <style>
        body { font-family: 'Noto Sans KR', sans-serif; background-color: #fdfdfd; }
        
        /* 상단 헤더 */
        .order-header {
            background: linear-gradient(to bottom, #FFF8E1, #ffffff);
            padding: 50px 0;
            border-bottom: 1px solid #FFECB3;
            margin-bottom: 40px;
            text-align: center;
        }
        .header-title {
            font-family: 'Fredoka One', cursive;
            color: #FF6F00;
            font-size: 2.5rem;
        }

        /* 영수증 카드 스타일 */
        .receipt-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.05);
            border: 1px solid #eee;
            margin-bottom: 80px;
            position: relative;
        }
        
        /* 영수증 상단 데코레이션 */
        .receipt-container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 10px;
            background-color: #FFB300;
            border-radius: 0 0 10px 10px;
        }

        .receipt-title {
            font-family: 'Fredoka One', cursive;
            color: #5D4037;
            letter-spacing: 2px;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        /* 정보 섹션 스타일 */
        .info-box {
            background-color: #FAFAFA;
            padding: 20px;
            border-radius: 15px;
            border-left: 5px solid #FFECB3;
            margin-bottom: 30px;
        }
        .info-label { font-weight: 700; color: #8D6E63; width: 120px; display: inline-block; }
        .info-content { color: #5D4037; }

        /* 테이블 디자인 */
        .table thead th {
            border-top: none;
            color: #8D6E63;
            font-size: 0.9rem;
            text-transform: uppercase;
        }
        .total-row {
            font-size: 1.3rem;
            color: #FF6F00;
            font-weight: 700;
        }

        /* 버튼 스타일 */
        .btn-pay {
            background: linear-gradient(45deg, #FFB300, #FF6F00);
            color: #fff;
            border: none;
            border-radius: 50px;
            padding: 15px 50px;
            font-weight: 700;
            box-shadow: 0 5px 20px rgba(255, 111, 0, 0.2);
        }
        .btn-pay:hover { color: #fff; transform: translateY(-2px); }
        
        .btn-sub {
            background-color: #EFEBE9;
            color: #8D6E63;
            border: none;
            border-radius: 50px;
            padding: 15px 30px;
            font-weight: 700;
            text-decoration: none;
        }
        .btn-sub:hover { background-color: #D7CCC8; color: #5D4037; }
    </style>
</head>

<body>
<jsp:include page="menu.jsp" />

<div class="order-header">
    <div class="container">
        <h1 class="header-title">Confirmation</h1>
        <p class="text-muted">PLEASE CHECK YOUR ORDER DETAILS</p>
    </div>
</div>

<div class="container">
    <div class="receipt-container col-lg-8 mx-auto">
        <div class="text-center">
            <h2 class="receipt-title"><i class="fas fa-receipt mr-2"></i> Receipt</h2>
        </div>

        <%-- 배송 정보 섹션 --%>
        <div class="info-box">
            <h5 class="mb-3" style="font-weight: 700; color: #5D4037;">Shipping Details</h5>
            <div class="mb-2">
                <span class="info-label">Name</span>
                <span class="info-content"><%= shipping_name %></span>
            </div>
            <div class="mb-2">
                <span class="info-label">Address</span>
                <span class="info-content"><%= shipping_addressName %></span>
            </div>
            <div>
                <span class="info-label">Arrival Date</span>
                <span class="info-content"><%= shipping_date %></span>
            </div>
        </div>

        <%-- 주문 상품 목록 --%>
        <table class="table mt-4">
            <thead>
                <tr class="text-center">
                    <th class="text-left">Product</th>
                    <th>Qty</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int sum = 0;
                    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
                    if (cartList == null) cartList = new ArrayList<Product>();

                    for (int i = 0; i < cartList.size(); i++) {
                        Product product = cartList.get(i);
                        int total = product.getUnitPrice() * product.getQuantity();
                        sum += total;
                %>
                <tr class="text-center">
                    <td class="text-left"><strong><%= product.getPname() %></strong></td>
                    <td><%= product.getQuantity() %></td>
                    <td><%= product.getUnitPrice() %> $</td>
                    <td class="font-weight-bold"><%= total %> $</td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2"></td>
                    <td class="text-right align-middle" style="color: #8D6E63; font-weight: 700;">TOTAL AMOUNT</td>
                    <td class="text-center total-row"><%= sum %> $</td>
                </tr>
            </tfoot>
        </table>

        <%-- 최종 액션 버튼 --%>
        <div class="text-center mt-5">
            <div class="btn-group w-100">
                <a href="./shippingInfo.jsp" class="btn btn-sub mr-2">
                    <i class="fas fa-chevron-left mr-2"></i> Back
                </a>
                <a href="./thankCustomer.jsp" class="btn btn-pay flex-grow-1">
                    <i class="fas fa-check-circle mr-2"></i> PAY NOW
                </a>
                <a href="./checkOutCancelled.jsp" class="btn btn-sub ml-2">
                    Cancel
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>