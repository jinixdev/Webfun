<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- member/joinPro.jsp -->
<%
//request 한글 처리
request.setCharacterEncoding("utf-8");
//request 파라미터값 가져와서 변수에저장
Timestamp reg_date = new Timestamp(System.currentTimeMillis());

MemberBean mb = new MemberBean();
mb.setId(request.getParameter("id"));
mb.setPass(request.getParameter("pass"));
mb.setName(request.getParameter("name"));
mb.setEmail(request.getParameter("email"));
mb.setAddress(request.getParameter("address"));
mb.setPostcode(request.getParameter("postcode"));
mb.setDetailAddress(request.getParameter("detailAddress"));
mb.setExtraAddress(request.getParameter("extraAddress"));
mb.setReg_date(reg_date);

MemberDAO mDAO = new MemberDAO();
mDAO.insertMember(mb);
%>
<script type="text/javascript">
alert("가입을 축하합니다!");
location.href="../main/main.jsp";
</script>
</body>
</html>