<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writePro</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
/* String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content"); */

BoardBean jbb = new BoardBean();
System.out.print("writepro : "+request.getParameter("content"));
jbb.setId(request.getParameter("id"));
jbb.setName(request.getParameter("name"));
jbb.setPass(request.getParameter("pass"));
jbb.setSubject(request.getParameter("subject"));
jbb.setContent(request.getParameter("content"));
jbb.setCategory(request.getParameter("category"));
Timestamp date = new Timestamp(System.currentTimeMillis());
jbb.setDate(date);

BoardDAO jbDAO = new BoardDAO();

jbDAO.write(jbb);

response.sendRedirect("../center/notice.jsp");


%>
</body>
</html>