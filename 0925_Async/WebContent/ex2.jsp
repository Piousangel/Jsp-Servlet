<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비동기식 통신</h1>
	<article>
		<table border="1" id="table">
			<colgroup>
				<col width="70px;"/>
				<col width="120px;"/>
				<col width="110px;"/>
			</colgroup>
			<thead>
				<tr>
					<td colspan="3">
						<input type="button" id="btn" value="가져오기"/>
					</td>
				</tr>
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>직무</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</article>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script>
		$(function(){
			
			//아이디가 btn인 요소를 클릭할 때 수행하는 이벤트
			$("#btn").click(function(){
				//비동기식 통신
				$.ajax({
					url: "ex2_ok.jsp",
					type: "POST",
					dataType: "json", //ex2_ok.jsp에서 반환하는 형태
				}).done(function(res){
					//통신에 성공했을 때 수행하는 곳
					var code = ""; // 각 자원들을 tr로 만들어서 누적시키는 변수
					//console.log(res.length); //3
					//console.log(res[0].ename); //일지매
					for(var i=0; i<res.length; i++){
						code += "<tr><td>"+res[i].empno+"</td><td>"+
								res[i].ename+"</td><td>"+res[i].job+"</td></tr>";
					}//for의 끝
					
					//tr태그 3개가 code에 누적되었다. 이제 code의 내용을
					// 아이디가 table인 태그에 있는 tbody안에 html로 넣어주면 된다.
					$("#table>tbody").html(code);
				}).fail(function(err){
					//서버에서 오류가 발생할 때 수행하는 곳
					console.log(err);
				});
			});
			
			
		});
	</script>
	
</body>
</html>








