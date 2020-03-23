<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<%
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

<h1>글목록 [ 전체 글개수 :<%=count%>] </h1>
<table border="1">
<tr><td>글번호</td><td>조회수</td><td>글쓴이</td><td>비밀번호</td><td>제목</td><td>내용</td><td>작성날짜</td></tr>
<%
for(int i =0;i<boardlist.size();i++){
	BoardBean jbb = (BoardBean)boardlist.get(i);%>
	<tr><td><%=jbb.getNum() %></td><td><%=jbb.getReadcount() %></td>
	<td><%=jbb.getName() %></td><td><%=jbb.getPass() %></td>
	<td><a href="content.jsp?num=<%=jbb.getNum()%>"><%= jbb.getSubject() %></a></td>
	<td><%=jbb.getContent() %></td><td><%=jbb.getOnlydate() %></td>
	</tr>
<%} 
String id = (String)session.getAttribute("id"); %>
<!-- if(id!=null){%> -->
<tr><td><input type="button" value="글작성" onclick="location.href='writeForm.jsp'"></td></tr>
<%-- <%} %> --%>
</table>
<%
// 전체 페이지 수 구하기	전체 글 개수  50		한화면에 보여줄 개수  10 => 전체 페이지수  5 + 나머지가 없으면 0
//							 59					  10			  5 + 		있으면 1



// 한 화면에 보여줄 페이지 개수
int pageBlock = 10;
// int pageCount = count /pageSize +(count%pageSize==0?0:1);
int pageCount= count%pageBlock==0?(count/pageBlock):(count/pageBlock)+1 ;
System.out.println();
// 한 화면에 보여줄 시작 페이지 번호 구하기
// 한 화면에 보여줄 끝 페이지 번호 구하기


%>

	 1  2  3  ~ 10 [다음]
[이전]11 12 13 ~20

</body>
</html>