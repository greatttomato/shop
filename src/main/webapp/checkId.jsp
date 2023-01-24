<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>   
<%@ page import = "module.User" %>
<%@ page import = "module.UserDao" %> 

<%
	request.setCharacterEncoding("UTF-8");

	// 로그인 받아오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	System.out.println("id = " + id + ", pwd = " + pwd);
	
	// 값 공백일 때
	if (id == null || id.trim().equals("") || pwd == null || pwd.trim().equals("") ) {
		response.sendRedirect("login.jsp");
		return;
	}
	
	// 인스턴스 생성 및 아이디에 해당하는 이름, 비밀번호 받아오기
	UserDao dao = UserDao.getInstance();
	User user = dao.selectOne(id);
	
	String checkId = user.getU_id();
	String checkPwd = user.getU_pwd();
	System.out.println("checkId = " + checkId + ", checkPwd = " + checkPwd);
	
	if (id.equals(checkId) && pwd.equals(checkPwd)) {
		session.setAttribute("userInfor", user);
		response.sendRedirect("home.jsp");
	} else {
		response.sendRedirect("loginFail.jsp");
	}
%>