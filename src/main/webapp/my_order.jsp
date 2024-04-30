<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<%@ page import=" java.sql.Connection"%>
<%@ page import="com.entity.BookOrder "%>
<%@ page import="com.DAO.BookOrderImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User "%>
<%@ page import="java.util.List"%>
<body style="background-color: #d8e8dc;">

<c:if test="${ empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-1">
<h4 class="text-center text-success">Your Order</h4>

		<table class="table table-striped mt-4">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					
				</tr>
			</thead>
			<tbody>
			
			<%
			User u=(User)session.getAttribute("userobj");
			BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
			List<BookOrder>cart=dao.getBook(u.getEmail());
			for(BookOrder b:cart){%>
			<tr>
					<th scope="row"><%=b.getOrder_id() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
				
		<%	}
			%>
			
				
				
			</tbody>
		</table>

	</div>
</body>
</html>