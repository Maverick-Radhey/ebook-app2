<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f5f5f5";>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container  p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body"></div>
                       <h3 class="text-center">Registration Page</h3>
                       
                     
                       
                       <c:if test="${not empty fMsg }">
                        <p class="text-center text-danger">${fMsg }</p>
                         <c:remove var="fMsg" scope="session"/>
                       </c:if>
                       
					<form action="RegisterServlet" method="post">
					       <div class="form-group">
							<label for="exampleInputEmail1">Enter Full Name</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" required="required" name="fname">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp"  required="required" name="email">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Phone Number</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp"  required="required" name="phone">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"  required="required" name="password"
								>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" name="check"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">Agree terms & Condition</label>
						</div>
						<button type="submit" class="btn btn-primary"><i class="fas fa-digital-tachograph"></i>Registration</button>
					</form>



				</div>
			</div>
		</div>
	</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>