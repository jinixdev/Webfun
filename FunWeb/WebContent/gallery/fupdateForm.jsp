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
function submitCheck(){
	if(document.getElementById("file").value==""||document.getElementById("file").value==null){
		alert("이미지를 등록해주세요");
		document.getElementById("file").focus();
		return false; //
	}
	
	if(document.getElementById("starValue").value==""||document.getElementById("starValue").value==null){
		alert("별점을 등록해주세요");
		document.getElementById("starValue").focus();
		return false; //
	}
	
	
	
	
	
}

	
window.addEventListener('DOMContentLoaded', function(){
	
    
//  checkbox
	var foodtype = document.getElementById("foodtypes").value;

	var food = document.getElementsByName("foodstyle");
		

		for (var i = 0; i < food.length; i++) {
			if (foodtype.indexOf(food[i].value)==-1) {
				food[i].checked = false;
			} else {
				food[i].checked = true;
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
<input type="hidden" id="foodtypes" value=<%=gb.getFoodtype()%>>
<form action="fupdatePro.jsp" method="post" enctype="multipart/form-data" onsubmit="return submitCheck()">
<table >

<tr><td>글번호</td><td><%=gb.getNum()%></td></tr>
<tr><td>작성일</td><td><%=gb.getDate() %></td></tr>
<tr><td colspan="2"><input type="text" id="placename" name="placename" value="<%=gb.getPlacename()%>">
<input type="button" value="위치추가" class="dup" onclick="map()"></td></tr>
<tr><td colspan="2"><input type="text" id="placeaddr" name="placeaddr" style="width:300px;"
value="<%=gb.getPlaceaddr()%>"></td></tr>
<tr><td>글 비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><input type="file" name="file" id="file" value="<%=gb.getFile()%>"></td></tr>
<tr><td colspan="2"><textarea name="content" rows="10" cols="20" ><%=gb.getContent() %></textarea></td></tr>
<tr><td>tastetype</td><td>
<input type="button" onclick="showrating('hot');" value="hot">
<div id="hot" style="display:none;">
<p id="hot_grade" >
       <img id=hot1 onmouseover="show('hot',1)" onclick="mark('hot',1)" onmouseout="noshow('hot',1)" src="../css/pic/hot0.png">
       <img id=hot2 onmouseover="show('hot',2)" onclick="mark('hot',2)" onmouseout="noshow('hot',2)" src="../css/pic/hot0.png">
       <img id=hot3 onmouseover="show('hot',3)" onclick="mark('hot',3)" onmouseout="noshow('hot',3)" src="../css/pic/hot0.png">
       <img id=hot4 onmouseover="show('hot',4)" onclick="mark('hot',4)" onmouseout="noshow('hot',4)" src="../css/pic/hot0.png">
       <img id=hot5 onmouseover="show('hot',5)" onclick="mark('hot',5)" onmouseout="noshow('hot',5)" src="../css/pic/hot0.png">
       <span id="hottext">평가하기</span>
</p>
<input type="hidden" id="hot" value="uncheck">
</div>
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
<tr><td>foodtype</td>
<td><input name="foodstyle" type="checkbox" value="한식" />한식
<input name="foodstyle" type="checkbox" value="중식" />중식
<input name="foodstyle" type="checkbox" value="양식" />양식
<input name="foodstyle" type="checkbox" value="일식" />일식
<input name="foodstyle" type="checkbox" value="기타" />기타
</td>
</tr>
<tr><td><input type="submit" value="확인"></td></tr>
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