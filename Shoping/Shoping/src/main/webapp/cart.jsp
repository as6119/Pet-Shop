<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%-- 디자인 통일감을 위한 폰트 및 아이콘 설정 --%>
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<title>Shopping Cart</title>

<%
    // 세션에서 로그인 아이디(sessionId)를 가져옵니다.
    String sessionId = (String) session.getAttribute("sessionId");
    
    // 세션 아이디(장바구니 식별용) 및 장바구니 리스트 호출
    String cartId = session.getId();
    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
    if(cartList == null) {
        cartList = new ArrayList<Product>();
    }
%>

<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #fdfdfd; }
    
    .cart-header {
        background-color: #FFF8E1;
        padding: 50px 0;
        border-bottom: 2px solid #FFECB3;
        margin-bottom: 40px;
        text-align: center;
    }
    .header-title {
        font-family: 'Fredoka One', cursive;
        color: #FF6F00;
        font-size: 2.8rem;
    }

    .cart-container {
        background: #ffffff;
        padding: 30px;
        border-radius: 25px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        border: 1px solid #eee;
        margin-bottom: 50px;
    }

    .table thead th {
        border-top: none;
        background-color: #fcfcfc;
        color: #8D6E63;
        font-weight: 700;
        text-transform: uppercase;
        font-size: 0.9rem;
    }

    .table td { vertical-align: middle !important; color: #5D4037; }

    .btn-reset {
        background-color: #FFEBEE;
        color: #EF5350;
        border: none;
        border-radius: 50px;
        font-weight: 700;
        padding: 8px 20px;
        transition: 0.3s;
    }
    .btn-reset:hover { background-color: #EF5350; color: #fff; }

    .btn-order {
        background-color: #FFB300;
        color: #fff;
        border: none;
        border-radius: 50px;
        font-weight: 700;
        padding: 12px 40px;
        font-size: 1.1rem;
        transition: 0.3s;
    }
    .btn-order:hover { background-color: #FF6F00; color: #fff; transform: translateY(-2px); }
    
    .btn-order.disabled { background-color: #eee; color: #bbb; cursor: not-allowed; }

    .btn-continue {
        color: #8D6E63;
        font-weight: 700;
        text-decoration: none;
    }
    .btn-continue:hover { color: #5D4037; }

    .total-section {
        font-size: 1.5rem;
        font-weight: 700;
        color: #FF6F00;
    }
</style>
</head>

<body>
<jsp:include page="menu.jsp" />

<div class="cart-header">
    <div class="container">
        <h1 class="header-title">My Cart</h1>
        <p class="text-muted text-uppercase">Check your items before check out</p>
    </div>
</div>

<div class="container">
    <div class="row mb-4">
        <div class="col-md-6 text-left">
            <a href="./products.jsp" class="btn-continue"><i class="fas fa-arrow-left"></i> Keep Shopping</a>
        </div>
        <div class="col-md-6 text-right">
            <a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-reset shadow-sm">
                <i class="fas fa-trash-alt"></i> Cart Reset
            </a>
        </div>
    </div>

    <div class="cart-container">
        <table class="table text-center">
            <thead>
                <tr>
                    <th class="text-left">Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Manage</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int sum = 0;
                    if (cartList.isEmpty()) {
                %>
                <tr>
                   <td colspan="5" class="py-5">
                       <div class="text-muted">
                           <i class="fas fa-shopping-basket fa-3x mb-3" style="opacity: 0.3;"></i>
                           <p>Your shopping cart is empty.</p>
                       </div>
                   </td>
                </tr>
                <%
                    } else {
                        for (int i=0; i < cartList.size(); i++) {
                            Product product = cartList.get(i);
                            int total = product.getUnitPrice() * product.getQuantity();
                            sum += total;
                %>
                    <tr>
                        <td class="text-left">
                            <span class="badge badge-light mr-2 text-brown"><%=product.getProductId()%></span>
                            <b style="font-size: 1.1rem;"><%=product.getPname()%></b>
                        </td>
                        <td><%=product.getUnitPrice()%> $</td>
                        <td>
                            <span class="px-3 py-1" style="background: #f8f9fa; border-radius: 10px; border: 1px solid #eee;">
                                <%=product.getQuantity()%>
                            </span>
                        </td>
                        <td class="font-weight-bold"><%=total%> $</td>
                        <td>
                            <a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="text-danger" title="Remove item">
                                <i class="fas fa-times-circle fa-lg"></i>
                            </a>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <% if (!cartList.isEmpty()) { %>
        <div class="row mt-5 align-items-center">
            <div class="col-md-6 offset-md-6 text-right">
                <div class="p-4" style="background-color: #FFFDE7; border-radius: 20px; border: 1px dashed #FFD54F;">
                    <span class="mr-4 text-muted">Estimated Total Cost</span>
                    <span class="total-section"><%=sum%> $</span>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <%-- 하단 주문하기 버튼 영역 (로그인 체크 로직 적용) --%>
    <div class="text-center mb-5">
        <% if (!cartList.isEmpty()) { %>
            <%-- 장바구니에 상품이 있을 때 로그인 상태 확인 --%>
            <% if (sessionId != null) { %>
                <%-- 로그인 상태인 경우 배송 정보 입력창으로 이동 --%>
                <a href="./shippingInfo.jsp" class="btn btn-order shadow">
                    <i class="fas fa-credit-card mr-2"></i> Proceed to Order
                </a>
            <% } else { %>
                <%-- 로그인 상태가 아닌 경우 로그인 페이지로 유도 --%>
                <a href="./login.jsp" class="btn btn-order shadow" onclick="alert('Please login first to proceed with your order.');">
                    <i class="fas fa-sign-in-alt mr-2"></i> Login to Order
                </a>
            <% } %>
        <% } else { %>
            <%-- 장바구니가 비어있는 경우 버튼 비활성화 --%>
            <a href="#" class="btn btn-order disabled shadow-none" onclick="alert('Your cart is empty!'); return false;">
                <i class="fas fa-credit-card mr-2"></i> Proceed to Order
            </a>
        <% } %>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>