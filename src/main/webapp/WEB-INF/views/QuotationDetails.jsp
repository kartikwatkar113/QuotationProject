<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="mvc.qp.utility.NumberToWords"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detailed Quotation View</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	padding: 20px;
}

.quotation-container {
	max-width: 800px;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: auto;
}

.quotation-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.left-header h1 {
	font-size: 24px;
	color: #5C4D9D;
}

.status {
	background-color: #FFCC00;
	color: #333;
	padding: 3px 10px;
	border-radius: 5px;
	font-size: 12px;
}

.logo {
	width: 250px;
}

.quotation-info {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
}

.left-info p {
	font-size: 14px;
	margin-bottom: 5px;
}

.from-to-section {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.quotation-from, .quotation-for {
	width: 48%;
	background-color: #F0F0FF;
	padding: 15px;
	border-radius: 10px;
}

.quotation-from h3, .quotation-for h3 {
	color: #5C4D9D;
	font-size: 16px;
	margin-bottom: 10px;
}

.quotation-from p, .quotation-for p {
	font-size: 14px;
	margin-bottom: 8px;
}

.quotation-table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
	text-align: left;
}

.quotation-table th, .quotation-table td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
}

.quotation-table th {
	background-color: #5C4D9D;
	color: #fff;
	font-weight: normal;
}

.total-section {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.total-left {
	flex: 1;
	text-align: left;
	font-size: 14px;
	padding-right: 20px;
}

.total-right {
	text-align: right;
	font-size: 14px;
}

.total-right p {
	margin: 5px 0;
}

.total-line {
	border: none;
	border-top: 1px solid #000;
	margin: 10px 0;
	width: 100%;
}

.terms-conditions {
	margin-top: 20px;
}

.terms-conditions h3 {
	color: #5C4D9D;
	font-size: 16px;
	margin-bottom: 10px;
}

.terms-conditions ol {
	margin-left: 20px;
	font-size: 14px;
}

.footer {
	margin-top: 20px;
	text-align: center;
	font-size: 14px;
	color: #333;
}

.clear {
	clear: both;
}
</style>
</head>

<body>
<a style="padding-top: 16px; padding-right: 10px; font-size: 30px;" href="kanbanView"><i class="fa-solid fa-arrow-left"></i></a>
	<div class="quotation-container">
		<div class="quotation-header">
			<div class="left-header">
				<h1>Quotation</h1>
				<span class="status">Created</span>
			</div>
			<div class="right-header">
				<img src="resources/img/incquet-logo.png"
					alt="Incquet Solutions Logo" class="logo">
			</div>
		</div>

		<div class="quotation-info">
			<div class="left-info">
				<p>
					<strong>Quotation No #</strong> ${QDetails.quoteID }
				</p>
				<p>
					<strong>Quotation Date</strong> ${QDetails.quoteDate }
				</p>
			</div>
			<div class="clear"></div>
		</div>

		<div class="from-to-section">
			<div class="quotation-from">
				<h3>Quotation From</h3>
				<p>Incquet Solutions</p>
				<p>
					R7 Life Republic pimpri chichwad, Pune,<br>Maharashtra, India,
					411057
				</p>
				<p>
					<strong>Email:</strong> info@incquet.com
				</p>
				<p>
					<strong>Phone:</strong> +91 8668462855
				</p>
			</div>
			<div class="quotation-for">
				<h3>Quotation For</h3>
				<p>${QDetails.custName }</p>
				<p>${QDetails.custAddress}</p>
				<p>
					<strong>Email:</strong> ${QDetails.custEmail}

				</p>
			</div>
		</div>

		<table class="quotation-table">
			<thead>
				<tr>
					<th>Item</th>
					<th>Quantity</th>
					<th>Rate</th>
					<th>Total Amount</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${QDetails.products}">
					<tr>
						<td>${product.proName}</td>
						<td>${product.qty}</td>
						<td>${product.rate}</td>
						<td>${product.amount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<%
    // Conversion rate example: 1 USD = 75 INR (you can get this dynamically from an API)
    double conversionRate = 75.0; 
    double amountInINR = (Double) request.getAttribute("totalAmount"); // Assuming grandTotal is in INR
    double amountInUSD = amountInINR / conversionRate; // Convert to USD

    // Format the amount in USD to two decimal places
    NumberFormat usdFormat = new DecimalFormat("#0.00");
    String formattedAmountInUSD = usdFormat.format(amountInUSD);

    // Get the discount percentage from QDetails
    double discountPercentage = (Double) request.getAttribute("discount"); // Assuming this is in percentage

    // Convert the amount to words
    String amountInWords = NumberToWords.convert(amountInUSD); // Implement this utility method
	
	%>

		<div class="total-section">
			<div class="total-left">
				<p>
					<strong>Total (in words):</strong>
					<%= amountInWords %>
					DOLLARS ONLY
				</p>
			</div>
			<div class="total-right">
				<p>
					<strong>Discount:</strong>
					($<%= discountPercentage %>)
				</p>
				<hr class="total-line">
				<p>
					<strong>Total (USD):</strong> $<%= formattedAmountInUSD %>
				</p>
			</div>
		</div>


		<div class="terms-conditions">
			<h3>Terms and Conditions</h3>
			<ol>
				<li>Lorem ipsum dolor sit amet consectetur adipisicing elit.</li>
				<li>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
					Sapiente placeat omnis alias.</li>
			</ol>
		</div>

		<div class="footer">
			<p>
				For any enquiry, reach out via email at <strong>info@incquet.com</strong>,
				call on <strong>+91 86684 62855</strong>
			</p>
		</div>
	</div>
</body>

</html>