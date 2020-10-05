<%@page import="mybatis.dao.EditorDAO"%>
<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디가 한글이 없으므로 요청시 한글처리 생략!
	//u_id라는 파라미터 받기
	String u_id = request.getParameter("u_id");

	//받은 아이디를 인자로 전달하여 member_t에 존재하는지를 알아보자!
	MemVO vo = EditorDAO.searchId(u_id);
	//vo가 null이면 등록되지 않은 아이디다.
	
	if(vo == null){
%>
	{"msg":"등록되지 않은 ID"}
<%		
	}else{
%>
	{"msg":"이미 등록된 ID"}
<%		
	}
%>    
