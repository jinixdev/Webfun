<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더들어가는 곳 -->
<header>
<%
String id = (String)session.getAttribute("id");
if(id==null){
%>
<div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
<%}else if(id!=null){%>
<div id="login"><%=id %>님 | <a href="../member/info.jsp">info</a> | <a href="../member/logout.jsp">logout</a></div><%} %>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../images/linkedin_banner_image_1.png" width="265" height="80" alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="../center/gallery.jsp">Gallery</a></li>
	<li><a href="../center/notice.jsp">Community</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>
<!-- 헤더들어가는 곳 -->