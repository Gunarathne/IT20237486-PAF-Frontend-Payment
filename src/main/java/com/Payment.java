
package com;

import java.sql.*;
public  class Payment {
	
	public  Connection connect() {
		
		Connection con =null;
		
		try 
		 { 
		 Class.forName("com.mysql.jdbc.Driver"); 
		 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/electrogiddb", "root", ""); 
		 //For testing
		 System.out.print("Successfully connected"); 
		 } 
		 catch(Exception e) 
		 { 
		 e.printStackTrace(); 
		 } 
		 
		 return con;
		
		
	}
	
	public String insertPayment(String username, String email, String address,String connumber, String cname, String cardno, String expdate, String cvv, String amount) {
		
		String output="";
		
		try {
			Connection con = connect(); 
			if (con == null) 
			{ 
				return "Error while connecting to the database";
			}
				String query = " insert into paymenttb (`PaymentID`,`Name`,`Email`,`Address`,`ContactNumber`,`CardName`,`CreditCardNumber`,`ExpiryDate`,`CVV`,`Amount`)"
					 + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
					 PreparedStatement preparedStmt = con.prepareStatement(query); 
					 // binding values
					 preparedStmt.setInt(1, 0); 
					 preparedStmt.setString(2, username); 
					 preparedStmt.setString(3, email);  
					 preparedStmt.setString(4, address); 
					 preparedStmt.setString(5, connumber); 
					 preparedStmt.setString(6, cname);  
					 preparedStmt.setString(7, cardno); 
					 preparedStmt.setString(8, expdate); 
					 preparedStmt.setString(9, cvv);  
					 preparedStmt.setString(10, amount); 
					 
					 //execute the statement
					 preparedStmt.execute(); 
					 con.close(); 
					 
					 
					 String newPayments = readPayments(); 
					 output = "{\"status\":\"success\", \"data\": \"" + 
					 newPayments + "\"}"; 
			
		}catch(Exception e){
					output = "{\"status\":\"error\", \"data\": \"Error while inserting the payments.\"}";
			 
					System.err.println(e.getMessage());
			
		}
		
		return output;
		

		
	}//endofinsertmethod
	
	public String readPayments() {
		
		String output="";
	
		
		try
		{ 
		 Connection con = connect(); 
		if (con == null) 
		 { 
			return "Error while connecting to the database for reading."; 
		 }
		
		// Prepare the html table to be displayed
		 	output = "<table border='1'><tr><th>Name</th>" 
		 			+ "<th>Email</th><th>Address</th>"
		 			+ "<th>ContactNumber</th>" 
		 			+ "<th>CardName</th><th>CreditCardNumber</th>"
		 			+ "<th>ExpiryDate</th>"
		 			+ "<th>CVV</th><th>Amount</th>"
		 			+ "<th>Update</th><th>Remove</th></tr>"; 
		 	String query = "select * from paymenttb"; 
		 	Statement stmt = con.createStatement(); 
		 	ResultSet rs = stmt.executeQuery(query); 
		 // iterate through the rows in the result set
		 while (rs.next()) 
		 { 
			 
			
			 
			 String PaymentID = Integer.toString(rs.getInt("PaymentID")); 
			 String Name = rs.getString("Name"); 
			 String Email = rs.getString("Email");
			 String Address = rs.getString("Address");
			 String ContactNumber = rs.getString("ContactNumber"); 
			 String CardName = rs.getString("CardName");
			 String CreditCardNumber = rs.getString("CreditCardNumber");
			 String ExpiryDate = rs.getString("ExpiryDate"); 
			 String CVV = rs.getString("CVV");
			 String Amount = rs.getString("Amount");
			 
		 // Add a row into the html table
			 output += "<tr><td>" + Name + "</td>"; 
			 output += "<td>" + Email + "</td>"; 
			 output += "<td>" + Address + "</td>";
			 output += "<td>" + ContactNumber + "</td>";
			 output += "<td>" + CardName + "</td>"; 
			 output += "<td>" + CreditCardNumber + "</td>";
			 output += "<td>" + ExpiryDate + "</td>";
			 output += "<td>" + CVV + "</td>"; 
			 output += "<td>" + Amount + "</td>";
		
		 // buttons
			 output += "<td><input name='btnUpdate' type='button' value='Update' "
					 + "class='btnUpdate btn btn-secondary' data-paymentid='" + PaymentID + "'></td>"
					 + "<td><input name='btnRemove' type='button' value='Remove' "
					 + "class='btnRemove btn btn-danger' data-paymentid='" + PaymentID + "'></td></tr>"; 
		 } 
		 con.close(); 
		 // Complete the html table
		 	output += "</table>"; 
		
		
		
		}catch (Exception e) 
		{ 
			output = "Error while reading the items."; 
			System.err.println(e.getMessage()); 
		}

		return output;
		
		
	}
	
	public String deletePayment(String PaymentID) 
	{ 
	 String output = ""; 
	try
	 { 
	 Connection con = connect(); 
	 if (con == null) 
	 { 
	 return "Error while connecting to the database for deleting."; 
	 } 
	 // create a prepared statement
	 String query = "delete from paymenttb where PaymentID=?"; 
	 PreparedStatement preparedStmt = con.prepareStatement(query); 
	 // binding values
	 preparedStmt.setInt(1, Integer.parseInt(PaymentID)); 
	 
	 // execute the statement
	 preparedStmt.execute(); 
	 con.close(); 
	 String newPayments = readPayments(); 
	 output = "{\"status\":\"success\", \"data\": \"" + newPayments + "\"}"; 

	 
	 
	 }  
	catch (Exception e) 
	 { 
		output = "{\"status\":\"error\", \"data\": \"Error while deleting the payment.\"}"; 
 
	 System.err.println(e.getMessage()); 
	 } 
	return output; 
	}

	//updating
	public String updatePayment(String ID, String username, String email, String address,String connumber, String cname, String cardno, String expdate, String cvv, String amount) {
		String output ="";
		
		try {
			 Connection con = connect(); 
			 if (con == null) 
			 { 
			 return "Error while connecting to the database for updating."; 
			 } 
			 
			 String query = "UPDATE paymenttb SET Name=?,Email=?,Address=?,ContactNumber=?,CardName=?,CreditCardNumber=?,ExpiryDate=?,CVV=?,Amount=? WHERE PaymentID=?"; 
			 PreparedStatement preparedStmt = con.prepareStatement(query); 
			 
			 
			 preparedStmt.setString(1, username); 
			 preparedStmt.setString(2, email);  
			 preparedStmt.setString(3, address);
			 preparedStmt.setString(4, connumber); 
			 preparedStmt.setString(5, cname);  
			 preparedStmt.setString(6, cardno);
			 preparedStmt.setString(7, expdate); 
			 preparedStmt.setString(8, cvv);  
			 preparedStmt.setString(9, amount);
			 preparedStmt.setInt(10, Integer.parseInt(ID)); 
			 //execute the statement
			 preparedStmt.execute(); 
			 con.close(); 
			 
			 String newPayments = readPayments(); 
			 output = "{\"status\":\"success\", \"data\": \"" + newPayments + "\"}"; 

			
		}catch(Exception e) {
			

			 output = "{\"status\":\"error\", \"data\": \"Error while updating the payment.\"}"; 
 
			 System.err.println(e.getMessage()); 
			
		}
		
		
		return output;
	}


	
}

