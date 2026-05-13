<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%-- 디자인 통일감을 위한 폰트 및 아이콘 설정 --%>
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<title>Create Account</title>

<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #fdfdfd; }
    
    /* 상단 헤더 디자인 */
    .register-header {
        background: linear-gradient(to bottom, #FFF8E1, #ffffff);
        padding: 60px 0;
        border-bottom: 1px solid #FFECB3;
        margin-bottom: 40px;
        text-align: center;
    }
    .header-title {
        font-family: 'Fredoka One', cursive;
        color: #FF6F00;
        font-size: 3rem;
    }

    /* 회원가입 카드 스타일 */
    .register-container {
        background: #ffffff;
        padding: 50px;
        border-radius: 30px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.03);
        border: 1px solid #f1f1f1;
        margin-bottom: 100px;
        max-width: 700px; /* 폼 너비 제한으로 집중도 향상 */
        margin-left: auto;
        margin-right: auto;
    }
    
    .form-group {
        margin-bottom: 25px;
    }

    .col-form-label {
        font-weight: 700;
        color: #5D4037;
        display: flex;
        align-items: center;
    }
    .col-form-label i {
        margin-right: 10px;
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

    /* 버튼 디자인 */
    .btn-submit {
        background: linear-gradient(45deg, #FFB300, #FF6F00);
        color: #fff;
        border: none;
        border-radius: 50px;
        padding: 15px 40px;
        font-weight: 700;
        font-size: 1.1rem;
        box-shadow: 0 5px 20px rgba(255, 111, 0, 0.2);
        transition: 0.3s;
        cursor: pointer;
    }
    .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(255, 111, 0, 0.3);
        color: #fff;
    }

    .btn-cancel {
        background-color: #EFEBE9;
        color: #8D6E63;
        border: none;
        border-radius: 50px;
        padding: 15px 40px;
        font-weight: 700;
        transition: 0.3s;
    }
    .btn-cancel:hover { background-color: #D7CCC8; }
</style>
</head>

<body>
<jsp:include page="menu.jsp"/>

<div class="register-header">
    <div class="container">
        <h1 class="header-title">Join Us!</h1>
        <p class="text-muted text-uppercase" style="letter-spacing: 2px;">Become a member of our pet family</p>
    </div>
</div>
    
<div class="container">
    <div class="register-container">
        <form name="newMember" action="./processAddMember.jsp" method="post">
        
            <%-- ID --%>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label"><i class="fas fa-user-circle"></i> ID</label>
                <div class="col-sm-8">
                    <input type="text" name="id" class="form-control" placeholder="Choose your ID" required>
                </div>
            </div>
            
            <%-- Password --%>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label"><i class="fas fa-lock"></i> Password</label>
                <div class="col-sm-8">
                    <input type="password" name="password" class="form-control" placeholder="At least 4 characters" required>
                </div>
            </div>
            
            <%-- Name --%>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label"><i class="fas fa-signature"></i> Name</label>
                <div class="col-sm-8">
                    <input type="text" name="name" class="form-control" placeholder="Your full name" required>
                </div>
            </div>
            
            <%-- Email --%>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label"><i class="fas fa-envelope"></i> Email</label>
                <div class="col-sm-8">
                    <input type="email" name="mail" class="form-control" placeholder="example@mail.com" required>
                </div>
            </div>
            
            <%-- Phone --%>
            <div class="form-group row mb-5">
                <label class="col-sm-4 col-form-label"><i class="fas fa-phone-alt"></i> Phone Number</label>
                <div class="col-sm-8">
                    <input type="text" name="phone" class="form-control" placeholder="010-0000-0000" required>
                </div>
            </div>
            
            <%-- 버튼 영역 --%>
            <div class="form-group row">
                <div class="col-sm-12 text-center">
                    <button type="submit" class="btn btn-submit mr-2">
                        <i class="fas fa-user-plus mr-2"></i> Create Account
                    </button>
                    <button type="reset" class="btn btn-cancel">
                        Cancel
                    </button>
                </div>
            </div>
            
        </form>
    </div>
</div>
    
<jsp:include page="footer.jsp" />

</body>
</html>