<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 다음의 useBean은 새롭게 생성된 것이 아니라 product_list.jsp에서 
	 미리 생성되었던 것을 재 사용한 것이다. 이때 id속성과 class속성, scope속성들의 값을
	 똑같이 유지해야 합니다. --%>
	 
<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>    
<jsp:setProperty property="p_num" name="sb" param="prod_num"/>

<%
	//해당 제품을 받습니다.
	ProductVO pvo = sb.getProduct();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#title{
			font-size:30px;
			color: maroon;
		}
	.txt_c{text-align: center}
    a:link{text-decoration:none; color:navy}
    a:visited{text-decoration:none; color:navy}
    a:hover{text-decoration:none; color:red}
        
	table{
		width: 600px;
		font-size: 12px;
		border-collapse: collapse;
		border: 1px solid black;
		padding: 4px;
		margin: 0 auto;
	}
	
	table tbody tr{
		border : 1px solid black;
	}
	
	table td{
		padding : 4px;
	}

</style>
</head>
<body>
	<jsp:include page="nav.jsp"/>
	
	<table>
		   	<colgroup>
		   		<col width="40%">
		   		<col width="60%">
		   	</colgroup>
			<tbody>
			    <tr>
			        <td>제품Category</td>
			        <td><%=pvo.getCategory() %></td>
			    </tr>
			    <tr>
			        <td>제품번호</td>
			        <td><%=pvo.getP_num() %></td>
			    </tr>
			    <tr>
			        <td>제품이름</td>
			        <td><%=pvo.getP_name() %></td>
			    </tr>
			    <tr>
			        <td>제품 판매사</td>
			        <td><%=pvo.getP_company() %></td>
			    </tr>
			    <tr>
			        <td>제품가격</td>
			        <td>(할인가 :<%=pvo.getP_saleprice() %> )</td>
			    </tr>
			    <tr>
			        <td colspan="2">제품설명</td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center"><img src ="images/<%=pvo.getP_image_l() %>"></td>
			    </tr>
			    <tr>
			        <td colspan="2"><%=pvo.getP_content() %></td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center">
			            <input type="button" value="장바구니에 담기" 
			            onclick="javascript:location.href='addProduct.jsp?p_num='"/>
			            <input type="button" value="장바구니 보기" 
			            onclick="javascript:location.href='cartList.jsp'"/>
			        </td>
			    </tr> 
		    </tbody>   
		</table>
</body>
</html>