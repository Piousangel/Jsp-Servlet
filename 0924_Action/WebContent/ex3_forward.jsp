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
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String age = request.getParameter("age");
	
	//현재 페이지를 정상적으로 호출한다면 위의 3개 파라미터 값이
	//모두 들어오거나 모두 안들어오거나 둘중 하나이다.
	
	//만약 1개라도 들어오지 않았다면 이름과 생년을 입력하도록 합니다.
	if(name == null || year == null || age == null){
%>
	<form action="ex3_forward2.jsp" method ="post">
		<label for="name">이름:</label>
		<input type="text" id="name" name="name"/> <br/>
		
		<label for="year">생년:</label>
		<input type="text" id="year" name="year" /><br/>
		
		<input type="button" id="btn" value="보내기"/>
		<input type="button" id ="btn2" value="다시보내기"/>
	</form>
<% 		
	}else{
%>	
		<h2>
			<%=name %>님은 <%=year %>년 생이므로 <br/>
			만<%=age %>세 입니다.
		</h2>
<%
	}
%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript">

	//jquery시작부분
	$(function(){
		//jquery의 메인함수와 같은 곳!(물론 없어도 되지만, 문법을 지키기 위해서 정의하자!)
		
		$("#btn").click(function(){
			console.log("you clicked a paragraph!");
			document.forms[0].submit()
			
		$("#btn2").click(exe);	
		
		});
		
		function exe(){
			console.log("^^;");
		}
		
	});



	
		
</script>
</body>
</html>



