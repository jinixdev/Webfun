<%@page import="com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

MemberDAO mDAO = new MemberDAO();
int check = mDAO.userDupCheck(id);%>
<form>

<%switch(check){
case 1:  %>
존재하는 아이디 입니다.<br>
<input type="button" value="확인" onclick="window.close()">
<%break;
case 0:%>
사용할 수 있는 아이디 입니다.<br>
<input type="button" value="사용" onclick="window.close()">
<input type="button" value="확인" onclick="window.close()">
<%break;}%>
</form>
</body>
</html>