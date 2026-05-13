<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.util.ArrayList" %>

<%-- 싱글톤 객체 사용을 위해 getInstance() 호출 --%>
<%
    ProductRepository productDAO = ProductRepository.getInstance();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%-- 디자인 통일감을 위한 폰트 및 아이콘 설정 --%>
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<title>Unit Information</title>

<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #fff; }
    
    /* 상단 배너 영역 */
    .info-header {
        background-color: #FFF8E1;
        padding: 50px 0;
        border-bottom: 2px solid #FFECB3;
        margin-bottom: 50px;
        text-align: center;
    }
    .header-title {
        font-family: 'Fredoka One', cursive;
        color: #FF6F00;
        font-size: 2.8rem;
    }

    /* 상품 이미지 스타일 */
    .img-container {
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        background: #fff;
        padding: 20px;
    }
    .product-img {
        width: 100%;
        height: auto;
        object-fit: contain;
        transition: transform 0.3s;
    }

    /* 텍스트 및 테이블 스타일 */
    .product-name {
        font-weight: 700;
        color: #5D4037;
        margin-bottom: 10px;
    }
    .pet-type-tag {
        font-size: 0.9rem;
        color: #FF6F00;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    .price-tag {
        font-size: 2rem;
        color: #FF6F00;
        font-weight: 700;
        margin: 20px 0;
    }
    
    .table th {
        border-top: none;
        color: #8D6E63;
        font-weight: 700;
    }
    .table td { border-top: none; color: #333; }

    /* 버튼 스타일 */
    .btn-cart {
        background-color: #FFB300;
        color: #fff;
        border: none;
        border-radius: 50px;
        padding: 12px 30px;
        font-weight: 700;
        transition: 0.3s;
        margin-right: 10px;
    }
    .btn-cart:hover {
        background-color: #FF6F00;
        color: #fff;
        transform: translateY(-2px);
    }
    .btn-list {
        background-color: #EFEBE9;
        color: #5D4037;
        border: none;
        border-radius: 50px;
        padding: 12px 30px;
        font-weight: 700;
        transition: 0.3s;
    }
    .btn-list:hover { background-color: #D7CCC8; }
</style>

<%-- 장바구니 cart 확인 스크립트 --%>
<script type="text/javascript">
function addToCart(){
    if(confirm("Add this product to your cart?")){
        document.addForm.submit();
    }
}
</script>
</head>

<body>
<jsp:include page="menu.jsp" />

<div class="info-header">
    <div class="container"> 
        <h1 class="header-title">Product Details</h1> 
        <p class="text-muted text-uppercase">Premium quality for your pet family</p>
    </div>
</div>
    
<% 
    String id = request.getParameter("id");
    Product product = null;
    java.util.ArrayList<Product> listOfProducts = productDAO.getAllProducts();
    
    for (int i = 0; i < listOfProducts.size(); i++){
        Product vo = listOfProducts.get(i);
        if (vo != null && vo.getProductId() != null && vo.getProductId().equals(id)){
            product = vo;
            break;
        }
    }

    if (product == null){
        out.println("<div class='container text-center my-5'><h3>No product found.</h3><a href='./products.jsp' class='btn btn-secondary mt-3'>Back to List</a></div>");
    } else {
%>
    
<div class="container mb-5">
    <div class="row align-items-center">
        <%-- 왼쪽 : 상품 이미지 공간 --%>
        <div class="col-md-5 mb-4">
            <div class="img-container text-center">
                <% if (product.getFilename() != null && !product.getFilename().isEmpty()) { %>
                    <img src="./resources/images/<%=product.getFilename()%>" class="product-img" alt="<%=product.getPname()%>" />
                <% } else { %>
                    <img src="https://via.placeholder.com/400x400?text=No+Image" class="product-img" alt="No Image">
                <% } %>
            </div>
        </div>
            
        <%-- 오른쪽: 상세 정보 --%>
        <div class="col-md-7 px-lg-5">
            <div class="pet-type-tag">
                <i class="fas <%= "Dog".equals(product.getPetType()) ? "fa-dog" : "fa-cat" %>"></i>
                <%=product.getPetType()%> Choice
            </div>
            <h2 class="product-name"><%= product.getPname() %></h2>
            <hr>
            <p class="text-muted mb-4"><%= product.getDescription() %></p>
            
            <%-- 정보를 테이블로 정리 --%>
            <table class="table mt-4">
                <tr>
                    <th width="30%"><i class="fas fa-tag mr-2"></i> Code</th>
                    <td><span class="badge badge-pill badge-light p-2 text-brown"><%=product.getProductId() %></span></td>
                </tr>
                <tr>
                    <th><i class="fas fa-industry mr-2"></i> Brand</th>
                    <td><%= product.getManufacturer() %></td>
                </tr>
                <tr>
                    <th><i class="fas fa-th-large mr-2"></i> Category</th>
                    <td><%= product.getCategory() %></td>
                </tr>
                <tr>
                    <th><i class="fas fa-box mr-2"></i> Stock</th>
                    <td><%= product.getUnitsInStock() %> units available</td>
                </tr>
            </table>
            
            <div class="price-tag">$<%= product.getUnitPrice() %></div>

            <div class="mt-4">
                <%-- 장바구니 전송 폼 --%>
                <form name="addForm" action="./addCart.jsp?id=<%= product.getProductId() %>" method="post">
                    <%-- 상품 담기 버튼 --%>
                    <button type="button" class="btn btn-cart shadow-sm" onclick="addToCart()">
                        <i class="fas fa-shopping-cart mr-2"></i> Add to Cart
                    </button>
                    <%-- 목록 돌아가기 버튼 --%>
                    <a href="./products.jsp" class="btn btn-list">
                        <i class="fas fa-list mr-2"></i> Product List
                    </a>
                </form>
            </div>
        </div>
    </div>
</div>
<%
    } // else 문 종료
%>

<jsp:include page="footer.jsp" />
</body>
</html>