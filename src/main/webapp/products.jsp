<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>   
<%@ page import = "java.text.DecimalFormat" %> 
<%@ page import = "module.Product" %>
<%@ page import = "module.ProductDao" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFFEYUNE | PRODUCT</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
	* { margin: 0; padding: 0; }
	li { list-sytle: none; }
	a { text-decoration: none; }
</style>
<style>
	#banner { width: 100%; height: 300px; background-image: url("image/girl.jpg");
			  background-repeat: no-repeat; background-position: center; background-size: cover;  margin-bottom: 15px;}
	
	section { width: 100%; padding: 10px; text-align: center; }
	#title { font-family: 'Bebas Neue', cursive; font-size: 24px; color: #C1C1C1; margin-bottom: 25px; }
	section>.product { display: inline-block; width: 250px; height: 320px; text-align: center; }
	section>.product>p { margin-top: 5px; font-family: 'Bebas Neue', cursive;
						 font-family: 'Noto Sans KR', sans-serif;}
	section>.product>p:nth-of-type(1) { font-weight: bold; }
	img:hover { border: 1px solid #C1C1C1; }
	
</style>			 
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div id = "banner"></div>
	<section>
		<p id = "title">─ &nbsp;MD PRODUCT&nbsp; ─</p>
			<%
				ProductDao dao = ProductDao.getInstance();
				ArrayList<Product> list = dao.getAllmenu();
				DecimalFormat dFormat = new DecimalFormat("###,###");
				
				for (int i=0; i<list.size(); i++) {
					Product product = list.get(i);
			%>
				<div class = "product">
					<a href = "product.jsp?id=<%=product.getName() %>">
						<img src = "image/<%=product.getFileName() %>" alt = "product" width = "230px" height = "230px">
					</a>
					<p><%=product.getName() %></p>
					<p><%=dFormat.format(product.getProductPrice()) %></p>
				</div>
			<%
				}
			%>
	</section>
	
	<%@ include file = "footer.jsp" %>
</body>
</html>
