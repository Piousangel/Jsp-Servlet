<%@page import="java.util.Calendar"%>
<%@page import="mybatis.dao.workDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Calendar date = Calendar.getInstance();
	String reg_date = date.toString();
	
	workDAO.send(title, content, reg_date);
	
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>