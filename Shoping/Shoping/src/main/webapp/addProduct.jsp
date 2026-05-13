<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션 체크
    String sessionId = (String) session.getAttribute("sessionId");
    if (sessionId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="./resources/js/validation.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <title>Product Upload</title>

    <style>
        body { font-family: 'Noto Sans KR', sans-serif; background-color: #fdfdfd; }
        
        .upload-header {
            background: linear-gradient(to bottom, #FFF8E1, #ffffff);
            padding: 60px 0;
            border-bottom: 1px solid #FFECB3;
            margin-bottom: 40px;
            text-align: center;
        }
        .header-title {
            font-family: 'Fredoka One', cursive;
            color: #FF6F00;
            font-size: 3.2rem;
        }

        .form-container {
            background: #ffffff;
            padding: 50px;
            border-radius: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.03);
            border: 1px solid #f1f1f1;
            margin-bottom: 100px;
        }
        
        .form-group {
            margin-bottom: 25px;
            padding-bottom: 15px;
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

        .form-control {
            border-radius: 12px;
            border: 1.5px solid #eee;
            transition: all 0.3s;
        }
        .form-control:focus {
            border-color: #FFB300;
            box-shadow: 0 0 0 0.2rem rgba(255, 179, 0, 0.15);
        }

        .btn-submit {
            background: linear-gradient(45deg, #FFB300, #FF6F00);
            color: #fff;
            border: none;
            border-radius: 50px;
            padding: 15px 60px;
            font-weight: 700;
            font-size: 1.2rem;
            box-shadow: 0 5px 20px rgba(255, 111, 0, 0.3);
            cursor: pointer;
        }
        .btn-submit:hover {
            transform: translateY(-3px);
            color: #fff;
        }
    </style>
</head>

<body>
<jsp:include page="menu.jsp"/>

<div class="upload-header">
    <div class="container">
        <h1 class="header-title">Product Upload</h1>
        <p class="text-muted" style="letter-spacing: 2px;">ADD NEW ITEM TO SHOP</p>
    </div>
</div>

<div class="container">
    <div class="form-container">
        <form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">

            <!-- 1. 기본 식별 정보 -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-barcode"></i> Product Code</label>
                <div class="col-sm-4">
                    <input type="text" id="productId" name="productId" class="form-control" placeholder="P1234">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-tag"></i> Product Name</label>
                <div class="col-sm-7">
                    <input type="text" id="name" name="name" class="form-control" placeholder="Name of product">
                </div>
            </div>

            <!-- 2. 상세 설명 (텍스트 영역이므로 중간에 배치) -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-align-left"></i> Description</label>
                <div class="col-sm-8">
                    <textarea name="description" rows="4" class="form-control" placeholder="Product details..."></textarea>
                </div>
            </div>

            <hr class="my-4" style="border-top: 1px dashed #eee;">

            <!-- 3. 분류 및 가격 정보 -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-dollar-sign"></i> Unit Price</label>
                <div class="col-sm-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white" style="border-radius: 12px 0 0 12px;">$</span>
                        </div>
                        <input type="text" id="unitPrice" name="unitPrice" class="form-control" style="border-radius: 0 12px 12px 0;">
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-industry"></i> Manufacturer</label>
                <div class="col-sm-5">
                    <input type="text" name="manufacturer" class="form-control" placeholder="e.g. HappyDoggy">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-th-large"></i> Category</label>
                <div class="col-sm-4">
                    <input type="text" name="category" class="form-control" placeholder="e.g. Snack, Toy">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-layer-group"></i> Units in Stock</label>
                <div class="col-sm-3">
                    <input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
                </div>
            </div>

            <!-- 4. 타겟 및 이미지 -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-paw"></i> Target Pet</label>
                <div class="col-sm-7 pt-2">
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="dog" name="petType" value="Dog" class="custom-control-input" checked>
                        <label class="custom-control-label" for="dog">For Dogs</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="cat" name="petType" value="Cat" class="custom-control-input">
                        <label class="custom-control-label" for="cat">For Cats</label>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label"><i class="fas fa-image"></i> Product Image</label>
                <div class="col-sm-7">
                    <div class="custom-file">
                        <input type="file" name="productImage" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
            </div>

            <!-- 전송 버튼 -->
            <div class="row mt-5">
                <div class="col-sm-12 text-center">
                    <button type="button" class="btn btn-submit shadow" onclick="CheckAddProduct()">
                        <i class="fas fa-check-circle mr-2"></i> REGISTER PRODUCT
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
    // 파일명 표시 스크립트
    document.querySelector('.custom-file-input').addEventListener('change',function(e){
        var fileName = document.getElementById("customFile").files[0].name;
        var nextSibling = e.target.nextElementSibling;
        nextSibling.innerText = fileName;
    })
</script>

</body>
</html>