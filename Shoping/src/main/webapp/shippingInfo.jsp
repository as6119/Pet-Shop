<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%-- 디자인 통일감을 위한 폰트 및 아이콘 설정 --%>
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<title>Shipping Information</title>

<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #fdfdfd; }
    
    /* 상단 배너 디자인 */
    .shipping-header {
        background: linear-gradient(to bottom, #FFF8E1, #ffffff);
        padding: 60px 0;
        border-bottom: 1px solid #FFECB3;
        margin-bottom: 40px;
        text-align: center;
    }
    .header-title {
        font-family: 'Fredoka One', cursive;
        color: #FF6F00;
        font-size: 2.8rem;
    }

    /* 배송 정보 컨테이너 스타일 */
    .shipping-container {
        background: #ffffff;
        padding: 50px;
        border-radius: 30px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.03);
        border: 1px solid #f1f1f1;
        margin-bottom: 100px;
        max-width: 800px;
        margin-left: auto;
        margin-right: auto;
    }

    /* 입력 항목 라벨 스타일 */
    .col-form-label {
        font-weight: 700;
        color: #5D4037;
        display: flex;
        align-items: center;
    }
    .col-form-label i {
        margin-right: 12px;
        color: #FFB300;
        width: 25px;
        text-align: center;
    }

    /* 입력창 포커스 스타일 */
    .form-control {
        border-radius: 12px;
        border: 1.5px solid #eee;
        padding: 12px 15px;
        transition: all 0.3s;
    }
    .form-control:focus {
        border-color: #FFB300;
        box-shadow: 0 0 0 0.2rem rgba(255, 179, 0, 0.15);
        background-color: #fffaf0;
    }

    /* 하단 버튼 영역 */
    .btn-submit {
        background: linear-gradient(45deg, #FFB300, #FF6F00);
        color: #fff;
        border: none;
        border-radius: 50px;
        padding: 15px 50px;
        font-weight: 700;
        font-size: 1.1rem;
        box-shadow: 0 5px 20px rgba(255, 111, 0, 0.2);
        transition: 0.3s;
    }
    .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(255, 111, 0, 0.3);
        color: #fff;
    }

    .btn-back {
        background-color: #EFEBE9;
        color: #8D6E63;
        border: none;
        border-radius: 50px;
        padding: 15px 40px;
        font-weight: 700;
        transition: 0.3s;
        text-decoration: none;
        display: inline-block;
    }
    .btn-back:hover { background-color: #D7CCC8; color: #5D4037; text-decoration: none; }

    /* 단계 표시 바 (선택 사항) */
    .step-indicator {
        margin-bottom: 30px;
        color: #BDBDBD;
        font-weight: 700;
        font-size: 0.9rem;
    }
    .step-indicator .active { color: #FF6F00; }
</style>
</head>

<body>
<jsp:include page="menu.jsp" />

<div class="shipping-header">
    <div class="container">
        <h1 class="header-title">Shipping Info</h1>
        <p class="text-muted text-uppercase" style="letter-spacing: 2px;">Where should we send your happiness?</p>
    </div>
</div>

<div class="container">
    <div class="shipping-container">
        <%-- 단계 안내 --%>
        <div class="step-indicator text-center">
            <span>Cart</span> <i class="fas fa-chevron-right mx-2"></i> 
            <span class="active">Shipping</span> <i class="fas fa-chevron-right mx-2"></i> 
            <span>Order Confirmation</span>
        </div>

        <form action="./processShippingInfo.jsp" method="post" class="mt-4">
            
            <%-- 수령인 성함 --%>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-user"></i> Recipient</label>
                <div class="col-sm-6">
                   <input type="text" name="name" class="form-control" placeholder="Full name" required>
                </div>        
            </div>

            <%-- 희망 배송일 --%>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-calendar-alt"></i> Delivery Date</label>
                <div class="col-sm-5">
                   <input type="text" name="shippingDate" class="form-control" placeholder="yyyy/mm/dd" required>
                   <small class="text-muted ml-1">Example: 2026/05/20</small>
                </div>        
            </div>
            
            <%-- 배송 주소 --%>
            <div class="form-group row mb-5">
                <label class="col-sm-3 col-form-label"><i class="fas fa-map-marker-alt"></i> Address</label>
                <div class="col-sm-9">
                   <input type="text" name="addressName" class="form-control" placeholder="Detailed shipping address" required>
                </div>        
            </div>
            
            <hr class="my-5" style="border-top: 1px dashed #eee;">

            <%-- 하단 컨트롤 버튼 --%>
            <div class="row">
                <div class="col-sm-12 text-center">
                    <a href="./cart.jsp" class="btn btn-back mr-2 shadow-sm">
                        <i class="fas fa-arrow-left mr-2"></i> Back to Cart
                    </a>
                    <button type="submit" class="btn btn-submit shadow">
                        Next Step <i class="fas fa-chevron-right ml-2"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>