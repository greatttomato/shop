<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "module.User" %>
<%@ page import = "module.UserDao" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
 
<style>
	* { margin: 0; padding: 0; }
	li { list-sytle: none; }
	a { text-decoration: none; color: black; }
	
	#menu { width: 100%; height: 90px; position: relative; border-bottom: 2px solid black; }
	#menu>span:nth-of-type(1) {position: absolute; left: 20px; top: 20px; font-family: 'Bebas Neue', cursive; 
							 font-size: 45px; }
	#menu>span:nth-of-type(2) {position: absolute; left: 200px; top: 30px; font-family: 'Bebas Neue', cursive; 
							 font-size: 28px; }
	#menu>span:nth-of-type(3) {position: absolute; left: 300px; top: 30px; font-family: 'Bebas Neue', cursive; 
							 font-size: 28px; }
	#upload {position: absolute; left: 370px; top: 30px; font-family: 'Bebas Neue', cursive; 
							 font-size: 28px; }
	#icon {position: absolute; right: 30px; top: 20px; }							 							
</style>
</head>
<body>
	<div id = "menu">
		<span><a href = "home.jsp">CAFFEYUNE</a></span>
		<span><a href = "products.jsp">PRODUCT</a></span>
		<span><a href = "cart.jsp">CART</a></span>
		
		<%
			User user = (User) session.getAttribute("userInfor");
			String icon;
			String url;
			
			if ( user == null) {			// user 객체에 값이 들어가
				icon = "login.png";			// 로그인 아이콘 
				url = "login.jsp";			// 버튼 클릭 시 이동할 화면
			} else {
				icon = "logout.png";
				url = "deleteLogin.jsp";
				System.out.println(user.getU_power() + "," + user.getU_name());
				if (user.getU_power().equals("m")) {
		%>
					<span id = "upload"><a href = "upload.jsp">UPLOAD</a></span>
		<%
				}
			}
		%>
		<span id = "icon"><a href = "<%= url %>"><img src = "image/<%=icon %>" alt = "icon" width = "55px"></a></span>
	</div>
</body>
</html>