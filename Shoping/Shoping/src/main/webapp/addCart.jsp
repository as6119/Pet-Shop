<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
    // 1. 전달받은 상품 ID 확인
    // 콘솔에서 ID: null이 뜬다면 호출하는 쪽(product)의 파라미터 전달을 확인해야 합니다.
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("products.jsp");
        return;
    }

    // 2. 저장소에서 상품 정보 가져오기 (싱글톤 사용)
    ProductRepository dao = ProductRepository.getInstance();
    Product product = dao.getProductById(id);

    if (product == null) {
        response.sendRedirect("products.jsp");
        return;
    }

    // 3. 세션에서 장바구니 목록 가져오기
    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Product>();
        session.setAttribute("cartlist", list);
    }

    // 4. 이미 장바구니에 있는지 확인
    int cnt = 0;
    for (int i = 0; i < list.size(); i++) {
        Product goodsQnt = list.get(i); 
        // 리스트 내 상품 ID와 전달받은 ID를 비교
        if (goodsQnt.getProductId().equals(id)) {
            cnt++;
            // 기존 상품이 있으면 수량만 1 증가
            int orderQuantity = goodsQnt.getQuantity() + 1;
            goodsQnt.setQuantity(orderQuantity);
        }
    }

 // 5. 장바구니에 없던 상품이면 '새 객체'를 만들어 정보를 복사 후 추가
    if (cnt == 0) {
        Product newProduct = new Product();
        newProduct.setProductId(product.getProductId());
        newProduct.setPname(product.getPname());
        newProduct.setUnitPrice(product.getUnitPrice());
        newProduct.setFilename(product.getFilename());
        newProduct.setQuantity(1);
        
        list.add(newProduct);
    }

    // 6. 끝난 후, 상세 페이지가 아닌 '장바구니 목록 페이지'로 바로 이동
    response.sendRedirect("cart.jsp");
%>