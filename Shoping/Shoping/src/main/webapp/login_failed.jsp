<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 로그인 실패 시 에러 파라미터를 붙여서 다시 로그인 페이지로 리다이렉트
    response.sendRedirect("login.jsp?error=1");
%>