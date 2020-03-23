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
int num = Integer.parseInt(request.getParameter("num"));
int comment_ref = Integer.parseInt(request.getParameter("comment_ref"));
String comment = request.getParameter("comment");

System.out.println(num);
System.out.println(comment_ref);
System.out.println(comment);




commentBean cb = new commentBean();
cb.setNum(num);
cb.setRef(comment_ref);
cb.setContent(comment);
commentDAO cDAO = new commentDAO();
cDAO.commentUpdate(cb);

%>

<meta http-equiv="refresh" content="0;url=../board/content.jsp?num=<%=num%>"></meta>
</body>
</html>