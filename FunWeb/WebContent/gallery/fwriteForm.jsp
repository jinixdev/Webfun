<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<script type="text/javascript">
var locked =0;
function show(image1,star){
	 var i,image,el;
	 var e = document.getElementById(image1+'text');
	 var stateMsg;
	 
	 for(i=1; i<=star; i++){
		 image = image1+i;
		 el = document.getElementById(image);
		 el.src= "../css/pic/"+image1+"1.png";
	 }
	 switch (star){
	 case 1:
		 stateMsg ="1";
		 break;
	 case 2:
		 stateMsg ="2";
		 break;
	 case 3:
		 stateMsg ="3";
		 break;
	 case 4:
		 stateMsg ="4";
		 break;
	 case 5:
		 stateMsg ="5";
		 break;
	default :
		stateMsg = "";
	 }
	 e.innerHTML =stateMsg;
}

function noshow(image1,star){
	 if(locked)
		 return;
	 var i,image,el;
	 
	 for(i=1; i<=star; i++){
		 image = image1+i;
		 el = document.getElementById(image);
		 el.src= "../css/pic/"+image1+"0.png";
	 }
}

function lock(image1,star){
	 show(image1,star);
	 locked =1;
}
function mark(image1,star){
	 if(locked==1){
		 for(i=1; i<=5; i++){
   		 image = image1+i;
   		 el = document.getElementById(image);
   		 el.src= "../css/pic/"+image1+"0.png";
   	 }
	 }
	 
	 lock(image1,star);
	 alert("선택 : "+star);
	 document.getElementById("star").value =star;
}

function showrating(value){
	var show=document.getElementById(value);
	if(show.style.display=="block"){
		show.style.display="none";
	}else{
		show.style.display="block";
	}
}

function submitCheck(){
	if(document.getElementById("file").value==""||document.getElementById("file").value==null){
		alert("이미지를 등록해주세요");
		document.getElementById("file").focus();
		return false; //
	}

}
</script>
</head>
<body>
<%
String id = (String)session.getAttribute("id"); 
%>
<%if(id==null){%> 
 <script type="text/javascript"> 
 alert("글쓰기와 댓글기능은 회원만 이용가능합니다.");
 location.href="../member/login.jsp";
 </script> 
 <%} %> 

<%	MemberDAO jmDAO = new MemberDAO();
	MemberBean jmb = jmDAO.getMember(id);
	System.out.println("jmb.getId() : " +jmb.getId());
	// 첨부파일 파일 업로드
	// 1. 서버안에 폴더 만들어서 파일을 넣고 // 파일이름 디비에 저장
	// 2. 파일을 DB에 저장
	// 
%>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data" onsubmit="return submitCheck()">
<table border="1">
<tr><td colspan="2">가게이름</td></tr>
<tr><td colspan="2">주소</td></tr>
<tr><td colspan="2"><input type="file" name="file" id="file"></td></tr>
<tr><td><%=jmb.getName()%></td></tr>
<tr><td colspan="2"><textarea name="content" rows="10" cols="20"></textarea></td></tr>
<tr><td>tastetype</td><td>
<input type="button" onclick="showrating('hot');" value="hot">
<div id="hot" style="display:none;">
<p id="hot_grade" >
       <img id=hot1 onmouseover="show('hot',1)" onclick="mark('hot',1)" onmouseout="noshow('hot',1)" src="../css/pic/hot0.png">
       <img id=hot2 onmouseover="show('hot',2)" onclick="mark('hot',2)" onmouseout="noshow('hot',2)" src="../css/pic/hot0.png">
       <img id=hot3 onmouseover="show('hot',3)" onclick="mark('hot',3)" onmouseout="noshow('hot',3)" src="../css/pic/hot0.png">
       <img id=hot4 onmouseover="show('hot',4)" onclick="mark('hot',4)" onmouseout="noshow('hot',4)" src="../css/pic/hot0.png">
       <img id=hot5 onmouseover="show('hot',5)" onclick="mark('hot',5)" onmouseout="noshow('hot',5)" src="../css/pic/hot0.png">
       <span id="hottext">평가하기</span>
</p>
<input type="hidden" id="hot">
</div>


</td></tr>
<tr><td>foodtype</td>
<td><input name="foodstyle" type="checkbox" class="foodValue" value="한식" />한식
<input name="foodstyle" type="checkbox" class="foodValue" value="중식" />중식
<input name="foodstyle" type="checkbox" class="foodValue" value="양식" />양식
<input name="foodstyle" type="checkbox" class="foodValue" value="일식" />일식
<input name="foodstyle" type="text" class="foodValue" value="" /></td>
</tr>
<tr><td><input type="submit" value="확인"></td></tr>
<tr><td><input type="hidden" name="id" value="<%=jmb.getId()%>"></td></tr>
</table>

</form>
<%-- <%}%> --%>
</body>
</html>















