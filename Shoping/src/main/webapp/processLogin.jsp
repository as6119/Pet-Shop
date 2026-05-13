<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.MemberRepository" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    MemberRepository dao = MemberRepository.getInstance();
    ArrayList<Member> members = dao.getAllMembers();
    
    boolean isMember = false;

    for (int i = 0; i < members.size(); i++) {
        Member m = members.get(i);
        // ID와 비밀번호 대조
        if (m.getId().equals(id) && m.getPassword().equals(password)) {
            isMember = true;
            break;
        }
    }

    if (isMember) {
        session.setAttribute("sessionId", id); 
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("login.jsp?error=1");
    }
%>