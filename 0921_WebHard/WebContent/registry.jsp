<%@page import="java.io.File"%>

<%@page import="mybatis.dao.workDAO"%>
<%@page import="mybatis.vo.workVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%! //메서드 활용~
 	private String makeString(String[] ar, String delim){  //배열이라 .length 사용, 문자열 -> .length() , set, list => size()
	 StringBuffer sb = new StringBuffer();
	 for(int i=0; i<ar.length; i++){  
		 sb.append(ar[i]);
		 if(i <ar.length-1)
		 	sb.append(delim);
	 }
	 return sb.toString(); //  toString해줘야 합니다 stringbuffer->string
 }
 %>   
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String[] phone_ar = request.getParameterValues("phone");
	
	//String phone = "";
	
	
	
/*	StringBuffer sb = new StringBuffer();
	for(String p : phone_ar){
		//phone += p;  // "" + "010" ---> "010" , "010" + "1234" ---> "0101234" , "0101234" + "2021" ---> "01012342021" //무분별하게 객체가 생성되는 것을 막아주려고 버퍼사용
		sb.append(p);
	}*/
	String phone = makeString(phone_ar, "-");
	
	String email = request.getParameter("email");
	//String str = session.setAttribute(thing, "uvo");
	
	boolean chk = workDAO.add(id, pw, name, addr, phone, email);
	
	//chk가 true일때만 특정 위치(members폴더)에 가입한 사용자 id와 같은 이름으로 폴더를 생성한다.
	//folder는 directory와 같은 것이며, 이것을 만들기 위해 먼저
	//java.io.File객체를 먼저 생성해야 한다. 그리고 그 안의 메서드들 중 mkdir() 또는 mkdirs()로 폴더를 생성할 수 있다. 
	
	if(chk){
		//현재 서버(application)의 members라는 폴더의 정확한 절대경로(c:/..)를 얻자!
		String path = application.getRealPath("/members/"+id);
		
		System.out.println(path); //서버안 절대경로 확인
		
		//폴더를 생성할 수 있는 객체 즉, File객체를 생성한다.
		File f = new File(path);
		
		//존재하는지? 확인하자! (존재 하지 않지만 확인.)
		if(!f.exists()){
			f.mkdirs(); //실제 물리적인 폴더가 생성됨  ex) members(폴더), id 등 여러개를 만들경우 mkdirs() 사용
		}	
		
	
		
	
	
%>

<script>
	parent.location.href ="index.jsp?msg=1";
	//top.location.href = ~
</script>

<% 

	}else{
%>
<script>
	parent.location.href ="index.jsp?msg=0";
</script>

<% 
	}

%>

