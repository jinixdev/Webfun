<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="gallery.galleryBean"%>
<%@page import="gallery.galleryDAO"%>
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
String category ="gallery";
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String id = (String)session.getAttribute("id");

galleryDAO gDAO = new galleryDAO();

// paging
int count = gDAO.getBoardCount_mylst(id);
int pageSize =5;
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

galleryBean gb = new galleryBean();
List contentList = gDAO.getboardList_mylst(startRow,pageSize,id);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
Timestamp nowtime = new Timestamp(System.currentTimeMillis());
SimpleDateFormat time = new SimpleDateFormat("hh:mm");%>

<% for(int i=0;i<contentList.size();i++){
	gb = (galleryBean)contentList.get(i);
	%>
	<hr>
<div onclick="location.href='../gallery/content.jsp?num=<%=gb.getNum()%>'">
<table>
<tr><td rowspan="4">
<%-- <a href="../upload/<%=gb.getFile()%>"><%=gb.getFile()%></a> --%> 
<a href="" ></a><img src="../upload/<%=gb.getFile()%>" width="100" height="100"></a>
<%-- <a href="file_down.jsp?file_name=<%=gb.getFile()%>"></a>  // download --%>
</td><td>글쓴이</td><td><%= gb.getId() %></td>
<td>평점</td><td><%=gb.getStar() %></td></tr>
<tr><td>내용</td><td colspan="4" width='250px' style="word-break:break-all;"><%=gb.getContent() %></td></tr>
<tr><td>작성일</td><td><%= sdf.format(gb.getDate())%></td></tr>
<tr><td>장소</td><td><%= gb.getPlacename()%></td></tr>
</table>
</div>

<%} %>

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