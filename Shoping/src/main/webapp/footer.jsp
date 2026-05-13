<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* footer 전용 스타일 */
    .custom-footer {
        background-color: #5D4037; /* menu.jsp의 deep-brown과 통일 */
        color: #FFF8E1;           /* 부드러운 아이보리색 글씨 */
        padding: 40px 0 20px 0;
        margin-top: 60px;
        border-top: 5px solid #FFB300; /* 상단바와 맞춘 망고색 포인트 선 */
    }

    .footer-content {
        text-align: center;
    }

    .footer-logo {
        font-family: 'Gaegu', cursive;
        font-size: 1.5rem;
        color: #FFB300;
        margin-bottom: 10px;
    }

    .footer-info {
        font-size: 0.9rem;
        opacity: 0.8;
        line-height: 1.6;
    }

    .footer-bottom-text {
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid rgba(255, 248, 225, 0.1);
        font-size: 0.8rem;
    }

    /* 귀여운 발바닥 아이콘 포인트 */
    .footer-icon {
        margin: 0 5px;
        color: #FFB300;
    }
</style>

<footer class="custom-footer">
    <div class="container">
        <div class="footer-content">
            <!-- 펫샵 로고 느낌 재현 -->
            <div class="footer-logo">
                <i class="fas fa-paw"></i> Pet Shop Mall
            </div>
            
            <div class="footer-info">
            
            </div>

            <div class="footer-bottom-text">
                <%-- 기존 문구와 주석 유지 --%>
                &copy; 2026 <b>Pet Shop</b> - for ours children All rights reserved.
            </div>
        </div>
    </div>
</footer>
<%-- footer.jsp는 하단 글 --%>