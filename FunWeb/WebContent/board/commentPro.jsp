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

cb.setId(request.getParameter("id"));
cb.setContent(request.getParameter("content"));
int p_num =Integer.parseInt(request.getParameter("p_num"));
cb.setP_num(p_num);
Timestamp date = new Timestamp(System.currentTimeMillis());
cb.setReg_date(date);

commentDAO cDAO = new commentDAO();
cDAO.insertComment(cb);
%>

<meta http-equiv="refresh" content="0;url=content.jsp?num=<%=p_num%>"></meta>

</body>
</html>