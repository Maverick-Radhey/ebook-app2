<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>

</head>
<body style="background-color: #d8e8dc;">

<c:if test="${ empty userobj }">
<c:redirect url="login.jsp"></c:redirect>

</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
	
	
		<h3 class="text-center">Hello : ${userobj.name }</h3>
		
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-reader fa-3x"></i>
							</div>
							<h3> Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
					 <i class="fas fa-edit fa-3x"></i>    <i class="fas fa-id-card-alt fa-3x "></i>   
							</div>
							<h4>Login & Security  (Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6 mt-4">
				<a href="my_order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
					    <i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track your Order</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6 mt-4">
				<a href="help_line.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
					    <i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>