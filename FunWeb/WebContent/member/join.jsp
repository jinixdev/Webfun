<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 <script type="text/javascript">

 function submitCheck(){
		if(document.getElementById("id").value==null){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false; //
		}
		
		if(document.getElementById("pass").value==""){
			alert("패스워드를 입력하세요");
			document.fr.pass.focus();
			
			return false;
		}
		
		if(document.getElementById("name").value==""){
			alert("이름을 입력하세요");
			document.fr.name.focus();
			
			return false;
		}

		
		
		if(document.getElementById("idDuplication").value=="idUncheck"){
			alert("아이디 중복체크해주세요.");
			document.fr.id.focus();
			return false;
		}
		
		if(document.getElementById("passDuplication").value=="passUncheck"){
			alert("비밀번호 중복체크해주세요.");
			document.fr.pass.focus();
			return false;
		}
		if(document.getElementById("emailDuplication").value=="emailUncheck"){
			alert("이메일 중복체크해주세요.");
			document.fr.email.focus();
			return false;
		}
		
		
		
		
		
 }//submitCheck
 
 function retype(){
	 var pass =document.getElementById("pass").value;
	 var pass2=document.getElementById("pass2").value;
	 var email =document.getElementById("email").value;
	 var email2=document.getElementById("email2").value;
	 
	 document.getElementById("passcheck").innerHTML="";
	 if(pass.length>3){
		 if(pass!="" && pass2!=""){
				document.getElementById("passcheck").innerHTML="";
				 if(pass==pass2){
					 document.getElementById("passDuplication").value ="check";
			 		document.getElementById("passsame").innerHTML="<font color=green>비밀번호가 일치합니다.</font>";
			 	}else{
					document.getElementById("passsame").innerHTML="<font color=red>비밀번호가 일치하지 않습니다.</font>";
					document.getElementById("passDuplication").value ="passUncheck";
		 		}
			 }
	 }else{
		 document.getElementById("passcheck").innerHTML="<font color=red>비밀번호를 4자이상 입력해 주십시오.</font>";
		 document.getElementById("passDuplication").value ="passUncheck";
	 }
	 
	
		
	 document.getElementById("emailsame").innerHTML="";
	 
	 if(email!="" && email2!=""){
		 
	 	if(email==email2){
	 		document.getElementById("emailDuplication").value ="check";
		 document.getElementById("emailsame").innerHTML="<font color=green>일치합니다.</font>";
		 }else{
		 document.getElementById("emailsame").innerHTML="<font color=red>이메일이 일치하지 않습니다.</font>";
		 document.getElementById("emailDuplication").value ="emailUncheck";
		 }
	 }
	 


 }//retype
 
 var checkpro;
 
 function userDupCheck(){
	 
	 var popupWidth = 400;
	 var popupHeight = 200;

	 var popupX = (window.screen.width / 2) - (popupWidth / 2);
	 // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

	 var popupY= (window.screen.height / 2) - (popupHeight / 2);
	 // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	 
	 var id = document.fr.id.value;
	 if(id!=null&&id!==""){
// 	window.name = "checkPro";
	window.open("checkPro.jsp?id="+id,"중복확인창",'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY, "resizable = no, scrollbars = no");
	
	 }else{
		 alert("중복확인 할 아이디를 입력해주십시오.");
	 }
	
 }
 
 
 function iduncheck(){
	 document.getElementById("idDuplication").value ="idUncheck";
 }
 


</script>
 
</head>
<body>

<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->

<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/info_sub_menu.jsp"></jsp:include>
<!-- 왼쪽메뉴 -->

<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" name="fr" method="post" onsubmit="return submitCheck()">
<!-- form태그에서만 post -->
<fieldset>
<legend>Basic Info</legend>
<label>*User ID</label>
<input type="text" name="id" class="id" id="id" onkeydown="iduncheck()">
<input type="button" value="dup. check" class="dup" onclick="userDupCheck()"><br>
<input type="hidden" name="idDuplication" id="idDuplication" value="idUncheck" ><br>


<label>*Password</label>
<input type="password" id="pass" name="pass" onkeyup="retype()"><span id="passcheck"></span><br>

<label>Retype Password</label>
<input type="password" id="pass2" name="pass2" onkeyup="retype()"> <span id="passsame"></span>
<input type="hidden"  id="passDuplication" value="passUncheck" ><br>
<label>*Name</label>
<input type="text" id="name" name="name"><br>
<label>E-Mail</label>
<input type="email" id="email" name="email" onkeyup="retype()"><br>
<label>Retype E-Mail</label>
<input type="email" id="email2" name="email2" onkeyup="retype()"> <span id="emailsame"></span>
<input type="hidden"  id="emailDuplication" value="emailUncheck" ><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" id="postcode" placeholder="우편번호" name="postcode">
<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
<label></label><input type="text" id="address" placeholder="주소" style="width:300px;" name="address"><br>
<label></label><input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress">
<input type="text" id="extraAddress" placeholder="참고항목" name="extraAddress"><br>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>



</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>

</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
<html>