<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
</head>
<script>
     var locked =0;
     function show(star){
    	 var i,image,el;
    	 var e = document.getElementById('startext');
    	 var stateMsg;
    	 
    	 for(i=1; i<=star; i++){
    		 image = 'image'+i;
    		 el = document.getElementById(image);
    		 el.src= "../css/pic/star1.png";
    	 }
    	 switch (star){
    	 case 1:
    		 stateMsg ="다신안가고싶어요";
    		 break;
    	 case 2:
    		 stateMsg ="다신안가고싶어요";
    		 break;
    	 case 3:
    		 stateMsg ="다신안가고싶어요";
    		 break;
    	 case 4:
    		 stateMsg ="다신안가고싶어요";
    		 break;
    	 case 5:
    		 stateMsg ="다신안가고싶어요";
    		 break;
    	default :
    		stateMsg = "";
    	 }
    	 e.innerHTML =stateMsg;
     }
     
     function noshow(star){
    	 if(locked)
    		 return;
    	 var i,image,el;
    	 
    	 for(i=1; i<=star; i++){
    		 image = 'image'+i;
    		 el = document.getElementById(image);
    		 el.src= "../css/pic/star0.png";
    	 }
     }
     
     function lock(star){
    	 show(star);
    	 locked =1;
     }
     function mark(star){
    	 if(locked==1){
    		 for(i=1; i<=5; i++){
        		 image = 'image'+i;
        		 el = document.getElementById(image);
        		 el.src= "../css/pic/star0.png";
        	 }
    	 }
    	 
    	 lock(star);
    	 alert("선택 : "+star);
    	 document.getElementById("star").value =star;
     }
     
     
     function map(){
//     	window.name = "checkPro";
    	checkpro=window.open("map.jsp","chkpro", "width=800, height=600, resizable = no, scrollbars = no");
     }
</script>
<body>
<form action="pro.jsp">
<input name="fruit" type="checkbox" class="fruitValue" value="사과" />사과
<input name="fruit" type="checkbox" class="fruitValue" value="배" />배
<input name="fruit" type="checkbox" class="fruitValue" value="바나나" />바나나

<input type="submit" value="전송">


<p id="star_grade">
       <img id=image1 onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="../css/pic/star0.png">
       <img id=image2 onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="../css/pic/star0.png">
       <img id=image3 onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="../css/pic/star0.png">
       <img id=image4 onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="../css/pic/star0.png">
       <img id=image5 onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="../css/pic/star0.png">
       <span id="startext">평가하기</span>
</p>
<input type="hidden" id="star">

<input type="text" id="placename">
<input type="text" id="placeaddr">
<input type="button" value="dup. check" class="dup" onclick="map()">



</form>
</body>
</html>