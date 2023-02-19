<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "module.Community" %>
<%@ page import = "module.CommunityDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>COMMUNITY | CAFFEYUNE</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">
	<style>
		* { margin: 0; padding: 0; }
		li { list-sytle: none; }
		a { text-decoration: none; }
	</style>
	<style>
		#board { font-family: 'Noto Sans KR', sans-serif; font-size: 28px; 
				 font-weight: 700; width: 100%; height: 50px; padding-top: 10px; padding-left: 50px; color: #A4A4A4; }
		hr { width: 40%; height: 2px; background: #C1C1C1; }
	</style>
	<!-- section -->
	<style>
		section { width: 100%; height: 650px; padding-top: 10px;  }
		#tableBoard { width: 100%; height: auto; font-family: 'Bebas Neue', cursive; font-family: 'Noto Sans KR', sans-serif; 
				  font-weight: 300; }
		#tableBoard table { width: 80%; margin: 10px auto; text-align: center; }
		#title { text-align: left; padding-left: 10px; }
		
		table thead th:nth-of-type(1) { width: 50px; }
		table thead th:nth-of-type(3) { width: 80px; }
		table thead th:nth-of-type(4) { width: 80px; }
		table {
			border-collapse: collapse;
			text-align: left;
			line-height: 1.5;
			border-top: 1px solid #ccc;
			border-bottom: 1px solid #ccc;
			width: 70%;
			margin: 20px auto;
		}
		table thead th {
			width: 150px;
			padding: 7px;
			font-weight: bold;
			vertical-align: top;
			color: #fff;
			background: #e7708d;
			margin: 20px 10px;
			text-align: center;
		}
	</style>
	<!-- write button -->
	<style>
		#writeWrapper { width: 100%; height: auto; postion: relative; }
		#write{ position: absolute; right: 10%; width: 70px; height: auto; border: 2px solid #C1C1C1; font-family: 'Noto Sans KR', sans-serif;
				border-radius: 15px; padding: 5px; text-align: center; margin-right: 5px; }	
	</style>
	<!-- 페이지 번호 -->
	<style>
		#pageNumberWrapper { width: 100%; height: auto; display: flex; justify-content : center; }
		.pageNumber { width: 30px; height: 24px; background: #fdf3f5; border: 2px solid #ccc; margin: 10px; 
					  display: inline-block; text-align: center; padding-top: 6px; margin: 3px;}
	</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div id = "board">게시판</div>
	<hr>
	<section>
		<div id = "tableBoard">
			<table id="table" border="1px">
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>ID</th>
						<th>날짜</th>
					</tr>
				</thead>
				<%
				CommunityDao dao = CommunityDao.getInstance();
				ArrayList<Community> list = dao.getAllPost();
	
				for (int i = 0; i < list.size(); i++) {
					Community com = list.get(i);
				%>
	
				<tbody>
					<tr>
						<td><%=com.getIndex() %></td>
						<td id="title"><a href = "#"><%=com.getPostTitle() %></a></td>
						<td><%=com.getId() %></td>
						<td><%=com.getWriteDate() %></td>
					</tr>
				<%
				}
				%>
				</tbody>
			</table>
		</div>
		<div id = "pageNumberWrapper">
			<div class = "pageNumber">1</div>
			<div class = "pageNumber">2</div>
		</div>
		<div id = "writeWrapper">
			<div id = "write"><a href = "addPost.jsp">글쓰기</a></div>
		</div>
	</section>

	<%@ include file = "footer.jsp" %>
</body>
</html>