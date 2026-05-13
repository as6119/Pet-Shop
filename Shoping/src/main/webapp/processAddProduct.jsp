<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 저장 경로 설정
    String realFolder = request.getServletContext().getRealPath("/resources/images");
    File saveDir = new File(realFolder);
    if (!saveDir.exists()) saveDir.mkdirs();

    // multipart/form-data에서는 getParameter가 안 먹힐 수 있으므로 Part로 받기
    // helper 함수를 쓰거나 직접 Part에서 값을 추출해야 한다.
    
    // getValue 메소드 호출 시 발생할 수 있는 NPE를 방지하기 위해 널 체크가 포함된 로직 유지
    String productId = getValue(request.getPart("productId"));
    String name = getValue(request.getPart("name"));
    String unitPrice = getValue(request.getPart("unitPrice"));
    String description = getValue(request.getPart("description"));
    String petType = getValue(request.getPart("petType"));
 // 데이터 (제조사, 카테고리, 재고) 받기
    String manufacturer = getValue(request.getPart("manufacturer"));
    String category = getValue(request.getPart("category"));
    String unitsInStock = getValue(request.getPart("unitsInStock"));

    // 이미지 파일 처리
    Part part = request.getPart("productImage");
    String fileName = "";
    
    if (part != null && part.getSize() > 0) {
        fileName = getFileName(part); // 아래 정의한 메소드 사용
        if (!fileName.isEmpty()) {
            // [수정] 파일명이 전체 경로로 들어오는 일부 브라우저 문제를 위해 파일명만 추출
            File file = new File(fileName);
            part.write(realFolder + File.separator + file.getName());
            fileName = file.getName(); // 실제 저장된 이름으로 갱신
        }
    }

    // 데이터 변환 및 저장
    // unitPrice가 null일 경우를 대비해 trim() 추가하여 더 안전하게 검사
    Integer price = (unitPrice == null || unitPrice.trim().isEmpty()) ? 0 : Integer.valueOf(unitPrice.trim());
    long stock = (unitsInStock == null || unitsInStock.trim().isEmpty()) ? 0 : Long.parseLong(unitsInStock.trim());
    
    
    ProductRepository dao = ProductRepository.getInstance();
    Product newProduct = new Product();
    
    
    newProduct.setProductId(productId);
    newProduct.setPname(name);
    newProduct.setUnitPrice(price);
    newProduct.setDescription(description);
    newProduct.setPetType(petType);
    newProduct.setFilename(fileName);
    newProduct.setManufacturer(manufacturer); // 제조사 저장
    newProduct.setCategory(category);         // 카테고리 저장
    newProduct.setUnitsInStock(stock);        // 재고 저장

    dao.addProduct(newProduct);
    response.sendRedirect("products.jsp");
%>

<%! 
    // Part에서 텍스트 값을 뽑아오는 헬퍼 메소드
    private String getValue(Part part) throws IOException {
        if (part == null) return null;
        // 스트림을 읽을 때 한글 깨짐 방지를 위해 UTF-8 명시 및 줄바꿈 처리 개선
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"))) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
        }
        return sb.toString();
    }

    // 파일명을 뽑아오는 헬퍼 메소드
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String name = s.substring(s.indexOf("=") + 2, s.length() - 1);
                return name.replace("\\", "/"); 
            }
        }
        return "";
    }
%>