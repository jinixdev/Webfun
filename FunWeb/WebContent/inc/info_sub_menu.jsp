<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="sub_menu">
<ul>
<%
String id = (String)session.getAttribute("id");
if(id!=null){
%>
<li><a href="../member/info.jsp">my info</a></li>
<li><a href="#">내 글</a></li>
	<li><a href="../gallery/myglist.jsp">- gallery</a></li>
	<li><a href="../board/mylist.jsp">- community</a></li>


<li><a href="../member/delete.jsp">탈퇴하기</a></li>
<%} %>
</ul>
</nav>