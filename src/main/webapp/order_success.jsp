<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Order Success</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body  style="background-color: #d8e8dc;">
	<%@include file="all_component/navbar.jsp"%>
	
	
		<div class="container text-center mt-5">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1 style="color:green">Thank you</h1>
		<h2 style="color:green">Your Order Successfully</h2>
		<h5>With in 7 days your product will be Delivered in your Address...</h5>
		<a href="index.jsp" class="btn btn-primary mt-3"><i class="fas fa-home"></i> Home</a>
		<a href="my_order.jsp" class="btn btn-danger mt-3"><i class="fas fa-box-open"></i> View Order</a>
		</div>
		

	

</body>
</html>