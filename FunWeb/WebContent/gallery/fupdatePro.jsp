<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="gallery.galleryDAO"%>
<%@page import="gallery.galleryBean"%>
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
System.out.print("writepro : "+multi.getParameter("content"));

galleryBean gb = new galleryBean();
String file = multi.getFilesystemName("file");
gb.setFile(file);
gb.setContent(multi.getParameter("content"));
galleryDAO gDAO = new galleryDAO();
gDAO.updateBoard(num, gb); 

response.sendRedirect("../center/gallery.jsp");

%>
</body>
</html>