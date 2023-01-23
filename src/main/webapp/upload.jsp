<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UPLOAD | CAFFEYUNE</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<style>
		* { margin: 0; padding: 0; }
		li { list-sytle: none; }
		a { text-decoration: none; }
	</style>
	<style>
		#product_name { font-family: 'Bebas Neue', cursive; font-family: 'Noto Sans KR', sans-serif; font-size: 28px; 
						font-weight: bold; width: 100%; height: 30px; padding: 15px 50px; color: #A4A4A4; }
		hr { width: 40%; height: 2px; background: #C1C1C1; }
	</style>
	<!-- section -->
	<style>
		section { width: 70%; margin: 20px auto; height: 500px; font-family: 'Bebas Neue', cursive; font-family: 'Noto Sans KR', sans-serif; }
		/* 제품 정보 입력 */
		.row { margin-top: 30px; margin-left: 50px; font-weight: bold; font-size: 18px; }
		.row>.col1 { float: left; width: 120px; }
		.row>.col2>input { width: 350px; height: 25px; border-radius: 5px; padding: 5px; }
		#image { border: 2px solid black; }
		
		/* 버튼 */
		#buttons { position: relative; width: 550px; height: 100px; }
		#buttons>input { position: absolute; width: 70px; height: auto; border: 2px solid #C1C1C1; font-family: 'Noto Sans KR', sans-serif;
						border-radius: 15px; padding: 5px; text-align: center; margin-right: 5px; }
		#buttons>input:nth-of-type(1) { right: 93px; top: 30px; }
		#buttons>input:nth-of-type(2) { right: 13px; top: 30px; }						
	</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div id = "product_name">상품 등록</div>
	<hr>
	<section>
		<!-- multipart/form-data: 모든 문자를 인코딩하지 않음을 명시함. 이 방식은 <form> 요소가 파일이나 이미지를 서버로 전송할 때 주로 사용함. -->
		<form name = "newProduct" action = "./processAddProduct.jsp" method = "post" enctype = "multipart/form-data">
			<div class = "row">
				<label class = "col1">상품 이름</label>
				<div class = "col2">
					<input type = "text" id = "name" name = "name">
				</div>
			</div>
			<div class = "row">
				<label class = "col1">상품 가격</label>
				<div class = "col2">
					<input type = "text" id = "price" name = "price">
				</div>
			</div>
			<div class = "row">
				<label class = "col1">분류</label>
				<div class = "col2">
					<input type = "text" id = "category" name = "category">
				</div>
			</div>
			<div class = "row">
				<label class = "col1">제조사</label>
				<div class = "col2">
					<input type = "text" id = "manufacturer" name = "manufacturer">
				</div>
			</div>
			<div class = "row">
				<label class = "col1">판매사</label>
				<div class = "col2">
					<input type = "text" id = "seller" name = "seller">
				</div>
			</div>
			<div class = "row">
				<label class = "col1">상품 이미지</label>
				<div class = "col2">
					<input type = "file" id = "image" name = "image">
				</div>
			</div>
			
			<div id = "buttons">
				<input type = "submit" value = "등록" >
				<input type = "button" value = "취소" onClick = "location.href = 'home.jsp'" >
			</div>
		</form>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>