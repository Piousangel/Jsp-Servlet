<%@page import="mybatis.vo.workVO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//선언문 ==> 멤버변수 또는 멤버메서드를 정의할 대 사용한다.
	
	//개인이 사용한 용량을 측정하는 메서드
	// (File은 파일만 용량을 얻을 수 있으며, 폴더는 용량을 구하지 못합니다. 그 안에 존재하는 파일들의 용량을 모두 더해서 표현합니다.)
	
	public int useSize(File f){
		//인자로 전달된 f는 폴더여야 한다. 이 폴더의 하위요소들의 File용량을
		//모두 더해서 반환하려고 합니다.
		//폴더 안에 있는 모두 하위요소들을 얻어냅니다.
		
		File[] list = f.listFiles();
		int size =0; //파일들의 용량을 저장할 곳!
		
		//하위요소들(list) 중 파일이 아닌 것들은(폴더인것들) 현재 메서드인 useSize()를 다시 호출한다.
		for(File sf : list){
			
			if(sf.isFile())
				size += sf.length(); //파일일 경우 용량을 size에 누적시킨다.
			else
				size += useSize(sf);
		}
			return size;
	}
%>  <%-- 선언문 끝 --%>
<%
	int totalSize = 1024*1024*10; 
	int useSize = 0;
	
	//현재 페이지는 무조건 로그인이 되어 있어야 사용할 수 있는 페이지 입니다.
	//로그인 여부를 확인해야합니다.
	
	Object obj = session.getAttribute("uvo");
	
	if(obj != null){
		
		request.setCharacterEncoding("utf-8");
		
		String dir = request.getParameter("cPath");         //만약에 이런 파라미터가 없다면
															// dir에는  null이 저장됩니다. 있다면 ~  ("test1")
		//사용자가 폴더를 선택할 경우라면 f_name이라는 파라미터 또한 넘어온다.
		String fname = request.getParameter("f_name");   //"t1"    -> "test1/t1"
		
		//로그인한 회원의 id값을 얻어내기 위해서 obj를 workVO로 형변환 시킨다.
		
		workVO wvo = (workVO)obj;
		
		String path = null;  //로그인한 회원의 id로된 폴더를 절대경로화 시켜서 저장할 곳! (Home Directory)
							 //만약 dir이 null이 아니면 홈디렉토리로 설정하지 않는다.
		if(dir == null){
			path = application.getRealPath("/members/" + wvo.getM_id());
			useSize = useSize(new File(path)); //사용용량 측정이 되었습니다.
			
			//현재 위치값을 사용자의 id로 설정합니다.
			dir = wvo.getM_id();
		}else{
			//사용자가 특정 폴더를 클릭했을 때 수행하는 부분입니다.
			
			if(fname != null && fname.trim().length() > 0){
				dir = dir + "/" + fname;                        // "test1/t1"
			}
			
			path = application.getRealPath("/members/"+ dir);
		}
		
		
		
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 600px;
		border: 1px solid #27a;
		border-collapse: collapse;
	}
	table th, table td{
		border: 1px solid #27a;
		padding: 4px;
	}
	table th{ background-color: #bcbcbc; }
	.title { background-color: #bcbcbc; width: 25%; }
	
	.btn{
		display: inline-block;
		width: 70px;
		height: 20px;
		text-align: center;
		padding:0px;	
		margin-right: 20px;	
	}
	.btn a{
		display: block;
		width: 100%;
		padding: 4px;
		height: 20px;
		line-height: 20px;
		background: #27a;
		color: #fff;
		border-radius: 3px;
		text-decoration: none;
		font-size: 12px;
		font-weight: bold;
	}
	.btn a:hover{
		background: #fff;
		color: #27a;
		border: 1px solid #27a;
	}
	
	#f_win{
		width: 220px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
	#f_win2{
		width: 300px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
</style>
</head>
<body>
	<h1>My Disk service</h1>
	<hr/><%=wvo.getM_name() %>
	(<span class="m_id"><%=wvo.getM_id() %></span>)님의 디스크
	&nbsp;[<a href="javascript:home()">Home</a>]
	<hr/>
	
	<table summary="사용량을 표시하는 테이블">
		<tbody>
			<tr>
				<th class="title">전체용량</th>
				<td><%=totalSize/1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">사용량</th>
				<td><%=useSize/1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">남은용량</th>
				<td><%=((totalSize-useSize)/1024) %>KB</td>
			</tr>
		</tbody>
	</table>
	<hr/>
		<div id="btn_area">
			<p class="btn">
				<a href="javascript:selectFile()">
					파일올리기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:makeFolder()">
				
					폴더생성
				</a>
			</p>
			<p class="btn">
				<a href="javascript:exe()">
					파일생성
				</a>
			</p>
		</div>		
	<hr/>
	
	<label for="dir">현재위치:</label>
	<span id="dir"><%=dir %></span>
	
	<table summary="폴더의 내용을 표현하는 테이블">
		<colgroup>
			<col width="50px"/>
			<col width="*"/>
			<col width="80px"/>
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>폴더 및 파일명</th>
				<th>삭제여부</th>
			</tr>
		</thead>
		<tbody>
		
		<%
			//상위로 라는 기능은 현재위치(dir)가 해당 사용자의 id와 다를 때만 나타나야 한다.
			if(!dir.equals(wvo.getM_id())){
				int idx = dir.lastIndexOf("/");
				String up_path = dir.substring(0, idx);
		%>
			<tr>
				<td>↑</td>
				<td colspan="2">
					<a href="javascript:goUp('<%=up_path %>')">
						상위로...
					</a>
				</td>
			</tr>
<%
			}   //if문끝
%>

<% 			
			// 1.현재위치(dir)값을 가지고 절대경로를 얻어낸다.
			String c_path = application.getRealPath("/members/" + dir);
			// 2.위에서 얻은 절대경로를 가지고 File객체를 생성한다.
			//   (File)객체로 디렉토리인지 아닌지를 판단하여 하위 내용들을 모두 가져오기 위해서다.
			File s_file = new File(c_path);
			
			// 3.하위 요소들을 얻어내어 출력
			//String[] names = s_file.list();            //하위의 이름들만 받나낸다. 이렇게 하면 용량이나, 또는 파일인지 폴더인지를 판단하지 못한다.
			
			File[] sub_list = s_file.listFiles();
			
			for(File f : sub_list){
 %>
			<tr>
				<td>
				<%
					if(f.isFile()){ 
				%>
						<img src="../images/file.png"/>
				<% }else{  //폴더일경우 %>
						<img src="../images/folder.png"/>
				<% }   %>
				</td>
				<td>
				<%
					if(f.isDirectory()){
				%>
					<!--  사용자가 폴더명을 클릭할 때 마다 폴더명을 gogo라는 함수를 호출하면서 인자로 전달한다.  -->
					<a href="javascript: gogo('<%=f.getName() %>')">
						<%=f.getName() %>
					</a>
				<%
					}else{ //파일일 경우 다운로드 기능을 부여한다.
				%>
					<a href="javascript:down('<%=f.getName() %>')">
						<%=f.getName() %>
					</a>
				<%  } %>
				</td>
				<td></td>
			</tr>
<%
			}  //향 for 끝
%>
		</tbody>
	</table>
	
	<form name="ff" method="post">
		<input type="hidden" name="f_name"/>                  <%-- 사용자가 클릭한 폴더명 --%>
		<input type="hidden" name="cPath" value="<%=dir%>"/>  <%-- 사용자가 있었던 현재 위치 값 --%>
	</form>
	
	
	<div id="f_win">
		<form action="makeFolder.jsp" method="post" name="frm">
			<input type="hidden" name="cPath" value="<%=dir%>"/>
			<label for="f_name">폴더명:</label>
			<input type="text" id="f_name" name="f_name"/><br/>       
			<p class="btn">
				<a href="javascript:newFolder()">
					만들기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	

	<div id="f_win2">
	<%-- 
		웹 상에서 파일을 첨부되는 form은 무조건 
		enctype="multipart/form-data" 를 넣어줘야 합니다.  데이터를 받을 때 request.getparam으로 받지 못합니다.
		받드시 MultipartRequest객체로 받아야합니다. (servlets.com)
	 --%>
		<form action="upload.jsp" method="post" name="frm2"
		enctype="multipart/form-data">
		
			<label for="selectFile">첨부파일:</label>
			<input type="file" id="selectFile" 
				name="upload"/><br/>
				
			<p class="btn">
				<a href="javascript:upload()">
					보내기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin2()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	
	<script type="text/javascript">
		function home(){
			parent.location.href="../main.jsp";
		}
		
		function gogo(fname){
			//현재 문서(document)에
			// 이름이 ff인 form객체를 검색한다.
			// 검색된 form객체 안에 이름이 fname인 요소의
			//값으로 인자로 받은 폴더명을 넣어준다.
			document.ff.f_name.value = fname;
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
		}
		
		function goUp(upPath){
			document.ff.cPath.value = upPath;
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
		}
		
		function makeFolder(){
			document.getElementById("f_win").style.display = "block";
		}
		function closeWin(){
			document.getElementById("f_win").style.display = "none";
		}
		
		function newFolder(){
			//사용자가 새로 만들 폴더명을 입력했는지 판단하자!
			var str = document.frm.f_name.value;
			
			//정규표현식을 이용한 공백제거 작업
			
			if(str.trim().length < 1){
				alert("폴더명을 입력하세요");
				document.frm.f_name.focus();
				return;
			}
			document.frm.submit();//서버로 보낸다.(makeFolder.jsp)
		}
		
		function selectFile(){			
			//숨겨져 있던 div를 보여준다.
			document.getElementById("f_win2").style.display = "block";
		}
		
		function upload(){
			//선택된 파일의 값을 가져오자!
			var select_f = document.frm2.upload.value;
			//document.frm2.upload.value = "test.txt";
			//위는 input type="file" 에서는 절대 허용되지 않는다.
			//이유는 보안문제에 걸려 브라우저에서 막아뒀다.
			
			//alert(select_f);
			if(select_f.trim().length < 1){
				alert("파일을 선택하세요!");
				return;
			}
			document.frm2.submit();
		}
		function closeWin2(){
			document.getElementById("f_win2").style.display = "none";
		}
		
		function down(fname){
			//인자로 넘어온 파일명을 현재문서(document)에
			//"ff"라는 폼안에 f_name이라는 이름을 가진 요소의
			//value값으로 지정해야 한다.
			document.ff.f_name.value = fname;
			// cPath도 같이 있는 폼의 action을 변경하자!
			document.ff.action = "download.jsp";
			
			document.ff.submit();
			
			document.ff.f_name.value = "";//돌아올 때 파일명이 있어서
					//오류가 발생할 수 있어서 삭제함!
		}
		
		function exe(){
			//현재 문서에 이름이 ff인 폼객체의 action을
			// newFile.jsp로 변경하자!
			document.ff.action = "newFile.jsp";
			document.ff.submit();
		}
	</script>
</body>
</html>
<%
	}else{
%>
	<script>
		top.location.href="../index.jsp";
	</script>
	
<%	
	}
%>


