// 자바스크립트 파일(.js)은 서버에서 실행되는 JSP와 달리 사용자의 브라우저(크롬, 엣지 등)에서 실행되는 로직을 담는 통

function CheckAddProduct() {
	// Html 요소 가져오기
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	//\n은 줄바꿈
	// 상품 코드 체크
	// 앞에 P가 붙은 이유는 정규 표현식(Regular Expression) 규칙에 따르면 첫 글자는 무조건 대문자 'P'로 시작해야만 하기 때문에
	if (!check(/^P[0-9]{4,11}$/, productId,
		"[ProductCoad]\n P 5~12 text please"))
		return false;
		
	// 상품명 체크
	if (name.value.length < 4 || name.value.length > 12){
		alert("[ProductName]\n least 4 max 12 please");
		name.select();
		name.focus();
		return false; // 전송 중단을 위해 추가
	}
	
	// 상품 가격 체크 숫자만 인식
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[Cost]\n Num only");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} 
	
	// 음수 예외 처리
	// 수정: vallue -> value로 오타 수정
	if (unitPrice.value < 0){
		alert("[Cost]\n cant write minus");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	// 소수점 둘째 자리까지만 허용
	else if (!check(/^\d+(?:[.]?[\d]{1,2})?$/, unitPrice, "[Cost]\n least 0.00"))
	    return false;
	
	// 재고수 체크
	if (isNaN(unitsInStock.value) || unitsInStock.value.length == 0){
		alert("[Stock]\n Check number");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	// 공통 정규식 검사 함수
	function check(regExp, e, msg){
		if (regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	// 모든 검사 통과시 전송
	// 수정: .submit -> .submit() 함수 호출로 수정
	document.newProduct.submit();
}