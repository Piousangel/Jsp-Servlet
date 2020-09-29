<%@page import="mybatis.dao.workDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  //요청시 한글처리
	request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="vo" class="mybatis.vo.workVO" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
<%
	workDAO.add(vo);// 테이블 저장!
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