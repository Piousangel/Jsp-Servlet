<%@page import="mybatis.dao.workDAO"%>
<%@page import="mybatis.vo.workVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	
	//workDAO를 통해 로그인을 검증한다.
	workVO vo = workDAO.login(u_id, u_pw);
	
	//vo가 null이 아니라면 아이디와 비밀번호를 잘 입력한 경우이다. 그런데 null이면 아이디 또는 비밀번호가 다른 경우입니다.
	if(vo != null){
		session.setAttribute("uvo", vo);
		//강제 페이지 이동
	}
	
	response.sendRedirect("left.jsp");
%>
