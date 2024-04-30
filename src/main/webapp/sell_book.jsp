<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #d8e8dc;">

	<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body ">
						<h5 class="text-center text-primary p-1">Sell Old Book</h5>
						
							<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty faildMsg }">
							<p class="text-center text-danger">${faildMsg }</p>
							<c:remove var="faildMsg" scope="session" />
						</c:if>
						
						
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">



							<input type="hidden" value="${userobj.email }" name="user">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control" required
									id="exampleInputEmail1" aria-describody="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control" required
									id="exampleInputEmail1" aria-describody="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="text" class="form-control" required
									id="exampleInputEmail1">

							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label> <input
									name="bimg" type="file" class="form-control-file" required
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn-btn-sm btn-primary">Sell
								Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>