<%@page import="gallery.galleryBean"%>
<%@page import="gallery.galleryDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<!-- 메인이미지 들어가는곳 -->
<div class="mainwrap">
<div class="maincontainer">
<div class="main_content">

<img src="../upload/food_(16).jpg" width="250" height="200">

</div>
<div class="main_content">

<img src="../upload/food_(15).jpg" width="250" height="200">
</div>
<div class="main_content">

<img src="../upload/food_(12).jpg" width="250" height="200">
</div>
<div class="main_content">

<img src="../upload/food_(13).jpg" width="250" height="200">
</div>
<div class="main_content">

<img src="../upload/food_(20).jpg" width="250" height="200">
</div>
<div class="main_content">

<img src="../upload/food_(22).jpg" width="250" height="200">
</div>

</div>

</div>





<div id="news_notice">
<h3><span class="brown">최신</span> 맛집</h3>
<table>
<%

galleryDAO gDAO = new galleryDAO();
// int count = getBoardCount()호출
int count = gDAO.getBoardCount();
// 한 화면에 보여줄 가져올 글 갯수 생성
int pageSize =5;
// 현 페이지 번호가 없으면 "1"페이지로 설번
String pageNum = request.getParameter("pageNum");
// 현 페이지 번호가 없으면 "1"페이지로 설정
if(pageNum==null){ // 현페이지 번호가 없으면
	pageNum="1"; // 10개씩 잘라서 1페이지 시작하는지 확인
} 
// pageNum => 정수형으로 변경
int currentPage =Integer.parseInt(pageNum);
// 10개씩 잘라서 1페이지 시작하는 행 번호 구하기
 int startRow= (currentPage-1)*pageSize+1;
// List boardlist = jbDAO.getboardList(startRow,pageSize); 호출
List boardlist = gDAO.getboardList(startRow,pageSize); 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
for (int i = 0; i < boardlist.size(); i++) {
	galleryBean gb = (galleryBean) boardlist.get(i);
%>
<tr><td class="contxt">
<a href="../gallery/content.jsp?num=<%=gb.getNum() %>"><%=gb.getPlacename()%></a></td>
<td><%=gb.getPlaceaddr()%></td>
</tr>

<%} %>
</table>
</div>



<div id="news_notice">
<h3 class="brown">최신글</h3>
<table>
<%
// 최신글 5개
// 1행 5개 가져오기
// BoardDAO bdao 생성
String category ="board";
BoardDAO bDAO = new BoardDAO();
// int count = getBoardCount()호출
count = bDAO.getBoardCount(category);
// 한 화면에 보여줄 가져올 글 갯수 생성
pageSize =5;
// 현 페이지 번호가 없으면 "1"페이지로 설번
pageNum = request.getParameter("pageNum");
// 현 페이지 번호가 없으면 "1"페이지로 설정
if(pageNum==null){ // 현페이지 번호가 없으면
	pageNum="1"; // 10개씩 잘라서 1페이지 시작하는지 확인
} 
// pageNum => 정수형으로 변경
currentPage =Integer.parseInt(pageNum);
// 10개씩 잘라서 1페이지 시작하는 행 번호 구하기
startRow= (currentPage-1)*pageSize+1;
// List boardlist = jbDAO.getboardList(startRow,pageSize); 호출
List boardlist1 = bDAO.getboardList(startRow,pageSize,category); 
for (int i = 0; i < boardlist1.size(); i++) {
	BoardBean jbb = (BoardBean) boardlist1.get(i);
%>
<tr><td class="contxt"><a href="../board/content.jsp?num=<%=jbb.getNum() %>"><%=jbb.getSubject() %></a></td>
    <td><%=sdf.format(jbb.getDate())%></td></tr>

<%} %>
</table>
</div>



</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->
</div>
</body>
</html>