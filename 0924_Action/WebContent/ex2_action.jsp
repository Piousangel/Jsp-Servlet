<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="pm.vo.DataVO" />
<%-- DataVO vo = new DataVO(); --%>
<%-- 
<jsp:setProperty property="m_id" name="vo" param="m_id"/>
<jsp:setProperty property="m_name" name="vo" />
--%>
<jsp:setProperty property="*" name="vo"/>

	<h1><%=vo.getM_id() %>, <%=vo.getM_name() %></h1>
	<h2><%=vo.getPhone()[0] %>-<%=vo.getPhone()[1] %>-<%=vo.getPhone()[2] %></h2>
	<h2><%=vo.getAge()+1 %></h2>
</body>
</html>





