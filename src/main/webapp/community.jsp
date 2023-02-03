<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>COMMUNITY | CAFFEYUNE</title>
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
		section { width: 100%; height: 700px; background: YELLOW; }
		section table { width: 80%; margin: 10px auto; text-align: center; }
		th { paddign: 5px; }
		td { paddign: 5px; }
		#title { text-align: left; background: RED; }
	</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div id = "product_name">게시판</div>
	<hr>
	
	<section>
		<table id = "table" border = "1px">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>ID</th>
					<th>날짜</th>
				</tr>
			 </thead>
			 <tbody>
			 	<tr>
			 		<td>1</td>
			 		<td id = "title">이거봐랑</td>
			 		<td>난나뇽</td>
			 		<td>2023.02.16</td>
			 	</tr>
			 </tbody>
		</table>
	
	</section>
	
	<%@ include file = "footer.jsp" %>
</body>
</html>