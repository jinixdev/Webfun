<%@page import="comment.commentDAO"%>
<%@page import="comment.commentBean"%>
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
int num = Integer.parseInt(request.getParameter("num"));
int p_num = Integer.parseInt(request.getParameter("p_num"));

// System.out.println("deletepnum : "+p_num);
// System.out.println("r_num : "+r_num);
// System.out.println("deleternum : "+r_num);

commentDAO cDAO = new commentDAO();
cDAO.commentDelete(num);%>


	<script type="text/javascript">
	alert("작성하신 글이 삭제되었습니다.");
	</script>
<meta http-equiv="refresh" 
content="0;url=../board/content.jsp?num=<%=p_num%>"></meta>
</body>
</html>