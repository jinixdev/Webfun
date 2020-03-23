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
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>Notice</h1>
<%
request.setCharacterEncoding("UTF-8");
BoardDAO jbDAO= new BoardDAO();
// 게시판 글개수를 호출 getBoardCount() count() 
// int count = getBoardCount() 호출
int count = jbDAO.getBoardCount();

// 한 화면에 보여줄 가져올 글 개수 설정
int pageSize =10;


// 현 페이지 번호 가져오기 pageNum 파라미터 가져오기 (처음엔 없기때문에 "1")
String pageNum = request.getParameter("pageNum");
// 현 페이지 번호가 없으면 "1"페이지로 설정
if(pageNum==null){ // 현페이지 번호가 없으면
	pageNum="1"; // 10개씩 잘라서 1페이지 시작하는지 확인
} 
// pageNum => 정수형으로 변경
int currentPage =Integer.parseInt(pageNum);
// 10개씩 잘라서 1페이지 시작하는 행번호 구하기
// pageNum(currentPage) = pageSize	=>	startRow시작행번호
//			1				10		=>		0+1		=>1
//			2				10		=>		10+1	=>11
//			3				10		=>		20+1	=>21
 int startRow= (currentPage-1)*pageSize+1;
// endRow
// pageNum(currentPage) = pageSize	=>	endRow시작행번호
//			1				10		=>		10
//			2				10		=>		20
//			3				10		=>		30
int endRow = currentPage*pageSize;

// select * from board order by num desc limit 시작하는 행번호-1,글개수


List boardlist = jbDAO.getboardList(startRow,pageSize); //호출
// List boardlist = jbDAO.getboardList();
%>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<% for(int i =0;i<boardlist.size();i++){
	BoardBean jbb = (BoardBean)boardlist.get(i);%>   
<tr><td><%=jbb.getNum() %></td><td class="left"><a href="../board/content.jsp?num=<%=jbb.getNum()%>"><%= jbb.getSubject() %></a></td>
    <td><%=jbb.getName() %></td><td><%=jbb.getOnlydate() %></td><td><%=jbb.getReadcount() %></td></tr>



<%}%> 


</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
<%String id = (String)session.getAttribute("id"); 
if(id!=null){%>
<input type="button" value="글작성" class="btn" onclick="location.href='../board/writeForm.jsp'">
<%} %>
</div>


<div class="clear"></div>
<div id="page_control">
<a href="#">Prev</a>
<a href="#">1</a><a href="#">2</a><a href="#">3</a>
<a href="#">4</a><a href="#">5</a><a href="#">6</a>
<a href="#">7</a><a href="#">8</a><a href="#">9</a>
<a href="#">10</a>
<a href="#">Next</a>
</div>
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