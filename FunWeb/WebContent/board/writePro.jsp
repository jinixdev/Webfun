<%@page import="java.sql.Timestamp"%>
<%@page import="jboard.JBoardDAO"%>
<%@page import="jboard.JBoardBean"%>
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

JBoardBean jbb = new JBoardBean();
System.out.print("writepro : "+request.getParameter("content"));
jbb.setName(request.getParameter("name"));
jbb.setPass(request.getParameter("pass"));
jbb.setSubject(request.getParameter("subject"));
jbb.setContent(request.getParameter("content"));

Timestamp date = new Timestamp(System.currentTimeMillis());
jbb.setDate(date);

JBoardDAO jbDAO = new JBoardDAO();

jbDAO.write(jbb);

response.sendRedirect("list.jsp");


%>
</body>
</html>