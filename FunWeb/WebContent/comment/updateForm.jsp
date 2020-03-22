<%@page import="comment.commentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.commentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = (Integer)session.getAttribute("contentnum");
commentDAO comDAO = new commentDAO();
List comList= comDAO.getCommentList(num);%>

<table border="1">
<% for(int i=0;i<comList.size();i++){
	commentBean cb = (commentBean)comList.get(i);
	%>
<form action="updatePro.jsp" method="post">
<tr><td><%=cb.getId() %></td><td><input type="text" value="<%=cb.getContent() %>"></td>
<td><input type="submit" value="확인"></td><td><input type="reset" value="취소"></td></tr>
</form>
<%} %>

</table>
