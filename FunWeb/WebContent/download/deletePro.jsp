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
int num = (Integer)session.getAttribute("num");
// int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");
String p_num = request.getParameter("p_num");
String category = request.getParameter("category");

BoardDAO jbDAO = new BoardDAO();
int check = jbDAO.passCheck(num, pass);
if(check ==1){
	jbDAO.deleteBoard(num,p_num,category);%>
	<script type="text/javascript">
	alert("작성하신 글이 삭제되었습니다.");
	location.href="../center/download.jsp";
	</script>
	
<%}else{%>
	<script type="text/javascript">
	alert("비밀번호를 다시 입력해주십시오.");
	history.back();
	</script>
	<%} %>
</body>
</html>