<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<%
BoardDAO jbDAO= new BoardDAO();

List boardlist = jbDAO.getboardList();
%>

<table border="1">
<tr><td>글번호</td><td>조회수</td><td>글쓴이</td><td>비밀번호</td><td>제목</td><td>내용</td><td>작성날짜</td></tr>
<%
for(int i =0;i<boardlist.size();i++){
	BoardBean jbb = (BoardBean)boardlist.get(i);%>
	<tr><td><%=jbb.getNum() %></td><td><%=jbb.getReadcount() %></td>
	<td><%=jbb.getName() %></td><td><%=jbb.getPass() %></td>
	<td><a href="content.jsp?num=<%=jbb.getNum()%>"><%= jbb.getSubject() %></a></td>
	<td><%=jbb.getContent() %></td><td><%=jbb.getOnlydate() %></td>
	</tr>
<%} 
String id = (String)session.getAttribute("id"); 
if(id!=null){%>
<tr><td><input type="button" value="글작성" onclick="location.href='writeForm.jsp'"></td></tr>
<%} %>
</table>
</body>
</html>