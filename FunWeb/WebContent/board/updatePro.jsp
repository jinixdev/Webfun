<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));

BoardBean jbb = new BoardBean();
jbb.setNum(num);
jbb.setSubject(request.getParameter("subject"));
jbb.setContent(request.getParameter("content"));
jbb.setCategory(request.getParameter("category"));
BoardDAO jbDAO = new BoardDAO();
jbDAO.updateBoard(num, jbb); 

response.sendRedirect("../center/notice.jsp");

%>
</body>
</html>