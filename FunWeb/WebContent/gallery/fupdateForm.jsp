<%@page import="gallery.galleryBean"%>
<%@page import="gallery.galleryDAO"%>
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
<script type="text/javascript">
function submitCheck(){
	if(document.getElementById("file").value==""||document.getElementById("file").value==null){
		alert("이미지를 등록해주세요");
		document.getElementById("file").focus();
		return false; //
	}
}


</script>
<script src="gallery.js"></script>
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





<%
int p_num = Integer.parseInt(request.getParameter("num"));
galleryDAO gDAO= new galleryDAO();
galleryBean gb= gDAO.getboardContent(p_num);
%>
<form action="fupdatePro.jsp" method="post" enctype="multipart/form-data" onsubmit="return submitCheck()">
<table >

<tr><td>글번호</td><td><%=gb.getNum()%></td></tr>
<tr><td>작성일</td><td><%=gb.getDate() %></td></tr>
<tr><td>글 비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>장소</td><td><input type="text" name="placename" value="<%=gb.getPlacename()%>"></td></tr>
<tr><td>주소</td><td><input type="text" name="placeaddr" value="<%=gb.getPlaceaddr()%>"></td></tr>
<tr><td>내용</td><td colspan="3"><input type="text" name="content" value="<%=gb.getContent() %>"></td></tr>
<tr><td>파일</td><td colspan="3" >
<%-- <a href="../upload/<%=gb.getFile()%>"><%=gb.getFile()%></a> --%>
<img src="../upload/<%=gb.getFile()%>" width="100" height="100"></td></tr>
<tr><td colspan="2"><input type="file" name="file" id="file" value="<%=gb.getFile()%>"></td></tr>
<tr><td>foodstyle</td>
<td>
<input name="foodstyle" type="checkbox" value="한식" />한식
<input name="foodstyle" type="checkbox" value="중식" />중식
<input name="foodstyle" type="checkbox" value="양식" />양식
<input name="foodstyle" type="checkbox" value="일식" />일식
<input name="foodstyle" type="checkbox" value="기타" />기타
</td></tr>
<tr><td>별점</td><td>
<span id="star_grade" >
       <img id=star1 onmouseover="show('star',1)" onclick="mark('star',1)" onmouseout="noshow('star',1)" src="../css/pic/star0.png">
       <img id=star2 onmouseover="show('star',2)" onclick="mark('star',2)" onmouseout="noshow('star',2)" src="../css/pic/star0.png">
       <img id=star3 onmouseover="show('star',3)" onclick="mark('star',3)" onmouseout="noshow('star',3)" src="../css/pic/star0.png">
       <img id=star4 onmouseover="show('star',4)" onclick="mark('star',4)" onmouseout="noshow('star',4)" src="../css/pic/star0.png">
       <img id=star5 onmouseover="show('star',5)" onclick="mark('star',5)" onmouseout="noshow('star',5)" src="../css/pic/star0.png">
       <span id="startext">평가하기</span>
</span>
<input type="hidden" id="star">
<td>
</tr>
<tr><td colspan="4"> <input type="submit" value="확인">
<input type="button" value="취소" onclick="location.href='../center/notice.jsp'"></td></tr>
	
</table>
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