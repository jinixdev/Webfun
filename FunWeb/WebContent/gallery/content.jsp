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
	var eattype = document.getElementById("eattypes").value;

	var eat = document.getElementsByName("eatstyle");
		

		for (var i = 0; i < eat.length; i++) {
			if (eattype.indexOf(eat[i].value)==-1) {
				eat[i].checked = false;
			} else {
				eat[i].checked = true;
			}
		}
		
		var loop = document.getElementById("listSize").value;

		for(j=0;j<=loop;j++){


		var stars = document.getElementById("stars"+j).value;
		var name = document.getElementById("stars"+j).id;

		for(i=1; i<=stars; i++){
			 image = "star"+i+j;
			 el = document.getElementById(image);
			 el.src= "../css/pic/star1.png";
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
	
//content delete show and none
function contentdelete(p_num,category){
	var result = confirm("게시글을 삭제하시겠습니까?");
	if(result){
	   location.href="deletePro.jsp?p_num="+p_num+"&category="+category;
	}
	
}
	

</script> 
<script src="gallery.js"></script>
<style type="text/css">
th{
color: orange;
}</style>
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


<input type="hidden" id="rating" value=<%=rating%>>

<table style="font-size:15px;padding-bottom:10;">
<tr><td colspan="2">
<a href="file_down.jsp?file_name=<%=gb.getFile()%>"></a></td></tr>
<tr><th>장소</th><td><%= gb.getPlacename() %></td></tr>
<tr><th>주소</th><td><%= gb.getPlaceaddr() %></td></tr>
<tr><th>평점</th><td style="font-size:15px ;color:orange;">
<b><%=rating %></b></td></tr>


</table>

<!-- 원래 comment자리 -->


<!-- <!-- delete code --> 
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



<h1>Review</h1>

<!-- --------------------------content list------------------------------ -->

<%List contentList= gDAO.getContentList(gb.getPlacename()); %>

<input type="hidden" id="listSize" value="<%=contentList.size()%>">

<% for(int i=0;i<contentList.size();i++){
	gb = (galleryBean)contentList.get(i);
	
%>
	
<input type="hidden" id="stars<%=i%>" value="<%=gb.getStar()%>">

	<hr>
<input type="hidden" id="eattypes" value="<%=gb.getEattype()%>">
<input type="hidden" id="loop" value="<%=contentList.size()%>">


	

<table >
<tr><td rowspan="4">
<%if(gb.getFile()==null) {%>

<img src="../upload/<%=gb.getFile()%>" width="100" height="100">

<%}else{%>

<img src="../upload/<%=gb.getFile()%>" width="100" height="100">
<%} %>
</td><th>글쓴이</th><td><%= gb.getName() %></td>
<th>평점</th><td style="font-size:30;">

<div id="star">
<span id="star_grade" >
       <img id="star1<%=i%>" src="../css/pic/star0.png">
       <img id="star2<%=i%>" src="../css/pic/star0.png">
       <img id="star3<%=i%>" src="../css/pic/star0.png">
       <img id="star4<%=i%>" src="../css/pic/star0.png">
       <img id="star5<%=i%>" src="../css/pic/star0.png">
</span>
<input type="hidden" id="starValue" name="starValue" value="<%=gb.getStar()%>">
</div>



</td></tr>






<tr><td colspan="4" width='350' style='word-break:break-all;'><%=gb.getContent() %></td></tr>


<tr><th>음식 양</th><td><%=gb.getEattype() %></td></tr>
<tr><th>작성일</th><td><%= sdf.format(gb.getDate())%></td></tr>
<tr><td><input type="button" value="댓글" class="btn" onclick="showcomment(<%=gb.getNum()%>);"></td>
<%if(gb.getId().equals(id)){%>
<td>
<input type="button" class="btn" value="글수정" onclick="location.href='fupdateForm.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" class="btn" value="글삭제" onclick="javascript:contentdelete('<%=gb.getNum()%>','<%=category%>');">
</td>
<%}%>
</tr>
</table>

<!-- ----------------comment code---------------------- -->
<!-- comment insert code -->
<!-- must have id -->

<div id="commenttotal<%=gb.getNum()%>" style="display:none;">
<%

commentDAO comDAO = new commentDAO();

List comList= comDAO.getCommentList(gb.getNum(),category);%>
<table>
<% for(int j=0;j<comList.size();j++){
	
	commentBean cb = (commentBean)comList.get(j);
	%>
	
<tr><th><%=cb.getId() %></th><td><%=cb.getContent() %></td> 
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

<%if(id!=null){ %>

<div id="commenttable" style="display:block;">
<form action="../comment/commentPro.jsp">
<input type="hidden" name="id" value="<%=id%>">
<textarea name="content" cols="50" rows="2"></textarea>
<input type="hidden" name="p_num" value="<%=gb.getNum()%>">
<input type="hidden" name="category" value="<%=category%>">
<input type="submit">
</form>
</div>
<%} %>

</div>

<!-- comment update code -->
<div id="updatetable" style="display:none;">
<form action="../comment/updatePro.jsp" method="get">

<input type="hidden" name="comment_id" id="comment_id">
<textarea name="comment" id="comment" cols="50" rows="2"></textarea>
<input type="hidden" name="p_num" id="p_num"><input type="hidden" name="r_num" id="r_num">
<input type="hidden" name="category" value="<%=category%>">
<input type="submit" value="수정" >
<input type="button" class="btn" value="취소" onclick="hide();">
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