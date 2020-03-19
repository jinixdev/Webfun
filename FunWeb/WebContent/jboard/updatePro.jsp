<%@page import="jboard.JBoardDAO"%>
<%@page import="jboard.JBoardBean"%>
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
int num = Integer.parseInt(request.getParameter("num"));
System.out.print("updatepro2 : "+request.getParameter("num"));

JBoardBean jbb = new JBoardBean();
jbb.setSubject(request.getParameter("subject"));
jbb.setContent(request.getParameter("content"));
JBoardDAO jbDAO = new JBoardDAO();
jbDAO.updateBoard(num, jbb); 

response.sendRedirect("list.jsp");

%>
</body>
</html>