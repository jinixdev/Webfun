<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
<%if(id==null){%> 
 <script type="text/javascript"> 
 alert("글쓰기와 댓글기능은 회원만 이용가능합니다.");
 location.href="../member/login.jsp";
 </script> 
 <%} %> 

<%	MemberDAO jmDAO = new MemberDAO();
	MemberBean jmb = jmDAO.getMember(id);
	System.out.println("jmb.getId() : " +jmb.getId());
	// 첨부파일 파일 업로드
	// 1. 서버안에 폴더 만들어서 파일을 넣고 // 파일이름 디비에 저장
	// 2. 파일을 DB에 저장
	// 
%>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=jmb.getName()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="text" name="pass" value="<%=jmb.getPass()%>"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td><input type="submit" value="확인"></td></tr>
<tr><td><input type="hidden" name="id" value="<%=jmb.getId()%>"></td></tr>
</table>

</form>
<%-- <%}%> --%>
</body>
</html>