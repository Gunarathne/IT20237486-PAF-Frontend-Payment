/**
 * 
 */$(document).on("click", "#btnSave", function(event)
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
// Form validation-------------------
var status = validateItemForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
// If valid------------------------
var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "PaymentsAPI", 
 type : type, 
 data : $("#formItem").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemSaveComplete(response.responseText, status); 
 } 
 }); 
});

function onItemSaveComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 }
$("#hidItemIDSave").val(""); 
$("#formItem")[0].reset(); 
}


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
		{ 
		$("#hidItemIDSave").val($(this).data("paymentid")); 
		 $("#Name").val($(this).closest("tr").find('td:eq(0)').text()); 
		 $("#Email").val($(this).closest("tr").find('td:eq(1)').text()); 
		 $("#Address").val($(this).closest("tr").find('td:eq(2)').text()); 
		 $("#ContactNumber").val($(this).closest("tr").find('td:eq(3)').text()); 
		 $("#CardName").val($(this).closest("tr").find('td:eq(4)').text()); 
		 $("#CreditCardNumber").val($(this).closest("tr").find('td:eq(5)').text()); 
		 $("#ExpiryDate").val($(this).closest("tr").find('td:eq(6)').text()); 
		 $("#CVV").val($(this).closest("tr").find('td:eq(7)').text());
		 $("#Amount").val($(this).closest("tr").find('td:eq(8)').text());
		});




$(document).on("click", ".btnRemove", function(event)
		{ 
		 $.ajax( 
		 { 
		 url : "PaymentsAPI", 
		 type : "DELETE", 
		 data : "PaymentID=" + $(this).data("paymentid"),
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 onItemDeleteComplete(response.responseText, status); 
		 } 
		 }); 
		});
		
function onItemDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}


// CLIENT-MODEL================================================================
function validateItemForm()
{
// Name
	if ($("#Name").val().trim() == "")
	{
	return "Insert Name";
	}
	// Email
	if ($("#Email").val().trim() == "")
	{
	return "Insert Email.";
}

// Address
	if ($("#Address").val().trim() == "")
	{
	return "Insert Address";
}

// Amount
	if ($("#Amount").val().trim() == "")
	{
	return "Insert Amount";
	
}
// CardName
	if ($("#CardName").val().trim() == "")
	{
	return "Insert CardName";
	}
	// CreditCardNumber
	if ($("#CreditCardNumber").val().trim() == "")
	{
	return "Insert CreditCardNumber.";
}

// ExpiryDate
	if ($("#ExpiryDate").val().trim() == "")
	{
	return "Insert ExpiryDate";
}

// CVV
	if ($("#CVV").val().trim() == "")
	{
	return "Insert CVV";
	
}
// Amount
	if ($("#Amount").val().trim() == "")
	{
	return "Insert Amount";
	
}

	return true;
}