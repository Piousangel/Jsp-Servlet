<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>

<%
		String pnum = request.getParameter("p_num");
		boolean chk = cart.delProduct(pnum); //장바구니에서 삭제합니다.
		
		response.sendRedirect("cartList.jsp");
%>