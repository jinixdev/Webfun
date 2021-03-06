<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->

 
</head>
<body>

<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_info"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/info_sub_menu.jsp"></jsp:include>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>my info</h1>
<form action="updatePro.jsp" id="join" name="fr" method="post" onsubmit="return submitCheck()">
<!-- form태그에서만 post -->
<%
String id = (String)session.getAttribute("id");
MemberDAO mDAO = new MemberDAO();
MemberBean mb= mDAO.getMember(id);

%>
<fieldset>
<legend>Basic Info</legend>
<label>*User ID</label>
<input type="text" name="id" class="id" id="id" value="<%=mb.getId()%>" readonly="readonly"><br>
<label>*Name</label>
<input type="text" id="name" name="name" value="<%=mb.getName()%>"><br>
<label>E-Mail</label>
<input type="email" id="email" name="email" value="<%=mb.getEmail()%>" onkeyup="retype()"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" id="postcode" placeholder="우편번호" name="postcode" value="<%=mb.getPostcode()%>"><br>
<label></label><input type="text" id="address" placeholder="주소" style="width:300px;" name="address" value="<%=mb.getAddress()%>"><br>
<label></label><input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress" value="<%=mb.getDetailAddress()%>">
<input type="text" id="extraAddress" placeholder="참고항목" name="extraAddress" value="<%=mb.getExtraAddress()%>"><br>

</fieldset>
<div class="clear"></div>
<input type="button" value="수정" onclick="location.href='updateForm.jsp'">
</form>

</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
<html>