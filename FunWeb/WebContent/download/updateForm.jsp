<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_notice"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/notice_sub_menu.jsp"></jsp:include>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>


<%
String category ="download";
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO jbDAO= new BoardDAO();
BoardBean jbb= jbDAO.getboardContent(num,category);
%>
<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
<table id="content">

<tr><th>작성일</th><td><%=jbb.getDate() %></td></tr>
<tr><th>글쓴이</th><td><%= jbb.getName() %></td></tr>
<tr><th>조회수</th><td><%=jbb.getReadcount() %></td></tr>
<tr><th>제목</th><td colspan="3"><input type="text" name="subject" value="<%=jbb.getSubject() %>"></td></tr>
<tr><th>내용</th><td colspan="3"><textarea name="content" rows="10" cols="50"><%=jbb.getContent() %></textarea></td></tr>
<tr><td>파일</td><td><img src="../upload/<%=jbb.getFile()%>" width="100" height="100"></td></tr>
<tr><td colspan="2"><input type="file" name="file" id="file"></td></tr>
<tr><td colspan="4"> <input type="submit" class="btn" value="확인">
<input type="button" class="btn"value="취소" onclick="location.href='../center/download.jsp'"></td></tr>
	
</table>
<input type="hidden" name="category" value="download">
<input type="hidden" name="id" value="<%=jbb.getId()%>">
<input type="hidden" name="num" value="<%=jbb.getNum()%>">
</form>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->
</div>
</body>
</html>