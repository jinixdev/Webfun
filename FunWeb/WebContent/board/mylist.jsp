<%@page import="jboard.JBoardBean"%>
<%@page import="java.util.List"%>
<%@page import="jboard.JBoardDAO"%>
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
request.setCharacterEncoding("UTF-8");
// String id = request.getParameter("name");
String name = (String)session.getAttribute("name");
System.out.print("mylist id : " +name);

JBoardDAO jbDAO= new JBoardDAO();

List boardlist = jbDAO.getboardList(name);
%>

<table border="1">
<tr><td>글번호</td><td>조회수</td><td>글쓴이</td><td>비밀번호</td><td>제목</td><td>내용</td><td>작성날짜</td></tr>
<%
for(int i =0;i<boardlist.size();i++){
	JBoardBean jbb = (JBoardBean)boardlist.get(i);%>
	<tr><td><%=jbb.getNum() %></td><td><%=jbb.getReadcount() %></td>
	<td><%=jbb.getName() %></td><td><%=jbb.getPass() %></td>
	<td><a href="content.jsp?num=<%=jbb.getNum()%>"><%= jbb.getSubject() %></a></td>
	<td><%=jbb.getContent() %></td><td><%=jbb.getDate() %></td>
	</tr>
<%} %>
<tr><td><input type="button" value="글작성" onclick="location.href='writeForm.jsp'"></td></tr>

</table>

</body>
</html>