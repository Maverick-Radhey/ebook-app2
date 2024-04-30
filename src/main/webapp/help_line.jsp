<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelpLine Page</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #d8e8dc;">
<c:if test="${ empty userobj }">
<c:redirect url="login.jsp"></c:redirect>

</c:if>

	<%@include file="all_component/navbar.jsp"%>

<div class="container">

<div class="row mt-5">
<div class="col-md-4 offset-md-4  text-center">
<div class="text-success">
<i class="fas fa-phone-square fa-5x"></i>
</div>

<h2>24*7 Service</h2>
<h3>Help Line Number</h3>
<h5>+91 7895895805 && +91 6398941452</h5>
<a href="index.jsp" class="btn btn-primary">Home</a>


</div>
</div>
</div>

</body>
</html>