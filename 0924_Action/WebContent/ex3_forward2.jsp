<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String year = request.getParameter("year");
	
	if(name == null || year == null){
		//강제 페이지 이동
		
		//response.sendRedirect("ex3_forward.jsp");
		//request와 response를 새로만들어서 이동합니다.
%>
	<jsp:forward page="ex3_forward.jsp"/>
<%			
	}else{
		//name과 year가 들어온 상태입니다.
		//나이 구하기 (현재 년도를 구한다.)
		Calendar now = Calendar.getInstance();
		
		int cYear = now.get(Calendar.YEAR); //2020
		int bYear = Integer.parseInt(year);
		int age = cYear-bYear;  //나이
		
		//바로 앞 페이지에서 전달된 파라미터  nameㅛㄷㅁㄱfmf 
		//담은 request가 그대로 유지되면서 age가 추가되어
		//ex3_forward로 다시 유지됩니다.
		
%>
	<jsp:forward page="ex3_forward.jsp">
		<jsp:param value="<%=age %>" name="age"/>
	</jsp:forward>
<%

	}
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