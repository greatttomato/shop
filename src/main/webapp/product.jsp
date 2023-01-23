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
<title>CAFFEYUNE | INFORMATION</title>
<script type = "text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addItem.submit();
		} else {
			document.addItem.reset();
		}
	}
</script>
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
	article { width: 100%; height: 450px; position: relative; }
	article>#image { width: 430px; height: 430px; position: absolute; left: 30px; top: 20px; }
	
	/* 상품 설명 */
	article>#product_menu { position: absolute; left: 490px; top: 100px; font-size: 18px; font-weight: bold;
							font-family: 'Bebas Neue', cursive; font-family: 'Noto Sans KR', sans-serif;}
	article>#product_menu>p { width: 100px; height: 50px; }
	article>#product_result { position: absolute; left: 590px; top: 100px; 
							  font-family: 'Bebas Neue', cursive; font-family: 'Noto Sans KR', sans-serif;}
	article>#product_result>p { height: 50px; }
	
	/* 버튼 */
	#buttons { position: absolute; left: 590px; top: 330px; }
	#buttons>form>div { float: left; width: 70px; height: auto; border: 2px solid #C1C1C1; font-family: 'Noto Sans KR', sans-serif;
						border-radius: 15px; padding: 5px; text-align: center; margin-right: 5px; }	
						
</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<%
		String name = request.getParameter("id");
		System.out.println(name);
		ProductDao dao = ProductDao.getInstance();
		Product product = dao.getProductOne(name);
		
		DecimalFormat dFormat = new DecimalFormat("###,###");
	%>
	<div id = "product_name"><%=product.getName() %></div>
	<hr>
	<article>
		<div id = "image">
			<img src = "image/<%=product.getFileName()%>" alt = "picture" width = "400px" height = "400px">
		</div>
		<div id = "product_menu">
			<p>가격
			<p>분류
			<p>제조사
			<p>판매사
		</div>
		<div id = "product_result">
			<p><%=dFormat.format(product.getProductPrice()) %> 원
			<p><%=product.getCategory() %>
			<p><%=product.getManu() %>
			<p><%=product.getSeller() %>
		</div>
		<div id = "buttons">
			<form name = "addItem" action = "./addCart.jsp?id=<%=product.getName() %>" method = "post">
				<div><a href = "#" onClick = "addToCart()">구매하기</a></div>
				<div><a href = "./cart.jsp">장바구니</a></div>
				<div><a href = "./products.jsp">돌아가기</a></div>
			</form>
		</div>
	</article>
	<%@ include file = "footer.jsp" %>
</body>
</html>