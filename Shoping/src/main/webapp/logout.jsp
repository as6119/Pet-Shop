<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션을 무효화하여 로그아웃 처리
    session.invalidate();
    
    // 로그아웃 후 메인 페이지(welcome.jsp)로 이동
    // 메인 파일명이 다르면 (예: index.jsp) 이름을 수정하세요.
    response.sendRedirect("welcome.jsp");
%>