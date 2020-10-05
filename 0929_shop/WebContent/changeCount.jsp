<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>
 <jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>

<%
	String num = request.getParameter("p_num");
	String quant = request.getParameter("count");
	
	int count = Integer.parseInt(quant);
	
	
	cart.changeCount(num, count);
	
	response.sendRedirect("cartList.jsp");

%>
