<%@page import="java.sql.Timestamp"%>
<%@page import="comment.commentDAO"%>
<%@page import="comment.commentBean"%>
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

commentBean cb = new commentBean();


int p_num =Integer.parseInt(request.getParameter("p_num"));
String category =request.getParameter("category");
Timestamp date = new Timestamp(System.currentTimeMillis());

cb.setId(request.getParameter("id"));
cb.setContent(request.getParameter("content"));
cb.setCategory(category);
cb.setP_num(p_num);
cb.setReg_date(date);

commentDAO cDAO = new commentDAO();
cDAO.insertComment(cb,"board");
%>

<meta http-equiv="refresh" content="0;url=../<%=category%>/content.jsp?num=<%=p_num%>"></meta>

</body>
</html>