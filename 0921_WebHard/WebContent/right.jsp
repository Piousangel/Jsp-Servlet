<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 0;
		padding: 0;
	}
	
	header{
		height: 44px;
		margin: 0;
		background-color: #2e2e2e;
	}
	ul#menu{
		margin: 0;
		padding: 0;
		list-style: none;
		font: 15px Sans-serif;
		line-height: 44px;
		text-align: center;
	}
	
	ul#menu>li{
		display: inline-block;
		width: 100px; 
	}
	ul#menu>li>a{
		color: #cdcdcd;
		text-decoration: none;
	}
	ul#menu>li>a:hover{
		color: #fff;
	}
	
	#apple{
		text-indent: -9999px;
		background-image: url(images/apple.svg);
		position: absolute;
		top: 0;
		background-size: 16px 44px;
		background-repeat: no-repeat;
		background-position: center center;
		
		margin-left: -24px;
		width: 48px;
	}
</style>
</head>
<body>

<%
	String msg = request.getParameter("msg"); //msg는 자바의 변수입니다. 이것을 바로 자바스크립트에서 쓰지 못합니다.
											
%>
	<header>
		<ul id="menu">
			<li><a href="" id="apple">&nbsp;</a></li>
			<li><a href="">Mac</a></li>
			<li><a href="">iPad</a></li>
			<li><a href="">iPhone</a></li>
			<li><a href="">Watch</a></li>
			<li><a href="">TV</a></li>
			<li><a href="">Music</a></li>
			<li><a href="">Support</a></li>
		</ul>
	</header>
	<!-- 자바의 변수 msg의 값을 자바스크립트에서 사용할 수 있도록 hidden처리된 요소의 값으로 출력시켜 둔다. -->
	<input type= "hidden" id = "msg" value= "<%=msg%>"/>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script>
		//jquery가 무조건 시작하는 부분이 있다.
		$(function(){
			//현재 문서가 준비완료 시에 무조건 수행하는 곳!
			
			//현재 문서에서 id가 msg인 요소의 값(vale)을 얻어낸다. 그리고 그 값을 변수 res에 저장하자!
			var res = $("#msg").val();
			// var res = document.getElementByID("msg").value;
			
			if(res == "1")
				alert("축하합니다. 가입완료!");
			else if(res == "0")
				alert("저장시 오류가 발생했습니다.");
		});
	</script>
	
</body>
</html>