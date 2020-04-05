<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
String uploadPath= request.getRealPath("/upload"); // 물리적인 경로
System.out.print("uploadPath: "+uploadPath); // 가상경로에서 upload로 파일 넣어주기(사진)

int maxSize = 5*1024*1024; // 5M

MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());


int num = Integer.parseInt(multi.getParameter("num"));

BoardBean jbb = new BoardBean();
jbb.setNum(num);
jbb.setName(multi.getParameter("name"));
jbb.setSubject(multi.getParameter("subject"));
jbb.setContent(multi.getParameter("content"));
jbb.setCategory(multi.getParameter("category"));

//폴더에 업로드 된 파일이름
String file = multi.getFilesystemName("file");
//BoardBean에 file 추가
jbb.setFile(file);

BoardDAO jbDAO = new BoardDAO();
jbDAO.updateBoard(num, jbb); 

response.sendRedirect("../center/download.jsp?num="+num);

%>
</body>
</html>