<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<style type="text/css">
.card-ho:hover {
	background-color: #fcf7f7;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeout 0.5s 2.5s;
}

@
keyframes fadeIn {from { bootom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<%@ page import=" java.sql.Connection"%>
<%@ page import="com.entity.BookDtls "%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User "%>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<% User u=(User)session.getAttribute("userobj");%>

	<c:if test="${not empty addCart }">

		<div id="toast">${addCart}</div>

		<script type="test/javascript">
   showToast();
function showToast(content)
{
  $("#toast").addClass("display");
 $("#toast").html(content);
setTimeout((()=>
$("toast").removeClass("display");
},2000)
}
</script>

<c:remove var="addCart" scope="session"/>

	</c:if>


	<div class="container-fluid">
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">

						<p><%=b.getBookName()%>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
														
         <%
         if(u==null){%>
         <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
							class="fas fa-cart-plus"></i> Add Cart</a>
         
         <% }else{%>
         <a href="checkout.jsp?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
							class="fas fa-cart-plus"></i> Add Cart</a>
         <% }
         %>
								
								 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-1">View Details</a>
								
								 <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>