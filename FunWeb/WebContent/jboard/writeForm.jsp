<%@page import="jmember.JMemberBean"%>
<%@page import="jmember.JMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id"); 
%>
<form action="writePro.jsp" method="post">
<table border="1"><%
if(id==null){%>
<tr><td>글쓴이</td><td><input type="text" name="name"></td></tr>
<tr><td>비밀번호</td><td><input type="text" name="pass"></td></tr>
<%}else{ 
	JMemberDAO jmDAO = new JMemberDAO();
	JMemberBean jmb = jmDAO.getMember(id);
	System.out.println("jmb.getId() : " +jmb.getId());
%>
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=jmb.getName()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="text" name="pass" value="<%=jmb.getPass()%>"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
<tr><td><input type="submit" value="확인"></td></tr>
</table>

</form>
<%}%>
</body>
</html>