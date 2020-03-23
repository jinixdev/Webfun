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
System.out.println(Integer.parseInt(request.getParameter("ref")));

cb.setId(request.getParameter("id"));
cb.setContent(request.getParameter("content"));
int ref =Integer.parseInt(request.getParameter("ref"));
cb.setRef(ref);

commentDAO cDAO = new commentDAO();
cDAO.insertComment(cb);
%>

<meta http-equiv="refresh" content="0;url=content.jsp?num=<%=ref%>"></meta>

</body>
</html>