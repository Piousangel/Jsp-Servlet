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
		<jsp:include page="ex1_nav.jsp"/>
		<%-- include액션 요소는 포함된 jsp문서가
		컴파일된 결과만 포함시킨다.
		즉, HTML결과만 포함시키기 때문에 그 안에서
		사용된 변수등을 현재 페이지에서 사용할 수 없다. --%>
	</header>
	<article>
		<h1>첫번째 페이지</h1>
	</article>
</body>
</html>