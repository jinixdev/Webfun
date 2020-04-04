<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Spliterator"%>
<%@page import="gallery.galleryDAO"%>
<%@page import="gallery.galleryBean"%>
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
	
	// comment code show and none
function showcomment(num){
	var comment=document.getElementById("commenttotal"+num);
	if(comment.style.display=="none"){
		comment.style.display="block";
	}else{
		comment.style.display="none";
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
String category="gallery";
int p_num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum"); // 계산할것이 아니므로 String으로 받아도 됨
galleryDAO gDAO = new galleryDAO(); 
galleryBean gb= gDAO.getboardContent(p_num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
Timestamp nowtime = new Timestamp(System.currentTimeMillis());
SimpleDateFormat time = new SimpleDateFormat("hh:mm");
int rating = gDAO.getPlaceRating(gb.getPlacename());
String id = (String)session.getAttribute("id");
/* int num2 = gb.getNum(); */
%>

<input type="hidden" id="foodtypes" value=<%=gb.getFoodtype()%>>

<table>
<tr><td colspan="2">
<a href="file_down.jsp?file_name=<%=gb.getFile()%>"></a></td></tr>
<tr><td>장소</td><td><%= gb.getPlacename() %></td></tr>
<tr><td>주소</td><td><%= gb.getPlaceaddr() %></td></tr>
<tr><td>평점</td><td style="text-decoration: underline;"><%=rating %></td></tr>


</table>

<!-- 원래 comment자리 -->


<!-- delete code -->
<!-- <div id="showtable" style="display:none;"> -->
<%-- <form action="fdeletePro.jsp?pageNum=<%=pageNum%>" method="post"> --%>
<!-- <table> -->
<!-- <tr><td>비밀번호</td><td><input type="password" name="pass"></td> -->
<%-- <% session.setAttribute("num", gb.getNum());%> --%>
<!-- <td><button type="submit" value="확인">확인</button></td></tr> -->
<!-- </table> -->
<!-- <input type="hidden" id="hot"> -->
<%-- <input type="hidden" name="p_num" value="<%=p_num%>"> --%>
<%-- <input type="hidden" name="category" value="<%=category%>"> --%>
<!-- </form> -->
<!-- </div> -->

<hr>

<h1>같은 음식점 다른리뷰</h1>

<!-- --------------------------content list------------------------------ -->

<%List contentList= gDAO.getContentList(gb.getPlacename()); %>

<% for(int i=0;i<contentList.size();i++){
	gb = (galleryBean)contentList.get(i);
	%>
	<hr>

<table>
<tr><td rowspan="3">
<%-- <a href="../upload/<%=gb.getFile()%>"><%=gb.getFile()%></a> --%> 
<a href="" ></a><img src="../upload/<%=gb.getFile()%>" width="100" height="100"></a>
<%-- <a href="file_down.jsp?file_name=<%=gb.getFile()%>"></a>  // download --%>
</td><td>글쓴이</td><td><%= gb.getId() %></td>
<td>평점</td><td><%=gb.getStar() %></td></tr>
<tr><td>내용</td><td colspan="4" width='250px' style="word-break:break-all;"><%=gb.getContent() %></td></tr>
<tr><td>작성일</td><td><%= sdf.format(gb.getDate())%></td></tr>
<tr><td><input type="button" value="댓글" onclick="showcomment(<%=gb.getNum()%>);"></td></tr>
<%if(gb.getId().equals(id)){%>
<tr><td colspan="4">
<input type="button" value="글수정" onclick="location.href='fupdateForm.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="글삭제" onclick="showhide();">
</td></tr>
<%}%>
</table>

<!-- ----------------comment code---------------------- -->
<!-- comment insert code -->
<!-- must have id -->

<div id="commenttotal<%=gb.getNum()%>" style="display:block;">
<%

commentDAO comDAO = new commentDAO();

List comList= comDAO.getCommentList(gb.getNum(),category);%>
<table>
<% for(int j=0;j<comList.size();j++){
	
	commentBean cb = (commentBean)comList.get(j);
	%>
	
<tr><td><%=cb.getId() %></td><td><%=cb.getContent() %></td> 
<td><%if (sdf.format(gb.getDate()).equals(sdf.format(nowtime))) {%>
<span><%=time.format(cb.getReg_date()) %></span>
			<span style="color: red;"><sup>Ν</sup></span> 
			<%}else{%>
			<%=sdf.format(cb.getReg_date()) %>
			<%} %>
			</td>

<% if(cb.getId().equals(id)){ %>
<td><a href="javascript:commentUpdate('<%=cb.getId()%>','<%=cb.getContent()%>',
'<%=cb.getP_num()%>','<%=cb.getR_num()%>');">수정</a></td>
<td><a href="../comment/deletePro.jsp?num=<%=cb.getNum()%>&p_num=<%=cb.getP_num()%>&category=<%=category%>">삭제</a></td> <%}} %></tr>
</table>



<div id="commenttable" style="display:block;">
<form action="../comment/commentPro.jsp">
<input type="hidden" name="id" value="<%=id%>">
<textarea name="content" cols="50" rows="2"></textarea>
<input type="hidden" name="p_num" value="<%=gb.getNum()%>">
<input type="hidden" name="category" value="<%=category%>">
<input type="submit">
</form>
</div>

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