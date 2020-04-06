<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
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
<h1>download Write</h1>
<%
String id = (String)session.getAttribute("id"); 
String category = "download";
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
	boolean idcheck = id!=null;
// 	id가 있으면 true , 없으면 false
%>
<form action="writePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="<%=jmb.getId()%> ">
<table id="content">
<tr><th>글쓴이</th><td><input type="text" name="name" value="<%=jmb.getName()%>"></td></tr>
<tr><th>비밀번호</th><td><input type="text" name="pass"></td></tr>
<tr><th>제목</th><td><input type="text" name="subject"></td></tr>
<tr><th>내용</th><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
<tr><td colspan="2"><input type="file" name="file" id="file"></td></tr>
<tr><td><input type="submit" class="btn" value="Upload"></td>
<td><input type="button" value="취소" class="btn" onclick="history.back()"></td></tr>

</table>
<input type="hidden" name="category" value="download">
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