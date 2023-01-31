<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>  
<%@ page import = "module.Product" %>
<%@ page import = "module.ProductDao" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %> 

<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = "/Users/yunjin/Desktop/code/web/Mall-master/src/main/webapp/image";
	String encType = "utf-8";		  //인코딩 타입
	int maxSize = 5*1024*1024;		  //최대 업로드될 파일의 크기 5Mb
	
	// 파일 업로드를 위한 객체 생성
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType);
	
	String name = multi.getParameter("name");
	String price = multi.getParameter("price");
	String category = multi.getParameter("category");
	String manufacturer = multi.getParameter("manufacturer");
	String seller = multi.getParameter("seller");
	String image = multi.getFilesystemName("image");
	System.out.println(image);
	Integer p_price;
	
	if (price.isEmpty())
		p_price = 0;
	else
		p_price = Integer.valueOf(price);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	ProductDao dao = ProductDao.getInstance();
	Product product = new Product();
	
	product.setName(name);
	product.setProductPrice(p_price);
	product.setCategory(category);
	product.setManu(manufacturer);
	product.setSeller(seller);
	product.setFileName(image);
	
	dao.addProduct(product);
	
	response.sendRedirect("products.jsp");
%>