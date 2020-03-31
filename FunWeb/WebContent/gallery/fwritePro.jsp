<%@page import="gallery.galleryBean"%>
<%@page import="gallery.galleryDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writePro</title>
</head>
<body>
<%
// request.setCharacterEncoding("utf-8"); //없어도됨

// 파일 업로드 프로그램 설치

// 1. 생성자가 5개 있음(request,업로드할 폴더의 물리적인 경로,파일 최대크기설정,한글처리,이름이 동일할 때 파일이름 바꾸기)
// 2. 업로드 할 폴더 upload 만들기(Webcontent - upload) - 업로드할 폴더의 물리적인 경로만들어줘야함.
String uploadPath= request.getRealPath("/upload"); // 물리적인 경로
System.out.print("uploadPath: "+uploadPath); // 가상경로에서 upload로 파일 넣어주기(사진)
// 3. 파일 최대크기 설정
int maxSize = 5*1024*1024; // 5M
// 4. 한글 설정
// 5. 파일이름바꾸기 cos.jar안에 들어있음
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy()); 
// p.310 request 정보가 multi에 들어감
// request --> multi 로 바꾸기
galleryBean gb = new galleryBean();
System.out.print("writepro : "+multi.getParameter("content"));
gb.setId(multi.getParameter("id"));
gb.setContent(multi.getParameter("content"));
gb.setTastetype(multi.getParameter("hot"));


Timestamp date = new Timestamp(System.currentTimeMillis());
gb.setDate(date);

// 폴더에 업로드 된 파일이름
String file = multi.getFilesystemName("file");
//BoardBean에 file 추가
gb.setFile(file);

galleryDAO gDAO = new galleryDAO();
gDAO.write(gb);

response.sendRedirect("../center/gallery.jsp");


%>
</body>
</html>