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
	<title>CART | CAFFEYUNE </title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<style>
		* { margin: 0; padding: 0; }
		li { list-sytle: none; }
		a { text-decoration: none; }
	</style>
	<style>
		header { width: 100%; height: 90px; position: relative; }
		header>img { position: absolute; left: 50px; top: 25px; }
		header #product_name { position: absolute; left: 90px; top: 15px;
						font-family: 'Bebas Neue', cursive; font-family: 'Noto Sans KR', sans-serif; font-size: 28px; 
						font-weight: bold; width: 100%; height: 30px; color: #A4A4A4; }
		hr { position: absolute; left: 0; top: 45px;
		     width: 40%; height: 2px; background: #C1C1C1; }
		#delete { width: 100%; height: 50px; text-align: right; padding-right: 20px; }
	</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<%
		// getId() : 세션 ID를 되돌리는 메서드. 세션을 가리키는 고유 ID를 String 형태로 변환.
		String cartId = session.getId();
		System.out.println("cartId(session.getId()) : " + cartId);
		// 숫자 포맷 변경
		DecimalFormat dFormat = new DecimalFormat("###,###");
	%>
	<header>
		<img src = "image/cart.png" alt = "cart" height = "25px" >
		<div id = "product_name">&nbsp;장바구니</div>
		<hr>
	</header>
	<section>
		<div id = "delete">
			<a href = "./deleteCart.jsp" class = "btn btn-danger">삭제하기</a>
		</div>
		<table class = "table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartList");
				if (cartlist == null) {
					cartlist = new ArrayList<Product>();
				}
				for (int i=0; i<cartlist.size(); i++) {
					Product product = cartlist.get(i);
					int total = product.getProductPrice()*product.getQuantity();
					sum += total;
			%>
			<tr>
				<td><%=product.getName() %></td>
				<td><%=dFormat.format(product.getProductPrice()) %></td>
				<td><%=product.getQuantity() %></td>
				<td><%=dFormat.format(total) %></td>
				<td><a href = "./removeCart.jsp?id=<%=product.getName() %>" class = "badge badge-danger">삭제</a></td>
			</tr>
			<%
				}
			%>
			<tr>
				<th colspan = "3">총액</th>
				<th colspan = "2"><%=dFormat.format(sum) %></th>
			</tr>
		</table>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>