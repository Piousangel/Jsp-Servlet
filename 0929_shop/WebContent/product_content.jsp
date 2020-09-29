<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 다음의 useBean은 새롭게 생성된 것이 아니라 product_listㅓ네dptj
	 미리 생성되었던 것을 재 사용한 것이다. 이때 id속성과 class속성, scope속성들의 값을
	 똑같이 유지해야 합니다. --%>
<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>    
<jsp:setProperty property="p_num" name="sb" param="pord_num"/>

<%
	//해당 제품을 만든다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>