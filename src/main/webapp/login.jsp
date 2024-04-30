<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f5f5f5";>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login Page</h3>

						<c:if test="${not empty faildMsg }">
							<h5 class="text-center text-danger">${faildMsg}</h5>
							<c:remove var="faildMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									placeholder="Enter email" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" placeholder="Password" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-sign-in-alt"></i> Login
								</button>
								<br> <a href="register.jsp">Create Account</a><br>
							</div>
							<small id="emailHelp" class="form-text text-muted">We'll
								never share your email with anyone else.</small>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>