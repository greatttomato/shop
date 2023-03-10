<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LOGIN | CAFFEYUNE</title>
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
		section { width: 100%; height: 500px; }
		section>div { position: relative; float: left; width: 50%; height: 300px; }
		
		/* Login */
		#box_login>span { position: absolute; left: 45%; top: 0; font-size: 22px; }
		#box_login input { width: 70%; border: 1px solid #A4A4A4; border-radius: 10px; font-size: 18px; padding: 10px; font-family: 'Noto Sans KR', sans-serif; }
		#box_login input:nth-of-type(1) { position: absolute; left: 15%; top: 50px; }
		#box_login input:nth-of-type(2) { position: absolute; left: 15%; top: 110px; }
		.button { position: absolute; left: 15%; top: 185px; width: 30%; font-size: 18px; padding: 10px; border-radius: 10px; 
				  font-family: 'Noto Sans KR', sans-serif; border: 2px solid #C1C1C1; background: WHITE; }
		#warning { position: absolute; left: 0; top: 160px; width: 100%; text-align: center; font-size: 14px;
				   font-family: 'Noto Sans KR', sans-serif; color: RED; font-weight: bold;}
		/* Join */
		#box_join>span { position: absolute; left: 45%; top: 0; font-size: 22px; }
		#text_field { position: absolute; left: 15%; top: 50px; font-size: 18px; font-family: 'Noto Sans KR', sans-serif; 
					  width: 70%; text-align: center; }
		
	</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div id = "banner"></div>
	<div id = "login_title">??? ??? ???</div>
	<section>
		<div id = "box_login">
			<span>Login</span>
			<form name = "login_information" action = "chekId.jsp" method = "post">
				<div>
					<input type = "text" name = "id" placeholder = "?????????"><br>
					<input type = "password" name = "pwd" placeholder = "????????????">
				</div>
				<div id = "warning">ID ?????? ??????????????? ??? ??? ?????????????????????.</div>
				<button type = "submit" class = "button" >?????????</button>
			</form>
		</div>
		<div id = "box_join">
			<span>Join</span>
			<div id = "text_field">???????????? ?????? ??? ????????? ???????????? ??? ?????? ????????? ??????????????????! ????</div>
			<button type = "button" onClick = "location.href = 'join.jsp'" class = "button" >????????????</button>
		</div>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>