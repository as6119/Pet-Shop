<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 톰캣 보안 인증을 통해 세션에서 우리가 직접 저장한 ID를 가져옵니다.
    String loginId = (String) session.getAttribute("sessionId");
%>

<!-- 색감 보강 및 폰트 설정 -->
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    :root {
        --primary-mango: #FFB300;  /* 활기찬 망고색 */
        --point-orange: #FF6F00;   /* 강조용 오렌지 */
        --deep-brown: #5D4037;     /* 신뢰감을 주는 브라운 */
        --soft-yellow: #FFF8E1;    /* 부드러운 배경색 */
    }

    body { font-family: 'Noto Sans KR', sans-serif; }

    /* menu.jsp는 상단 바를 만들기 위한것 - 화사한 톤으로 변경 */
    .pet-nav-bg {
        background-color: var(--soft-yellow); 
        border-bottom: 4px solid var(--primary-mango);
        padding: 10px 0;
    }

    /* 로고: 반려동물의 귀여움을 담은 색상 */
    .navbar-brand {
        font-family: 'Gaegu', cursive;
        font-size: 2.2rem;
        color: var(--point-orange) !important;
        text-shadow: 1px 1px 0px #fff;
    }

    /* 메뉴 링크: 마우스 올리면 브라운으로 강조 */
    .nav-link {
        color: var(--deep-brown) !important;
        font-weight: 700;
        margin: 0 5px;
        transition: 0.3s;
    }

    .nav-link:hover {
        color: var(--point-orange) !important;
        transform: scale(1.05);
    }

    /* 장바구니: 기존 노란색을 계승하되 더 선명하게 */
    .cart-highlight {
        color: #fff !important;
        background-color: var(--point-orange);
        border-radius: 50px;
        padding: 5px 15px !important;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    /* 사용자 ID 영역: 따뜻한 이름표 느낌 */
    .user-badge {
        background-color: #fff;
        border: 2px dashed var(--primary-mango);
        padding: 3px 10px;
        border-radius: 10px;
        color: var(--deep-brown);
        font-weight: 500;
    }
</style>

<nav class="navbar navbar-expand navbar-light pet-nav-bg sticky-top">
    <div class="container">
        <div class="navbar-header">
            <%-- 로고: 프로젝트의 진짜 첫 화면(메인)으로 연결 --%>
            <a class="navbar-brand" href="./welcome.jsp">
                <i class="fas fa-dog"></i> Pet Shop Mall
            </a>
        </div>
        
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <%-- Home: 역시 메인 화면으로 연결 --%>
                <li class="nav-item"><a class="nav-link" href="./welcome.jsp">Home</a></li>
                <%-- 상품 목록 페이지로 연결 --%>
                <li class="nav-item"><a class="nav-link" href="./products.jsp">Products</a></li>
                <%-- 상품 등록 --%>
                <li class="nav-item"><a class="nav-link" href="./addProduct.jsp">UpLoad</a></li>
            </ul>
            
            <ul class="navbar-nav ml-auto align-items-center">
                <%--장바구니 버튼 --%>
                <li class="nav-item">
                    <a class="nav-link cart-highlight" href="./cart.jsp">
                        <i class="fas fa-shopping-cart"></i> Cart
                    </a>
                </li>

                <%
                if(loginId == null){
                    // 로그인 안 된 상태면 로그인 버튼 표시
                %>
                    <li class="nav-item"><a class="nav-link" href="./login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="./addMember.jsp">Sign UP</a></li>
                <% 
                } else { 
                    // 로그인 된 상태면 ID와 Logout 버튼 표시
                %>
                    <li class="nav-item">
                        <span class="user-badge mx-2">
                            <i class="fas fa-heart" style="color: #e74c3c;"></i> <%=loginId%>
                        </span>
                    </li>
                    <li class="nav-item"><a class="nav-link text-danger" href="./logout.jsp">Logout</a></li>
                <% 
                } 
                %>
            </ul>
        </div>
    </div>
</nav>
<%-- menu.jsp는 상단 바를 만들기 위한것 --%>