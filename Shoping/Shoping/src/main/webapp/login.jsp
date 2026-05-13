<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 브라우저 캐시 방지
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <%-- 디자인 통일감을 위한 폰트 및 아이콘 설정 --%>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <title>Login</title>

    <style>
        body { font-family: 'Noto Sans KR', sans-serif; background-color: #fdfdfd; height: 100vh; }
        
        /* 상단 헤더 디자인 */
        .login-header {
            background: linear-gradient(to bottom, #FFF8E1, #ffffff);
            padding: 50px 0;
            border-bottom: 1px solid #FFECB3;
            margin-bottom: 40px;
            text-align: center;
        }
        .header-title {
            font-family: 'Fredoka One', cursive;
            color: #FF6F00;
            font-size: 2.8rem;
        }

        /* 로그인 카드 컨테이너 */
        .login-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.05);
            border: 1px solid #f1f1f1;
            max-width: 400px;
            margin: 0 auto 100px auto;
        }

        .form-signin-heading {
            font-weight: 700;
            color: #5D4037;
            margin-bottom: 30px;
            text-align: center;
        }

        /* 입력창 디자인 */
        .form-control {
            border-radius: 12px;
            border: 1.5px solid #eee;
            padding: 25px 15px;
            transition: all 0.3s;
            margin-bottom: 15px;
        }
        .form-control:focus {
            border-color: #FFB300;
            box-shadow: 0 0 0 0.2rem rgba(255, 179, 0, 0.15);
            background-color: #fffaf0;
        }

        /* 로그인 버튼 */
        .btn-login {
            background: linear-gradient(45deg, #FFB300, #FF6F00);
            color: #fff;
            border: none;
            border-radius: 50px;
            padding: 12px;
            font-weight: 700;
            font-size: 1.1rem;
            box-shadow: 0 5px 20px rgba(255, 111, 0, 0.2);
            transition: 0.3s;
            width: 100%;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 111, 0, 0.3);
            color: #fff;
        }

        /* 에러 메시지 */
        .alert-login-error {
            background-color: #FFEBEE;
            color: #EF5350;
            border-radius: 12px;
            padding: 10px;
            font-size: 0.9rem;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid #FFCDD2;
        }
    </style>
</head>
<body>
<jsp:include page="menu.jsp"/>

<div class="login-header">
    <div class="container">
        <h1 class="header-title">Welcome Back!</h1>
        <p class="text-muted text-uppercase" style="letter-spacing: 2px;">Sign in to your account</p>
    </div>
</div>

<div class="container">
    <div class="login-container">
        <h3 class="form-signin-heading">Login</h3>
        
        <%-- 로그인 실패 시 에러 출력 --%>
        <% 
            String error = request.getParameter("error");
            if(error != null){
        %>
            <div class="alert-login-error">
                <i class="fas fa-exclamation-circle mr-1"></i> Invalid ID or Password.
            </div>
        <%
            }
        %>
        
        <form class="form-signin" action="./processLogin.jsp" method="post">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-right-0" style="border-radius: 12px 0 0 12px; border: 1.5px solid #eee;">
                            <i class="fas fa-user text-warning"></i>
                        </span>
                    </div>
                    <input type="text" class="form-control border-left-0" style="border-radius: 0 12px 12px 0;" placeholder="ID" name="id" required autofocus>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-right-0" style="border-radius: 12px 0 0 12px; border: 1.5px solid #eee;">
                            <i class="fas fa-lock text-warning"></i>
                        </span>
                    </div>
                    <input type="password" class="form-control border-left-0" style="border-radius: 0 12px 12px 0;" placeholder="Password" name="password" required>
                </div>
            </div>

            <button class="btn btn-login shadow-sm mt-3" type="submit">
                Login <i class="fas fa-sign-in-alt ml-2"></i>
            </button>
        </form>
        
        <div class="text-center mt-4">
            <small class="text-muted">Don't have an account? <a href="./addMember.jsp" style="color: #FF6F00; font-weight: 700;">Join now</a></small>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>