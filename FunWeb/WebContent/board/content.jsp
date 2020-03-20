<%@page import="comment.commentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.commentDAO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="jboard.JBoardBean"%>
<%@page import="jboard.JBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<script type="text/javascript">
function showhide(){
	var obj=document.getElementById("showtable");
	if(obj.style.display=="none"){
		obj.style.display="block";
	}else{
		obj.style.display="none";
	}
}
</script> 
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
JBoardDAO jbDAO= new JBoardDAO();
JBoardBean jbb= jbDAO.getboardContent(num);
/* int num2 = jbb.getNum(); */
%>

<table border="1">
<tr><td>글번호</td><td><%= jbb.getNum() %></td></tr>
<tr><td>작성일</td><td><%=jbb.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%= jbb.getName() %></td></tr>
<tr><td>조회수</td><td><%=jbb.getReadcount() %></td></tr>
<tr><td>제목</td><td colspan="3"><%=jbb.getSubject() %></td></tr>
<tr><td>내용</td><td colspan="3"><%=jbb.getContent() %></td></tr>
<tr><td colspan="4"> <input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=jbb.getNum()%>'">
<input type="button" value="글삭제" onclick="showhide();">

<input type="button" value="글목록" onclick="location.href='list.jsp'"></td></tr>
</table>

<!-- delete code -->
<div id="showtable" style="display:none;">
<form action="deletePro.jsp" method="post">
<table>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td>
<% session.setAttribute("num", jbb.getNum());%>
<td><button type="submit" value="확인">확인</button></td></tr>
</table>
</form>
</div>

<hr>
<!-- comment code -->

<form action="contentPro.jsp">
<input type="hidden" name="id" value="<%=jbb.getName()%>">
<textarea name="content" cols="50" rows="2"></textarea>
<input type="hidden" name="ref" value="<%=num%>">
<input type="submit">
</form>

<%
commentDAO comDAO = new commentDAO();
List comList= comDAO.getCommentList(num);%>
<table border="1">
<% for(int i=0;i<comList.size();i++){
	commentBean cb = (commentBean)comList.get(i);
	%>
<tr><td><%=cb.getId() %></td><td><%=cb.getContent() %></td></tr>
<%} %>
</table>








</body>
</html>