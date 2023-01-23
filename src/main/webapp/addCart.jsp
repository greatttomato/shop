<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>   
<%@ page import = "module.Product" %>
<%@ page import = "module.ProductDao" %>     

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("id");
	
	// name 값이 없을 경우
	if (name == null || name.trim().equals("")) {
		response.sendRedirect("poducts.jsp");
		return;
	}
	
	ProductDao dao = ProductDao.getInstance();
	Product product = dao.getProductOne(name);
	
	// 존재하지 않는 상품일 때
	if (product == null)
		response.sendRedirect("exceptionNoProductId.jsp");
	
	// 장바구니에 담을 상품 정보 가져오기
	ArrayList<Product> goodsList = dao.getAllmenu();
	Product goods = new Product();
	for (int i=0; i<goodsList.size(); i++) {
		goods = goodsList.get(i);
		// 장바구니에 넣으려는 제품 차례가 됐을 때 반복문 탈출
		if (goods.getName().equals(name))
			break;
	}
	
	// 'cartList'라는 이름으로 session에 저장하기
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartList");
	if (list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("cartList", list);
	}
	
	// 제품 수량
	int cnt = 0;
	
	Product productCheck = new Product();
	for (int i=0; i<list.size(); i++) {
		productCheck = list.get(i);
		
		if (productCheck.getName().equals(name)) {
			cnt++;
			int orderQuantity = productCheck.getQuantity() + 1;
			productCheck.setQuantity(orderQuantity);
		}
	}
	
	if (cnt == 0) {
		goods.setQuantity(1);
		list.add(goods);
	}
%>
	<jsp:forward page= "product.jsp" />