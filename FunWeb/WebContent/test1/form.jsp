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
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
</script>
<body>
<form action="pro.jsp">
<input name="fruit" type="checkbox" class="fruitValue" value="사과" />사과
<input name="fruit" type="checkbox" class="fruitValue" value="배" />배
<input name="fruit" type="checkbox" class="fruitValue" value="바나나" />바나나

<input type="submit" value="전송">

</form>
<p id="star_grade">
        <a href="#" class="on">★</a>
        <a href="#" class="on">★</a>
        <a href="#" >★</a>
        <a href="#" >★</a>
        <a href="#" >★</a>
</p>
</body>
</html>