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
<h1>Search Result</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 검색어 search 가져오기
String search = request.getParameter("search");
String category = request.getParameter("board");
// 


request.setCharacterEncoding("UTF-8");
BoardDAO jbDAO= new BoardDAO();
// 게시판 글개수를 호출 getBoardCount() count() 
// int count = getBoardCount() 호출
int count = jbDAO.getBoardCount(search,category);
// getBoardCount 를 넘겨서 search값 받음


// 한 화면에 보여줄 가져올 글 개수 설정
int pageSize =8;


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


List boardlist = jbDAO.getboardList_search(startRow, pageSize, search); //호출
// List boardlist = jbDAO.getboardList();
%>
<table id="notice">
	<tr>
		<th class="tno">No.</th>
		<th class="ttitle">Title</th>
		<th class="twrite">Writer</th>
		<th class="tdate">Date</th>
		<th class="tread">Read</th>
	</tr>
	<%
		// jbb.getNum() 실제 게시판 번호 -> 가상카운트 번호 부여  
	// 전체 글개수 count		pageNum		pageSize	=>	num
	//			30			1			10		=>	30- 0=>30
	//			30			2			10		=>	30-10=>20
		//			30			3			10		=>	30-20=>10
		int num = count - (currentPage - 1) * pageSize;
		// 2020-0324 17:42:30.0  ==>  2012.11.06 문자날짜모양
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		for (int i = 0; i < boardlist.size(); i++) {
			BoardBean jbb = (BoardBean) boardlist.get(i);
	%>
	<tr>
		<td><%=num--%></td>
		<td class="left"><a href="../board/content.jsp?num=<%=jbb.getNum()%>&pageNum=<%=pageNum%>"><%=jbb.getSubject()%></a></td>
		<td class="left"><%=jbb.getName()%></td>
		<td><%=sdf.format(jbb.getDate())%></td>
		<td><%=jbb.getReadcount()%></td>
	</tr>
	<%
		}
	%>
</table>
<div id="table_search">
<form action="noticeSearch.jsp" method="post">
	<input type="text" name="search" class="input_box"> 
	<input type="submit" value="search" class="btn">
	<%
		String id = (String) session.getAttribute("id");
		if (id != null) {
	%>
	<input type="button" value="글작성" class="btn"
		onclick="location.href='../board/writeForm.jsp'">
	<%}%>
	</form>
	
</div>
		<%// 한 화면에 보여줄 페이지 개수
int pageBlock = 3;
// int pageCount = count /pageSize +(count%pageSize==0?0:1);
int pageCount= count%pageSize==0?(count/pageSize):(count/pageSize)+1 ;

// 한 화면에 보여줄 시작 페이지 번호 구하기
// 페이지 번호(CurrentPage)   pageBlock=>	시작페이지 번호 
//	 1-10						10	=>		0*10+1=> 0+1 => 1
//	 11-20						10	=>		1*10+1=> 0+1 => 11
//	 21-30						10	=>		2*10+1=> 0+1 => 21
int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
// 한 화면에 보여줄 끝 페이지 번호 구하기
// startPage		pageBlock 	=> 		endPage
//		1				10		=>			10
//		11				10		=>			20
int endPage = (startPage+pageBlock)-1;
// endPage 10 <= 전체 페이지수 5페이지
if(endPage>pageCount){
	endPage = pageCount;
}

// 	 1  2  3  ~ 10 [다음]
//  [이전]11 12 13 ~20


// [이전] 10페이지 이전
if(startPage > pageBlock){%> 

	<a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a> 
	<!-- 10페이지씩 앞으로 감 -->
<%}%>

<%// 1~10	11~20	startPage ~ endPage
// 선택한 페이지 진한글씨
for(int i = startPage; i <= endPage; i++){
	if(i == currentPage){%>
		<u><b>[<%=i %>]</b></u>
<%	} else {%>
		[<a href="notice.jsp?pageNum=<%=i %>"><%=i %></a>]
<%	}
}%>


<%// [다음] 10페이지 다음
if(endPage < pageCount){%>
	<a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a> 
<%}%>




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