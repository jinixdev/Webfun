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

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_info"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/info_sub_menu.jsp"></jsp:include>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>My list</h1>
<%
String category ="board";
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String id = (String)session.getAttribute("id");

BoardDAO jbDAO= new BoardDAO();

// paging
int count = jbDAO.getBoardCount_mylst(id);
int pageSize =10;
String pageNum = request.getParameter("pageNum");
//현 페이지 번호가 없으면 "1"페이지로 설정
if(pageNum==null){ // 현페이지 번호가 없으면
	pageNum="1"; // 10개씩 잘라서 1페이지 시작하는지 확인
} 
//pageNum => 정수형으로 변경
int currentPage =Integer.parseInt(pageNum);
//10개씩 잘라서 1페이지 시작하는 행번호 구하기
//pageNum(currentPage) = pageSize	=>	startRow시작행번호
//			1				10		=>		0+1		=>1
//			2				10		=>		10+1	=>11
//			3				10		=>		20+1	=>21
int startRow= (currentPage-1)*pageSize+1;
//endRow
//pageNum(currentPage) = pageSize	=>	endRow시작행번호
//			1				10		=>		10
//			2				10		=>		20
//			3				10		=>		30
int endRow = currentPage*pageSize;


List boardlist = jbDAO.getboardList_mylst(startRow,pageSize,id);
%>

<table border="1">
<tr><td>글번호</td><td>조회수</td><td>글쓴이</td><td>비밀번호</td><td>제목</td><td>내용</td><td>작성날짜</td></tr>
<%
for(int i =0;i<boardlist.size();i++){
	BoardBean jbb = (BoardBean)boardlist.get(i);%>
	<tr><td><%=jbb.getNum() %></td><td><%=jbb.getReadcount() %></td>
	<td><%=jbb.getName() %></td><td><%=jbb.getPass() %></td>
	<td><a href="content.jsp?num=<%=jbb.getNum()%>"><%= jbb.getSubject() %></a></td>
	<td><%=jbb.getContent() %></td><td><%=jbb.getDate()%></td>
	</tr>
<%} %>
<tr><td><input type="button" value="글작성" onclick="location.href='writeForm.jsp'"></td></tr>

</table>

<br>
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

	<a href="mylist.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a> 
	<!-- 10페이지씩 앞으로 감 -->
<%}%>

<%// 1~10	11~20	startPage ~ endPage
// 선택한 페이지 진한글씨
for(int i = startPage; i <= endPage; i++){
	if(i == currentPage){%>
		<u><b>[<%=i %>]</b></u>
<%	} else {%>
		[<a href="mylist.jsp?pageNum=<%=i %>"><%=i %></a>]
<%	}
}%>


<%// [다음] 10페이지 다음
if(endPage < pageCount){%>
	<a href="mylist.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a> 
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