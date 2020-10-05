<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css"> 
</head>
<body>
	<header>
		<%@ include file="ex1_nav.jsp" %>
		<%-- include지시자는 포함된 jsp문서이 내용을 포함하여
		같이 한번에 컴파일을 하기 때문에 변수를 사용할 수 있다. --%>
	</header>
	<article>
		<h1>include지시자 페이지<%=title %></h1>
	</article>
</body>
</html>