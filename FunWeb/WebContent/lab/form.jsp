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
     
     
     function map(){
//     	window.name = "checkPro";
    	checkpro=window.open("map.jsp","chkpro", "width=800, height=600, resizable = no, scrollbars = no");
     }
     
     function showrating(value){
    		var show=document.getElementById(value);
    		if(show.style.display=="block"){
    			show.style.display="none";
    		}else{
    			show.style.display="block";
    		}
     }
</script>
<body>
<form action="pro.jsp">
<input name="fruit" type="checkbox" class="fruitValue" value="사과" />사과
<input name="fruit" type="checkbox" class="fruitValue" value="배" />배
<input name="fruit" type="checkbox" class="fruitValue" value="바나나" />바나나

<input type="submit" value="전송"><br>

<input type="button" onclick="showrating('star');" value="star">
<div id="star" style="display:none;">
<span id="star_grade" >
       <img id=star1 onmouseover="show('star',1)" onclick="mark('star',1)" onmouseout="noshow('star',1)" src="../css/pic/star0.png">
       <img id=star2 onmouseover="show('star',2)" onclick="mark('star',2)" onmouseout="noshow('star',2)" src="../css/pic/star0.png">
       <img id=star3 onmouseover="show('star',3)" onclick="mark('star',3)" onmouseout="noshow('star',3)" src="../css/pic/star0.png">
       <img id=star4 onmouseover="show('star',4)" onclick="mark('star',4)" onmouseout="noshow('star',4)" src="../css/pic/star0.png">
       <img id=star5 onmouseover="show('star',5)" onclick="mark('star',5)" onmouseout="noshow('star',5)" src="../css/pic/star0.png">
       <span id="startext">평가하기</span>
</span>
<input type="hidden" id="star">
</div><br>


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
</div><br>

<input type="text" id="placename">
<input type="text" id="placeaddr">
<input type="button" value="dup. check" class="dup" onclick="map()">



</form>
</body>
</html>