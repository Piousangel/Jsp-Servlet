<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.empty{
		text-align : center;
		height: 50px;
		line-height: 50px;
		font-size: 12px;	
	}
	.txt_c{text-align: center}
       a:link{text-decoration:none; color:navy}
       a:visited{text-decoration:none; color:navy}
       a:hover{text-decoration:none; color:red}
	.empty{
		text-align: center;
		height: 50px;
		line-height: 50px;
		font-size: 12px;
	}

</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

	<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>
	<jsp:setProperty property="*" name="sb"/> <%-- 현재 페이지로 넘어올 때 전달 되는 파라미터가 category하나입니다. 
												이것이 sb즉, ShopBean의 category라는 멤버변수에 자동으로 저장됩니다. --%>
<%
	//MyBatis환경을 이용해서 제품 진열대를 채웁니다. p_list에 담는 과정?
	sb.searchProduct();    //ShopBean의 p_list라는 배열이 사용자가 선택한 카테고리별로 제품들이 채워졌다.
	
	//채워진 진열대를 현재 페이지에서 표현하기 위해 가져온다.
	ProductVO[] list = sb.getP_list();

%>

	<table  align="center" width="600" border="1" 
 			style="border-collapse:collapse;font-size:8pt" bordercolor="navy"  
 			cellpadding="4" cellspacing="0">
  <thead>
    <tr bgcolor="#dedede">
        <th width="10%">제품번호</th>
        <th width="10%">이미지</th>
        <th width="35%">제품명</th>
        <th width="20%">제품가격</th>
        <th width="25%">비고</th>
    </tr>
  </thead>

	<tbody>
	  <%    
	  	if(list != null && list.length > 0){
	  		for(ProductVO pvo : list){
	  		
	  %>
    <tr align="center">
        <td><%=pvo.getP_num() %></td>
        <td><img src="images/<%=pvo.getP_image_s() %>" width="100" height="95"></td>
        <td>
            <a href="product_content.jsp?prod_num=><%=pvo.getP_num() %>">
                <%=pvo.getP_name() %>
            </a>
        </td>
        <td>
            할인가 :<%=pvo.getP_saleprice()%>원<br>
            <font color="red">()</font>
        </td>
        <td>
            시중 가격 :<%=pvo.getP_price()%>원
        </td>
    </tr>
    <%			}
    		}else{
    %>
    	<tr> 
    		<td colspan="5" class="empty">등록된제품이 없습니다.</td>
    	</tr>
    
    <%
    		}
    
    %>
    
    </tbody>
   
</table>
	

	
</body>
</html>