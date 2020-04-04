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
gb.setName(multi.getParameter("name"));
gb.setContent(multi.getParameter("content"));
gb.setPlacename(multi.getParameter("placename"));
gb.setPlaceaddr(multi.getParameter("placeaddr"));


// 폴더에 업로드 된 파일이름
String file = multi.getFilesystemName("file");
//BoardBean에 file 추가
gb.setFile(file);

// eatstyle
String eatstyles[] = multi.getParameterValues("eatstyle");
 
String eatstyle = String.join(",",eatstyles);

// String eatstyle="";
// for(String s:eatstyles){
// // 	eatstyle += s+",";
// 	String.join(",",eatstyles);
// }

System.out.println("eatstyle : "+eatstyle);
gb.setEattype(eatstyle);

String star = multi.getParameter("starValue");
System.out.print("starValue : "+star);
gb.setStar(star);








galleryDAO gDAO = new galleryDAO();
gDAO.updateBoard(num, gb); 

response.sendRedirect("../center/gallery.jsp?num="+num);

%>
</body>
</html>