<%@page import="member.MemberBean"%>
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
//request 파라미터값 가져와서 변수에저장

MemberBean mb = new MemberBean();
mb.setId(request.getParameter("id"));
mb.setPass(request.getParameter("pass"));

MemberDAO mDAO = new MemberDAO();
int check = mDAO.userCheck(mb);

if(check ==1){
session.setAttribute("id", request.getParameter("id"));%>
<script type="text/javascript">
alert("환영합니다");
location.href("../main/main.jsp");
</script>
<%
}else if(check==0){%>
<script type="text/javascript">
alert("비밀번호 틀렸습니다.");
history.back();
</script>
<%}else if(check==-1){%>
<script type="text/javascript">
alert("존재하지않는 아이디 입니다.");
history.back();
</script>
<%} %>

</body>
</html>