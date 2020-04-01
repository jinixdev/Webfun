<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
BoardDAO jbDAO= new BoardDAO();
BoardBean jbb= jbDAO.getboardContent(num);
%>
<form action="updatePro.jsp" method="post">
<table>

<tr><td>글번호</td><td><input type="text" name="num" readonly="readonly" value="<%=jbb.getNum()%>"></td></tr>
<tr><td>작성일</td><td><%=jbb.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%= jbb.getName() %></td></tr>
<tr><td>조회수</td><td><%=jbb.getReadcount() %></td></tr>
<tr><td>제목</td><td colspan="3"><input type="text" name="subject" value="<%=jbb.getSubject() %>"></td></tr>
<tr><td>내용</td><td colspan="3"><input type="text" name="content" value="<%=jbb.getContent() %>"></td></tr>
<tr><td colspan="4"> <input type="submit" value="확인">
<input type="button" value="취소" onclick="location.href='../center/notice.jsp'"></td></tr>
	
</table>
</form>
</body>
</html>