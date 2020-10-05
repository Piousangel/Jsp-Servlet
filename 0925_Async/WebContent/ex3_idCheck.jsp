<%@page import="mybatis.dao.EditorDAO"%>
<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("m_id");

	MemVO vo = EditorDAO.searchId(id);
	
	//vo가 null이면 사용자가 보낸 id는 사용가능한 id다.
	if(vo == null){
%>
	{"res":"사용가능", "status":"1"}
<%		
	}else{
		//사용할 수 없는 id
%>
	{"res":"사용불가능", "status":"0"}
<%		
	}
%>    
