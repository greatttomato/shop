<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "module.Product" %>
<%@ page import = "module.ProductDao" %>  

<%	
	session.removeAttribute("cartList");
	response.sendRedirect("cart.jsp");

%>