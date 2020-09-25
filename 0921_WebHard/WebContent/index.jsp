<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	String msg = request.getParameter("msg");
 %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<frameset cols="190,*" border="0">
		<frame src="left.jsp" name="left"/>
		<frame src="right.jsp?msg=<%=msg %>" name="right"/>
	</frameset>
</html>
