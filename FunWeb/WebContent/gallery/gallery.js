
// content delete show and none
function showhide(){
	var obj=document.getElementById("showtable");
	if(obj.style.display=="none"){
		obj.style.display="block";
	}else{
		obj.style.display="none";
	}
}

// content update value call
function commentUpdate(id,comment,p_num,r_num){
	var commenttable = document.getElementById("commenttable");
	var updatetable=document.getElementById("updatetable");
	document.getElementById("comment_id").value=id;
	document.getElementById("comment").value=comment;
	document.getElementById("p_num").value=p_num;
	document.getElementById("r_num").value=r_num;
	
	if(updatetable.style.display=="none"){
		updatetable.style.display="block";
		commenttable.style.display="none";
		document.getElementByName("content").focus();
	}else{
		updatetable.style.display="none";
		commenttable.style.display="block";
		document.getElementByName("comment").focus();
	}
}






//comment update code show and none
function hide(){
	var update=document.getElementById("updatetable");
	var commenttable = document.getElementById("commenttable");
	if(update.style.display=="block"){
		update.style.display="none";
		document.getElementByName("comment").focus();
		commenttable.style.display="block";
	}
}

//comment delete code
function commentDelete(){
	var p_num =document.getElementById("p_num").value;
	var r_num =document.getElementById("r_num").value;
	location.href="../comment/deletePro.jsp?p_num="+p_num;
}

//foodtype ???
//function checked(foodtype){
//	var foodtype =foodtype.split(',');
//	alert(foodtype);
//	
//}

// =======================================================star rating start

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
	 document.getElementById("starValue").value =star;
}

//=======================================================star rating end

//위치추가
function map(){
	window.open("map.jsp","chkpro", "width=800, height=600, resizable = no, scrollbars = no");
 }

// ------------------------------------comment


