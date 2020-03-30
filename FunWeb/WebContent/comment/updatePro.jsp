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
int p_num = Integer.parseInt(request.getParameter("p_num"));
int r_num = Integer.parseInt(request.getParameter("r_num"));
String comment = request.getParameter("comment");

System.out.println(p_num);
System.out.println(r_num);
System.out.println(comment);




commentBean cb = new commentBean();
cb.setP_num(p_num);
cb.setR_num(r_num);
cb.setContent(comment);
commentDAO cDAO = new commentDAO();
cDAO.commentUpdate(cb);

%>

<meta http-equiv="refresh" content="0;url=../board/content.jsp?num=<%=p_num%>"></meta>
</body>
</html>