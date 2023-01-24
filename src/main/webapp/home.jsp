<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %> 
<%@ page import = "java.util.ArrayList" %>    
<%@ page import = "module.NewMenu" %>
<%@ page import = "module.NewMenuDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME | CAFFEYUNE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
<style>
	* { margin: 0; padding: 0; }
	li { list-sytle: none; }
	a { text-decoration: none; }
</style>

<style>
	#banner { width: 100%; height: 300px; background-image: url("image/image.jpg");
			  background-repeat: no-repeat; background-position: center; background-size: cover; }
	#greeting { text-align: right; padding: 10px; }
	#new { width: 100%; height: 400px; padding: 10px; text-align: center; }
	#new>p { font-family: 'Bebas Neue', cursive; font-size: 24px; color: #C1C1C1; margin-bottom: 10px; }
</style>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div id = "banner"></div>
	<div id = "greeting">
		<span>Welcome at</span>
		<%
			Date day = new java.util.Date();
			String am_pm;
			String min;
			int h = day.getHours();
			if (h/12 == 0) 
				am_pm = "am";
			else {
				am_pm = "pm";
				if (h == 12)
					h = 12;
				else
					h = h-12;
			}
			int m = day.getMinutes();
			if (m < 10)
				min = "0" + Integer.toString(m);
			else
				min = Integer.toString(m);
			int s = day.getSeconds();
		%>
		<span><%= am_pm %> <%=h %> : <%=min %> : <%=s %></span>
	</div>
	<div id = "new">
		<p>─ &nbsp;NEW&nbsp; ─</p>
		<%
			NewMenuDao dao = NewMenuDao.getInstance();
			ArrayList<NewMenu> list = dao.getAllmenu();
			for (int i=0; i<list.size(); i++) {
				NewMenu nm = list.get(i);
		%>
			<img src = "image/<%=nm.getMenuId() %>" alt = "cake" width = "250px" height = "250px">
		<%
			}
		%>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>