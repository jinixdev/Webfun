<%@page import="java.util.Spliterator"%>
<%@page import="gallery.galleryDAO"%>
<%@page import="gallery.galleryBean"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="comment.commentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.commentDAO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function showhide(){
	var obj=document.getElementById("showtable");
	if(obj.style.display=="none"){
		obj.style.display="block";
	}else{
		obj.style.display="none";
	}
}

function commentUpdate(id,comment,p_num,r_num){
	var commenttable = document.getElementById("commenttable");
	var updatetable=document.getElementById("updatetable");
	document.getElementById("comment_id").value=id;
	document.getElementById("comment").value=comment;
	document.getElementById("p_num").value=p_num;
	document.getElementById("r_num").value=r_num;
	
	if(updatetable.style.display=="none"){
		updatetable.style.display="block";
		commenttable.style.display="none";
	}else{
		updatetable.style.display="none";
		commenttable.style.display="block";
	}
}


function hide(){
	var update=document.getElementById("updatetable");
	var commenttable = document.getElementById("commenttable");
	if(update.style.display=="block"){
		update.style.display="none";
		commenttable.style.display="block";
	}
}

function commentDelete(){
	var p_num =document.getElementById("p_num").value;
	var r_num =document.getElementById("r_num").value;
	location.href="../comment/deletePro.jsp?p_num="+p_num;
}

function checked(foodtype){
	var foodtype =foodtype.split(',');
	alert(foodtype);
	
}



window.addEventListener('DOMContentLoaded', function(){
	
    
//     checkbox
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
String pageNum = request.getParameter("pageNum"); // 계산할것이 아니므로 String으로 받아도 됨
System.out.println("num : "+p_num);
galleryDAO gDAO = new galleryDAO(); 
galleryBean gb= gDAO.getboardContent(p_num);

String id = (String)session.getAttribute("id");
/* int num2 = gb.getNum(); */
%>

<input type="hidden" id="foodtypes" value=<%=gb.getFoodtype()%>>



<table>
<tr><td>글번호</td><td><%= gb.getNum() %></td></tr>
<tr><td>작성일</td><td><%=gb.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%= gb.getId() %></td></tr>
<tr><td>파일</td><td colspan="3"><a href="../upload/<%=gb.getFile()%>"><%=gb.getFile()%></a>
<img src="../upload/<%=gb.getFile()%>" width="100" height="100">
<a href="file_down.jsp?file_name=<%=gb.getFile()%>"></a></td></tr>
<tr><td>내용</td><td colspan="3"><%=gb.getContent() %></td></tr>
<tr><td>foodstyle</td>
<td>
<input name="foodstyle"  type="checkbox" value="한식"  />한식
<input name="foodstyle" type="checkbox" value="중식" />중식
<input name="foodstyle"  type="checkbox" value="양식" />양식
<input name="foodstyle" type="checkbox" value="일식" />일식

</td></tr>

<tr><td colspan="4">
<input type="button" value="글목록" onclick="location.href='../center/notice.jsp?pageNum=<%=pageNum%>'">
<%if(gb.getId().equals(id)){%>
<input type="button" value="글수정" onclick="location.href='fupdateForm.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="글삭제" onclick="showhide();">
<%}%>
</td></tr>
</table>

<!-- delete code -->
<div id="showtable" style="display:none;">
<form action="fdeletePro.jsp?pageNum=<%=pageNum%>" method="post">
<table>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td>
<% session.setAttribute("num", gb.getNum());%>
<td><button type="submit" value="확인">확인</button></td></tr>
</table>
<input type="hidden" id="hot">
</form>
</div>

<hr>



<!-- comment insert code -->
<!-- must have id -->
<% if(id!=null){ %>
<%
commentDAO comDAO = new commentDAO();
String category="gallery";
List comList= comDAO.getCommentList(p_num,category);%>
<table>
<% for(int i=0;i<comList.size();i++){
	commentBean cb = (commentBean)comList.get(i);
	%>
<tr><td><%=cb.getId() %></td><td><%=cb.getContent() %></td>
<% if(cb.getId().equals(id)){ %>
<td><a href="javascript:commentUpdate('<%=cb.getId()%>','<%=cb.getContent()%>',
'<%=cb.getP_num()%>','<%=cb.getR_num()%>');">수정</a></td>
<td><a href="../comment/deletePro.jsp?num=<%=cb.getNum()%>&p_num=<%=cb.getP_num()%>&category=<%=category%>">삭제</a></td> <%}} %></tr>
</table>



<div id="commenttable" style="display:block;">
<form action="../comment/commentPro.jsp">
<input type="hidden" name="id" value="<%=id%>">
<textarea name="content" cols="50" rows="2"></textarea>
<input type="hidden" name="p_num" value="<%=p_num%>">
<input type="hidden" name="category" value="<%=category%>">
<input type="submit">
</form>
</div>


<!-- comment update code -->
<div id="updatetable" style="display:none;">
<form action="../comment/updatePro.jsp" method="get">

<input type="hidden" name="comment_id" id="comment_id">
<textarea name="comment" id="comment" cols="50" rows="2"></textarea>
<input type="hidden" name="p_num" id="p_num"><input type="hidden" name="r_num" id="r_num">
<input type="hidden" name="category" value="<%=category%>">
<input type="submit" value="수정" >
<input type="button" value="취소" onclick="hide();">
</form>
</div>


<%} %>








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