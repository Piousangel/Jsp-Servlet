<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비동기식 통신 연습</h1>
	<article>
		<form>
			<label for="u_id">아이디:</label>
			<input type="text" id="u_id" />
			<br/>
			<input type="button" id="btn" value="보내기"/>
		</form>
	</article>
	
	<h1>동기식 통신 연습</h1>
	<article>
		<form action="ex1_res.jsp" method="post">
			<label for="u_id2">아이디:</label>
			<input type="text" id="u_id2" name="u_id"/>
			<br/>
			<input type="button" id="btn2" value="보내기"/>
		</form>
	</article>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script>
		$(function(){
			//jquery 시작 부분
			$("#btn").click(function(){
				$.ajax({
					url: "ex1_res.jsp", //비동기식 통신을 하기 위한 서버 경로
					type: "post", //통신 방법
					data: "u_id="+ $("#u_id").val(),// 사용자가 입력한 id값을 u_id라는 파라미터에 넣어 보낸다.
					dataType: "json", //결과를 받을 때 json형식으로 받는다.
				}).done(function(data){
					//통신이 성공되었을 때 수행
					alert(data.msg);
				});
			});
		});
	</script>
</body>
</html>








