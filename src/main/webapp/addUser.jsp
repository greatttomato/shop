<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import = "module.User" %>
<%@ page import = "module.UserDao" %>  

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String birth = request.getParameter("birth");
	
	User user = new User();
	
	user.setU_id(id);
	user.setU_name(name);
	user.setU_pwd(pwd);
	user.setU_phone(phone);
	user.setU_address(address);
	user.setU_birth(birth);
	
	UserDao dao = UserDao.getInstance();
	dao.joinUser(user);	
%>

<script>
	alert("가입 완료");
</script>

<jsp:forward page = "home.jsp" />