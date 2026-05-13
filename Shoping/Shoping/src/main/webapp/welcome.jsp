<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%-- 영문 출력을 위해 가독성 좋은 Fredoka One과 Noto Sans 폰트 사용 --%>
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<title>Your Pet Food</title>

<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #ffffff; }
    
    /* 따뜻한 환영 구역 디자인 */
    .welcome-section {
        background-color: #FFF8E1; /* 부드러운 아이보리 톤 */
        padding: 70px 0;
        border-bottom: 2px solid #FFECB3;
        margin-bottom: 40px;
    }
    
    .welcome-title {
        font-family: 'Fredoka One', cursive;
        font-size: 4.5rem;
        color: #FF6F00; /* 망고/오렌지 포인트 컬러 */
        margin-bottom: 15px;
    }
    
    .tagline-text {
        font-size: 1.3rem;
        color: #5D4037; /* 신뢰감 있는 브라운 */
        font-weight: 400;
        letter-spacing: 1.5px;
    }

    .time-container {
        margin-top: 25px;
        font-size: 0.95rem;
        color: #888;
    }

    .feature-card {
        padding: 20px;
        transition: 0.3s;
    }
    .feature-card i {
        color: #FFB300;
        font-size: 2.2rem;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
<%-- 직접 작성한 navbar 대신 공통 메뉴 모듈을 가져옵니다 --%>
<jsp:include page="menu.jsp" />
	
	<%! String greeting = "Welcome!";
		String tagline = "Choose your pet food";
	%>
	
    <%-- 상단 웰컴 배너 영역 --%>
    <div class="welcome-section text-center">
        <div class="container">
            <h1 class="welcome-title"><%= greeting %></h1>
            <p class="tagline-text text-uppercase"><%= tagline %></p>
        </div>
    </div>
	
	<main role="main">
	<div class="container">
		<div class="text-center">
			<%-- 시간 출력 --%>				
            <%
                Date day = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss a");
                String CT = sdf.format(day);
            %>
            <div class="time-container">
                <i class="far fa-clock"></i> Now time: <span class="text-dark font-weight-bold"><%= CT %></span>
            </div>
		</div>
        
        <hr class="my-5">
>
	</main>
    
	<jsp:include page="footer.jsp" />
</body>
</html>