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
	<h1 class= "red"> Payment Details </h1>
<br>
  
  <div>
  
			  		<form id="formItem" name="formItem" method="post" action="payments.jsp">
			  		
			 <center><h3>User Details</h3> </center>
			 Name: 
			<input id="Name" name="Name" type="text"  placeholder="Your name.."
			 class="form-control form-control-sm">
			<br> Email: 
			<input id="Email" name="Email" type="text" placeholder ="name@gmail.com"
			 class="form-control form-control-sm">
			<br> Address:
			<input id="Address" name="Address" type="text" placeholder ="Address"
			 class="form-control form-control-sm">
			<br> ContactNumber: 
			<input id="ContactNumber" name="ContactNumber" type="text" placeholder ="071-XXXXXXX"
			 class="form-control form-control-sm">
			 <br> Amount: 
			<input id="Amount" name="Amount" type="text" placeholder="Rs.3000.00" 
			 class="form-control form-control-sm">
			<br> 
			<center><h3>Card Details</h3></center>
			<br>
			Card Holder Name: 
			<input id="CardName" name="CardName" type="text"  placeholder ="Holder Name"
			 class="form-control form-control-sm">
			<br> CreditCardNumber: 
			<input id="CreditCardNumber" name="CreditCardNumber" type="text" placeholder ="xxxx - xxxx - xxxx - xxxx" max="19" 
			 class="form-control form-control-sm">
			<br> ExpiryDate: 
			<input id="ExpiryDate" name="ExpiryDate" type="text" placeholder="MM/YY" 
			 class="form-control form-control-sm">
			 <br> CVV: 
			<input id="CVV" name="CVV" type="text" placeholder="CVV"
			 class="form-control form-control-sm">
			 
			 <br>
			  <label>
          <input class = "inputStyle" id = "checkbox" type = "checkbox" onclick = "enableButton()">Accept privacy policy and terms
        </label>
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
				 
		<br>
		<br>		 
		<br>
		<br>
		
  
  </div>
  </div>
  </div>
 </div> 
</body>
</html>