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
String fruit[] = request.getParameterValues("fruit");
String fruits="";
for(String s:fruit){
fruits += ","+s;
}
String star = request.getParameter("starvalue");


System.out.print(fruits);
System.out.print("star"+star);

%>
</body>
</html>