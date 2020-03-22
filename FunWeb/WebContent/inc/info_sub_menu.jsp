<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
<%
String id = (String)session.getAttribute("id");
if(id!=null){
%>
<li><a href="../member/info.jsp">my info</a></li>
<li><a href="../board/mylist.jsp">my list</a></li>
<li><a href="../member/delete.jsp">탈퇴하기</a></li>
<%} %>
</ul>
</nav>