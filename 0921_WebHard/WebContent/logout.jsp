<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//로그아웃을 위해 session에 저장해 두었던 "uvo"를 삭제한다.
	session.removeAttribute("uvo");

	response.sendRedirect("left.jsp");

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