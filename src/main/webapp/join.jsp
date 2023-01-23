<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JOIN | CAFFEYUNE</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<style>
		* { margin: 0; padding: 0; }
		li { list-sytle: none; }
		a { text-decoration: none; }
	</style>
	<style>
		#banner { width: 100%; height: 200px; background-image: url("image/cafe.jpg");
				  background-repeat: no-repeat; background-position: center; background-size: cover; }
		#login_title { width: 100%; height: 50px; text-align: center; font-family: 'Noto Sans KR', sans-serif; font-size: 28px; 
					   font-weight: bold; color: #A4A4A4; margin-top: 30px; margin-bottom: 30px; }
	</style>
	<!-- section -->
	<style>
		section { width: 100%; height: 500px; position: relative; }
		form { position: absolute; left: 20%; top: 0; }
		/* 제품 정보 입력 */
		.row { margin-bottom: 30px; margin-left: 50px; font-size: 18px; }
		.row>.col1 { float: left; width: 120px; }
		.row>.col2>input { width: 350px; height: 25px; border-radius: 5px; padding: 5px; border: 1px solid #A4A4A4;}
		.row:nth-of-type(6) { margin-bottom: 10px; }
		
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
	<div id = "banner"></div>
	<div id = "login_title">회 원 가 입</div>

	<section>
		<form name = "user_infor" action = "addUser.jsp" method = "post">
			 <div class = "row">
					<label class = "col1">ID</label>
					<div class = "col2">
						<input type = "text" id = "id" name = "id">
					</div>
				</div>
				<div class = "row">
					<label class = "col1">이름</label>
					<div class = "col2">
						<input type = "text" id = "name" name = "name">
					</div>
				</div>
				<div class = "row">
					<label class = "col1">비밀번호</label>
					<div class = "col2">
						<input type = "text" id = "pwd" name = "pwd">
					</div>
				</div>
				<div class = "row">
					<label class = "col1">전화번호</label>
					<div class = "col2">
						<input type = "text" id = "phone" name = "phone">
					</div>
				</div>
				<div class = "row">
					<label class = "col1">주소</label>
					<div class = "col2">
						<input type = "text" id = "address" name = "address">
					</div>
				</div>
				<div class = "row">
					<label class = "col1">생일</label>
					<div class = "col2">
						<input type = "text" id = "birth" name = "birth" placeholder = "ex) 20230101">
					</div>
				</div>
				
				<div id = "buttons">
					<input type = "submit" value = "가입" >
					<input type = "button" value = "취소" onClick = "location.href = 'home.jsp'" >
				</div>
			</form>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>