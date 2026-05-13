<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%-- 상단바와 통일감을 주는 폰트 설정 --%>
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

<title>Product List</title>
<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #fff; }
    
    /* 상단 배너 영역 디자인 */
    .product-header {
        background-color: #FFF8E1; /* 부드러운 아이보리 */
        padding: 60px 0;
        border-bottom: 2px solid #FFECB3;
        margin-bottom: 50px;
        text-align: center;
    }
    .header-title {
        font-family: 'Fredoka One', cursive;
        color: #FF6F00;
        font-size: 3rem;
    }

    /* 상품 카드 디자인 개선 */
    .product-card { 
        margin-bottom: 40px; 
        border: none; 
        padding: 20px; 
        border-radius: 20px; 
        background: #fff;
        transition: transform 0.3s ease;
    }
    .product-card:hover {
        transform: translateY(-10px); /* 마우스 올리면 살짝 위로 */
    }
    
    /* 펫 타입 뱃지 디자인 */
    .pet-badge { 
        font-size: 0.75rem; 
        font-weight: 700;
        padding: 5px 12px; 
        border-radius: 50px; 
        margin-bottom: 15px; 
        display: inline-block;
        text-transform: uppercase;
    }
    .dog-badge { background-color: #FFE0B2; color: #E65100; } /* 강아지: 따뜻한 주황 */
    .cat-badge { background-color: #E1F5FE; color: #01579B; } /* 고양이: 시원한 파랑 */

    /* 버튼 커스터마이징 */
    .btn-detail {
        background-color: #FFB300;
        color: #fff;
        border: none;
        border-radius: 50px;
        padding: 8px 20px;
        font-weight: 700;
        transition: 0.3s;
    }
    .btn-detail:hover {
        background-color: #FF6F00;
        color: #fff;
    }
    
    .product-img {
        width: 100%; 
        height: 220px; 
        object-fit: contain; 
        border-radius: 15px;
        margin-bottom: 15px;
    }
</style>
</head>

<body>
    <%-- 직접 작성한 navbar 대신 공통 메뉴 모듈을 가져옵니다 --%>
    <jsp:include page="menu.jsp"/>
    
    <%-- 상단 타이틀 영역 --%>
    <div class="product-header">
        <div class="container">
            <h1 class="header-title">Product List</h1>
            <p class="text-muted">Best choices for your beloved pets</p>
        </div>
    </div>
    
    <% 
    // useBean 대신 싱글톤 인스턴스를 직접 가져옵니다.
    ProductRepository productDAO = ProductRepository.getInstance(); 
    ArrayList<Product> listOfProducts = productDAO.getAllProducts(); 
    %>
    
    <div class="container">
        <div class="row">
        <%
        for (int i= 0; i <listOfProducts.size(); i++){
            Product product = listOfProducts.get(i);
        %>
            <div class="col-md-4">
                <div class="product-card shadow-sm text-center">
                    <%-- 고양이와 강아지 타입 표시 뱃지 --%>
                    <%-- 수정 코드: "Dog".equals(...) 로 순서를 바꾸면 null이어도 에러가 안 납니다! --%>
                    <span class="pet-badge <%= "Dog".equals(product.getPetType()) ? "dog-badge" : "cat-badge" %>">
                      <i class="fas <%= "Dog".equals(product.getPetType()) ? "fa-dog" : "fa-cat" %>"></i>
                      <%= product.getPetType() %>
                    </span>
                    
                    <!-- 이미지 출력 부분 -->
                    <img src="./resources/images/<%=product.getFilename()%>" class="product-img" alt="<%=product.getPname()%>">
                    
                    <h4 class="font-weight-bold" style="color: #5D4037;"><%=product.getPname() %></h4>
                    <p class="text-muted px-2" style="font-size: 0.9rem; height: 50px; overflow: hidden;">
                        <%= product.getDescription() %>
                    </p>
                    <p class="h5 mb-4" style="color: #FF6F00;"><b>$<%= product.getUnitPrice() %></b></p>
                    
                    <%-- 나중에 작성할 상세 페이지로 연결할 버튼 --%>
                    <p>
                        <a href="./product.jsp?id=<%= product.getProductId() %>" class="btn btn-detail" role="button">
                            View Detail &raquo;
                        </a>
                    </p>
                </div>
            </div>
        <% } %>
        </div>
    </div>
    
    <%-- 하단 정보 모듈 --%>
    <jsp:include page="footer.jsp" />

</body>
</html>