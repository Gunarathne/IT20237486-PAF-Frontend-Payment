<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.Payment" %>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEB PAYMENT</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/payment.js"></script>
</head>
<body><div class="container"><div class="row"><div class="col-6">
	<h1> Payment: </h1>
<br>
  
  <div>
  
			  		<form id="formItem" name="formItem" method="post" action="payments.jsp">
			 Name: 
			<input id="Name" name="Name" type="text" 
			 class="form-control form-control-sm">
			<br> Email: 
			<input id="Email" name="Email" type="text" 
			 class="form-control form-control-sm">
			<br> Address:
			<input id="Address" name="Address" type="text" 
			 class="form-control form-control-sm">
			<br> ContactNumber: 
			<input id="ContactNumber" name="ContactNumber" type="text" 
			 class="form-control form-control-sm">
			<br> CardName: 
			<input id="CardName" name="CardName" type="text" 
			 class="form-control form-control-sm">
			<br> CreditCardNumber: 
			<input id="CreditCardNumber" name="CreditCardNumber" type="text" 
			 class="form-control form-control-sm">
			<br> ExpiryDate: 
			<input id="ExpiryDate" name="ExpiryDate" type="date" 
			 class="form-control form-control-sm">
			 <br> CVV: 
			<input id="CVV" name="CVV" type="text" 
			 class="form-control form-control-sm">
			 <br> Amount: 
			<input id="Amount" name="Amount" type="text" 
			 class="form-control form-control-sm">
			 <br>
			<input id="btnSave" name="btnSave" type="button" value="Save" 
			 class="btn btn-primary">
			<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
			</form>
  		<br>
  		<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
				 <%
				 Payment paymentObj = new Payment(); 
				 out.print(paymentObj.readPayments()); 
				 %>
</div>
  
  </div>
  </div>
  </div>
 </div> 
</body>
</html>