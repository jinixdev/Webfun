<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function submitCheck(){
	if(document.getElementById("file").value==""||document.getElementById("file").value==null){
		alert("사진을 함께 올려주세요.");
		return false; //
	}
	
	if(document.getElementById("starValue").value==""||document.getElementById("starValue").value==null){
		alert("별점을 등록해주세요");
		document.getElementById("starValue").focus();
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
<div id="sub_img_gallery"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
</ul>
</nav>


<!-- 본문들어가는 곳 -->
<%
String id = (String)session.getAttribute("id"); 
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
	// 첨부파일 파일 업로드
	// 1. 서버안에 폴더 만들어서 파일을 넣고 // 파일이름 디비에 저장
	// 2. 파일을 DB에 저장
	// 
%>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data" onsubmit="return submitCheck()">

<table>
<tr><td colspan="2"><input type="text" id="placename" name="placename">
<input type="button" value="위치추가" class="dup" onclick="map()"></td></tr>
<tr><td colspan="2"><input type="text" id="placeaddr" name="placeaddr" style="width:300px;"></td></tr>

<tr><td colspan="2"><input type="file" name="file" id="file"></td></tr>
<tr><td colspan="2"><textarea name="content" rows="10" cols="50"></textarea></td></tr>
<tr><td>평점</td><td>

<div id="star">
<span id="star_grade" >
       <img id=star1 onmouseover="show('star',1)" onclick="mark('star',1)" onmouseout="noshow('star',1)" src="../css/pic/star0.png">
       <img id=star2 onmouseover="show('star',2)" onclick="mark('star',2)" onmouseout="noshow('star',2)" src="../css/pic/star0.png">
       <img id=star3 onmouseover="show('star',3)" onclick="mark('star',3)" onmouseout="noshow('star',3)" src="../css/pic/star0.png">
       <img id=star4 onmouseover="show('star',4)" onclick="mark('star',4)" onmouseout="noshow('star',4)" src="../css/pic/star0.png">
       <img id=star5 onmouseover="show('star',5)" onclick="mark('star',5)" onmouseout="noshow('star',5)" src="../css/pic/star0.png">
       <span id="startext">평가하기</span>
</span>
<input type="hidden" id="starValue" name="starValue">
</div>


</td></tr>
<tr><td>음식 양</td>
<td><input name="eatstyle" type="checkbox" value="양적음" />양적음
<input name="eatstyle" type="checkbox" value="보통" />보통
<input name="eatstyle" type="checkbox" value="양많음" />양많음
</td>
</tr>
<tr><td><input type="submit" value="확인"></td></tr>
</table>
<input type="hidden" name="id" value="<%=jmb.getId()%>">
<input type="hidden" name="name" value="<%=jmb.getName()%>">
</form>
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->
</div>
</body>
</html>
















