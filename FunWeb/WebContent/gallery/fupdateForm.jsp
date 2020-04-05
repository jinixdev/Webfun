<%@page import="gallery.galleryBean"%>
<%@page import="gallery.galleryDAO"%>
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
function submitCheck(file){
	if(document.getElementById("file").value==""||document.getElementById("file").value==null){
		document.getElementById("file").value ="../upload/"+file;
		return false;
	}
	
	if(document.getElementById("starValue").value==""||document.getElementById("starValue").value==null){
		alert("별점을 등록해주세요");
		document.getElementById("starValue").focus();
		return false; //
	}
	
	
	
	
	
}

	
window.addEventListener('DOMContentLoaded', function(){
	
    
//  checkbox
	var eattype = document.getElementById("eattypes").value;

	var eat = document.getElementsByName("eatstyle");
		

		for (var i = 0; i < eat.length; i++) {
			if (eattype.indexOf(eat[i].value)==-1) {
				eat[i].checked = false;
			} else {
				eat[i].checked = true;
			}
		}
		
		
		

	})

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
<div id="sub_img_gallery"></div>
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
<input type="hidden" id="eattypes" value=<%=gb.getEattype()%>>
<form action="fupdatePro.jsp" method="post" enctype="multipart/form-data" onsubmit="return submitCheck('<%=gb.getFile()%>');">
<table >

<tr><td>작성일</td><td><%=gb.getDate() %></td></tr>
<tr><td colspan="2"><input type="text" id="placename" name="placename" value="<%=gb.getPlacename()%>">
<input type="button" value="위치추가" class="dup" onclick="map()"></td></tr>
<tr><td colspan="2"><input type="text" id="placeaddr" name="placeaddr" style="width:300px;"
value="<%=gb.getPlaceaddr()%>"></td></tr>
<tr><td colspan="2"><img src="../upload/<%=gb.getFile()%>" width="300" height="250"></td></tr>
<tr><td colspan="2"><input type="file" name="file" id="file" value="../upload/<%=gb.getFile()%>"></td></tr>


<tr><td colspan="2"><textarea name="content" rows="10" cols="50" ><%=gb.getContent() %></textarea></td></tr>

<tr><td>tastetype</td><td>
<div id="star">
<span id="star_grade" >
       <img id=star1 onmouseover="show('star',1)" onclick="mark('star',1)" onmouseout="noshow('star',1)" src="../css/pic/star0.png">
       <img id=star2 onmouseover="show('star',2)" onclick="mark('star',2)" onmouseout="noshow('star',2)" src="../css/pic/star0.png">
       <img id=star3 onmouseover="show('star',3)" onclick="mark('star',3)" onmouseout="noshow('star',3)" src="../css/pic/star0.png">
       <img id=star4 onmouseover="show('star',4)" onclick="mark('star',4)" onmouseout="noshow('star',4)" src="../css/pic/star0.png">
       <img id=star5 onmouseover="show('star',5)" onclick="mark('star',5)" onmouseout="noshow('star',5)" src="../css/pic/star0.png">
       <span id="startext">평가하기</span>
</span>
<input type="hidden" id="starValue" name="starValue" value="<%=gb.getStar()%>">
</div>


</td></tr>
<tr><td>음식 양</td>
<td><input name="eatstyle" type="checkbox" value="양많음" />양많음
<input name="eatstyle" type="checkbox" value="보통" />보통
<input name="eatstyle" type="checkbox" value="양적음" />양적음
</td>
</tr>
<tr><td><input type="submit" value="확인"></td><td><input type="button" value="취소" onclick="history.back();"></td></tr>
</table>
<input type="hidden" name="name" value="<%=gb.getName()%>">
<input type="hidden" name="num" value="<%=gb.getNum()%>">
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