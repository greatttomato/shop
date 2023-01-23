<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>   
<%@ page import = "module.Product" %>
<%@ page import = "module.ProductDao" %>      
<%
	String name = request.getParameter("id");
	// 저장된 값이 없을 때
	if (name == null || name.trim().equals("")) {
		response.sendRedirect("product.jsp");
		return;
	}
	
	ProductDao dao = ProductDao.getInstance();
	Product product = dao.getProductOne(name);
	// 삭제할 제품 이름이 존재하지 않을 때
	if (product == null)
		response.sendRedirect("exceptionNoProduct.jsp");
	
	ArrayList<Product> cartlist = (ArrayList<Product>) session.getAttribute("cartList");
	Product productCheck = new Product();
	
	for(int i=0; i<cartlist.size(); i++) {
		productCheck = cartlist.get(i);
		// 삭제하려는 제품과 이름이 동일하다면
		if (productCheck.getName().equals(name)) {
			// 리스트에서 삭제
			cartlist.remove(productCheck);
		}
	}

	response.sendRedirect("cart.jsp");
%>