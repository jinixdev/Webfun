<%@page import="com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function sendCheckValue(){
	 opener.document.getElementById("idDuplication").value ="idcheck";
	 document.getElementById("cInput").value= opener.document.getElementById("idDuplication").value;
	 window.close();
}
</script>
</head>
<body >
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

MemberDAO mDAO = new MemberDAO();
int check = mDAO.userDupCheck(id); %>


<%switch(check){
case 1:  %>
<%=id %>는 존재하는 아이디 입니다.<br>
<input type="button" id="idUncheck" value="확인" onclick="window.close()">
<%break;
case 0:%>
<%=id %>는  사용할 수 있는 아이디 입니다.<br>
 <input type="hidden" id="cInput">
<input type="button" id="idcheck" value="확인" onclick="sendCheckValue()">
<input type="button" value="취소" onclick="window.close()">
<%break;}%>



</body>
</html>