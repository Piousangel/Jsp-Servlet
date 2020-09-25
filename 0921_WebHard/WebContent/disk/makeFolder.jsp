<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String dir = request.getParameter("cPath"); 
	String fname = request.getParameter("f_name");
	String c_path = application.getRealPath("/members/" + dir + "/" +fname);
	
	File file = new File(c_path);
	
	file.mkdir();
	
	//response.sendRedirect("myDisk.jsp?dir=" + dir);  //get방식이라 한글이 깨집니다.
%>    
    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="exe()">
	<form action="myDisk.jsp" method="post" name="f1">
		<input type="hidden" name="cPath" value="<%=dir%>"/>
	</form>
	
	<script type="text/javascript">
		function exe(){
			document.f1.submit();  //현재문서에서 f1이라는 이름을 가진 폼을 서버로 보냅니다.
		}
	</script>
</body>
</html>