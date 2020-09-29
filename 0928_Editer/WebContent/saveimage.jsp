<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//에디터에서 보내지는 이미지는 무조건 upload라는 폴더에 저장한다.
	String path = application.getRealPath("/upload");

	MultipartRequest mr = new MultipartRequest(request, path, 
					1024*1024*5, "utf-8",
					new DefaultFileRenamePolicy());
				//이때 전달해 오는 파일이 upload라는 폴더로 저장된다.
				//이제 요청한 곳으로 저장된 파일의 경로를 보내줘야 하기 때문에 정확한 저장된 파일명이 필요합니다.
	
	String f_name = "";
	File f = mr.getFile("img");  //파일이 전달해 올 때 사용될 파라미터 이름입니다 "img"
	
	if(f != null){
		f_name = f.getName(); //저장시 파일명입니다.
	}

// 이쯤에서 서버에 저장된 파일의 경로를 JSON 표기법으로 보냅니다.
// http://www..../.../upload/back/png
//http://localhost:8080/0928_Editer/ex1_form.jsp   ==> request.getContextPath()의 값입니다.
%>
{"img_url" : "<%=request.getContextPath() %>/upload/<%=f_name %>"}
