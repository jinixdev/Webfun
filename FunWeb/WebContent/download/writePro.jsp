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
String uploadPath= request.getRealPath("/upload"); // 물리적인 경로
System.out.print("uploadPath: "+uploadPath); // 가상경로에서 upload로 파일 넣어주기(사진)
// 3. 파일 최대크기 설정
int maxSize = 5*1024*1024; // 5M
// 4. 한글 설정
// 5. 파일이름바꾸기 cos.jar안에 들어있음
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

BoardBean jbb = new BoardBean();
jbb.setId(multi.getParameter("id"));
jbb.setName(multi.getParameter("name"));
jbb.setPass(multi.getParameter("pass"));
jbb.setSubject(multi.getParameter("subject"));
jbb.setContent(multi.getParameter("content"));
jbb.setCategory(multi.getParameter("category"));
String file = multi.getFilesystemName("file");
//BoardBean에 file 추가
jbb.setFile(file);


Timestamp date = new Timestamp(System.currentTimeMillis());
jbb.setDate(date);

BoardDAO jbDAO = new BoardDAO();

jbDAO.write(jbb);

response.sendRedirect("../center/download.jsp");


%>
</body>
</html>