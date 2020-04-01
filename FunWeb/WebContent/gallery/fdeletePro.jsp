<%@page import="gallery.galleryDAO"%>
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
System.out.print("num"+num);
System.out.print("pass"+pass);

galleryDAO gDAO = new galleryDAO();
int check = gDAO.passCheck(num, pass);
if(check ==1){
	gDAO.deleteBoard(num);%>
	<script type="text/javascript">
	alert("작성하신 글이 삭제되었습니다.");
	location.href="../center/gallery.jsp";
	</script>
	
<%}else{%>
	<script type="text/javascript">
	alert("비밀번호를 다시 입력해주십시오.");
	</script>
	<%} %>
</body>
</html>