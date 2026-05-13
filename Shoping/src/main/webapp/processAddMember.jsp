<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.MemberRepository" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-In</title>
</head>
<body>

<%

// 한글 깨짐 방지
request.setCharacterEncoding("UTF-8");

// 회원가입 addMember.jsp의 input 태그 name 속성값으로 데이터를 가져온다.
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String mail = request.getParameter("mail");
String phone = request.getParameter("phone");

// Member. 객체 담기
Member newMember = new Member();
newMember.setId(id);
newMember.setPassword(password);
newMember.setName(name);
newMember.setMail(mail);
newMember.setPhone(phone);

// 회원 정보 저장소 MemberRepository(DAO)에 저장
// MemberRepositoryt.java파일이 dao패키지에 있어야 에러가 나지 않는다.
MemberRepository dao = MemberRepository.getInstance();
dao.addMember(newMember);



// 처리가 끝나면 메인 페이지로 이동
response.sendRedirect("welcome.jsp?name=" + java.net.URLEncoder.encode(name, "UTF-8"));
%>

</body>
</html>