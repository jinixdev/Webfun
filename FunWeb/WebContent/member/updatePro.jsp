<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//request 한글 처리
request.setCharacterEncoding("utf-8");

MemberBean mb = new MemberBean();
mb.setId(request.getParameter("id"));
mb.setPass(request.getParameter("pass"));
mb.setName(request.getParameter("name"));
mb.setEmail(request.getParameter("email"));
mb.setAddress(request.getParameter("address"));
mb.setPostcode(request.getParameter("postcode"));
mb.setDetailAddress(request.getParameter("detailAddress"));
mb.setExtraAddress(request.getParameter("extraAddress"));

MemberDAO mDAO = new MemberDAO();
mDAO.updateMember(mb);

response.sendRedirect("../member/info.jsp");



%>
</body>
</html>