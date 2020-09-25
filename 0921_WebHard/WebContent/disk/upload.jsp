<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dir = (String)session.getAttribute("cPath");
	//request.setCharacterEncoding("utf-8");

	//String path = application.getRealPath("/members/test1");
	String path = application.getRealPath("/members/"+dir);

	MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*5, 
				"utf-8", new DefaultFileRenamePolicy());
	//String dir = mr.getParameter("dir");
	//만약!
	// 첨부된 파일의 이름을 DB에 저장해야 한다면 여기서 저장된 파일명을 알아내야 한다.
	File f = mr.getFile("upload");//첨부된 파일의 정보
	String new_name = f.getName();//현재 파일명
	
	//첨부파일이 저장될 때 이름이 변경될 수 있으며, 원래 이름을 알아낸다.
	String ori_name = mr.getOriginalFileName("upload");
	
	if(f != null){ //첨부여부 확인
		System.out.println("현재파일명:"+new_name);
		System.out.println("변경전 파일명:"+ori_name);
		
	}
	System.out.println("dir:"+dir);
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
	
	<script>
		function exe(){
			document.f1.submit(); //현재문서에서 f1이라는 이름을 가진 폼을 서버로 보낸다.
		}
	</script>
</body>
</html>