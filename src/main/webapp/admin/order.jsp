<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<%@ page import=" java.sql.Connection"%>
<%@ page import="com.entity.BookOrder "%>
<%@ page import="com.DAO.BookOrderImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User "%>
<%@ page import="java.util.List"%>
<body>
<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
</c:if>

<%@include file="navbar.jsp"%>
<h3 class="text-center">Hello Admin</h3>

<table class="table table-striped ">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col"> Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
       <th scope="col">Phone No</th>
        <th scope="col">Book Name</th>
         <th scope="col">Author</th>
           <th scope="col">Price</th>
             <th scope="col">Payment type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
      List<BookOrder>cart=dao.getAllOrder();
  for(BookOrder b:cart){%>
	    <tr>
      <th scope="row"><%=b.getOrder_id() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFullAddress() %></td>
       <td><%=b.getPhone() %></td>
      <td><%=b.getBookName() %></td>
     <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr>
	  
  <%}
   
  %>
  
  
   
  </tbody>
</table>
<div style="margin-top:290px">
<%@include file="footer.jsp" %>
</div>

</body>
</html>