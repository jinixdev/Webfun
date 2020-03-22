<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="comment.commentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.commentDAO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
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

function commentUp(){
	var update=document.getElementById("updatetable");
	if(update.style.display=="none"){
		update.style.display="block";
	}else{
		update.style.display="none";
	}
}
function commentDelete(){
	
}

</script> 
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO jbDAO= new BoardDAO();
BoardBean jbb= jbDAO.getboardContent(num);
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
List comList= comDAO.getCommentList(num);

int commentnum;
int commentref;
String comment;%>
<table border="1">
<% for(int i=0;i<comList.size();i++){
	commentBean cb = (commentBean)comList.get(i);
	%>
<tr><td><%=cb.getId() %></td><td><%=cb.getContent() %></td>
<td><input type="button" value="수정" onclick="commentUp();"></td>
<td><a href="../comment/deletePro.jsp">x</a></td></tr>


<%
commentnum = cb.getNum();
commentref = cb.getRef();
comment = cb.getContent();

} %>
</table>



<!-- comment update code -->
<div id="updatetable" style="display:none;">
<form action="../comment/updateForm.jsp" method="post">
<table border="1">
<% for(int i=0;i<comList.size();i++){
	commentBean cb = (commentBean)comList.get(i);
	%>
<tr><td><%=cb.getId() %></td><td><input value="<%=cb.getContent() %>"></td>
<td><input type="submit" value="수정" ></td>
<td><input type="reset" value="취소" onclick="commentUp();"></td></tr>
<%} %>
</table>
</form>
</div>










</body>
</html>