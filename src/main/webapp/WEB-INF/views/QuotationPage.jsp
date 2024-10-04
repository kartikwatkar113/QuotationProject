<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="th"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Quote Form</title>
<!-- Link to external CSS file -->
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	padding: 20px;
}

h2 {
	text-align: center;
	color: #007bff;
}

form {
	width: 80%;
	margin: 0 auto;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

label {
	font-weight: bold;
	margin-top: 10px;
	display: block;
}

input, select {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

input[readonly] {
	background-color: #e9ecef;
	cursor: not-allowed;
}

.form-group {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.form-gro… [ 1:13 pm , 01/10/2024] manishrpatil17: /* quote_form.css */
        
        body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	padding: 20px;
}

h2 {
	text-align: center;
	color: #007bff;
}

form {
	width: 80%;
	margin: 0 auto;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

label {
	font-weight: bold;
	margin-top: 10px;
	display: block;
}

input, select {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

input[readonly] {
	background-color: #e9ecef;
	cursor: not-allowed;
}

.form-group {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.form-group div {
	flex: 1;
	padding: 10px;
}

.form-group div:first-child {
	flex: 2;
}

.table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
}

.table th, .table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.table th {
	background-color: #f2f2f2;
}

.btn {
	background-color: #28a745;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
}

.btn:hover {
	background-color: #218838;
}

.subtotal, .grand-total, .discount {
	font-weight: bold;
}

header {
	margin: 0 auto;
	width: 80%;
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-radius: 8px;
	margin-bottom: 20px;
	width: 80%;
}

header h1 {
	margin: 0;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

nav ul li {
	display: inline;
	margin-left: 20px;
}

nav ul li a {
	color: white;
	text-decoration: none;
	padding: 5px 10px;
	border-radius: 5px;
}

nav ul li a:hover {
	background-color: rgba(255, 255, 255, 0.2);
}
</style>
</head>

<body>

	<header>
		<h1>Quotation Form</h1>
		<nav>
			<ul>
				<li><a href="dashBoard">Dashboard</a></li>
				<li><a href="kanbanView">Kanban View</a></li>

			</ul>
		</nav>
	</header>

	<form:form action="submitQuote" method="POST" modelAttribute="quoteForm">
		<!-- Status (Always Draft and Read-Only) -->
		<label for="status">Status:</label> <input type="text" id="status"
			name="status" value="Draft" readonly>

		<!-- Quote Date (Current Date and Read-Only) -->
		<label for="quoteDate">Quote Date:</label> <input type="date"
			id="quoteDate" name="quoteDate" readonly>

		<!-- Customer Selection -->
		<label for="customer">Customer:</label> <select id="customer"
			name="customer">
			<option selected="selected">Select Customer</option>
			<c:forEach var="cust" items="${customers}">
				<option value="${cust.custID}">${cust.custName}</option>

			</c:forEach>

		</select>

		<!-- Product Details Subform -->
		<h3>Products</h3>
		<table class="table" id="productsTable">
			<thead>
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Rate</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><select name="product[]" class="product-select"
						onchange="updateRate(this)">
							<!-- Loop through the list of products -->
							<option selected="selected">Select</option>
							<c:forEach var="product" items="${products}">
								<option value="${product.proID}"
									data-price="${product.proPrice}">${product.proName}</option>
							</c:forEach>
					</select></td>
					<td><input type="number" name="qty[]" value="1" class="qty"></td>
					<td><input type="number" name="rate[]" class="rate" readonly></td>
					<td><input type="number" name="amount[]" class="amount"
						readonly></td>
					<td><button type="button" class="btn remove-btn">Remove</button></td>
				</tr>
			</tbody>

		</table>
		<button type="button" class="btn" id="addProductBtn">Add
			Product</button>

		<!-- Calculations -->
		<div class="form-group">
			<div>
				<label for="subtotal" class="subtotal">Subtotal:</label> <input
					type="number" id="subtotal" name="subtotal" value="0" readonly>
			</div>
		</div>

		<!-- Discount Field (Moved below Subtotal) -->
		<div class="form-group">
			<div>
				<label for="discount" class="discount">Discount (%):</label> <input
					type="number" id="discount" name="discount" value="0">
			</div>
			<div>
				<label for="grandTotal" class="grand-total">Grand Total:</label> <input
					type="number" id="grandTotal" name="grandTotal" value="0" readonly>
			</div>
		</div>

		<!-- Submit Button -->
		<button type="submit" class="btn">Submit Quote</button>
	</form:form>

	<!-- JS to handle dynamic calculations -->
	<script> 
        document.addEventListener('DOMContentLoaded', function() {
            const addProductBtn = document.getElementById('addProductBtn');
            const productsTable = document.getElementById('productsTable').getElementsByTagName('tbody')[0];
            const quoteDateInput = document.getElementById('quoteDate');

            // Set current date to quoteDate and disable editing
            const today = new Date().toISOString().substr(0, 10);
            quoteDateInput.value = today;

            function calculateAmount(row) {
                const qty = row.querySelector('.qty').value;
                const rate = row.querySelector('.rate').value;
                const amountField = row.querySelector('.amount');
                const amount = qty * rate;
                amountField.value = amount.toFixed(2);
                calculateTotals();
            }

            function calculateTotals() {
                let subtotal = 0;
                const rows = productsTable.querySelectorAll('tr');
                rows.forEach(row => {
                    const amount = parseFloat(row.querySelector('.amount').value || 0);
                    subtotal += amount;
                });

                const discount = parseFloat(document.getElementById('discount').value || 0);
                const grandTotal = subtotal - (subtotal * (discount / 100));

                document.getElementById('subtotal').value = subtotal.toFixed(2);
                document.getElementById('grandTotal').value = grandTotal.toFixed(2);
            }

         // Adding an event listener to add a new product row
            addProductBtn.addEventListener('click', function() {
                const newRow = productsTable.insertRow();

                // Create a new row with the required HTML structure
                newRow.innerHTML = `
                    <td>
                        <select name="product[]" class="product-select" onchange="updateRate(this)">
                            <!-- Loop through the list of products -->
                            <c:forEach var="product" items="${products}">
                                <option value="${product.proID}" data-price="${product.proPrice}">${product.proName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td><input type="number" name="qty[]" value="1" class="qty"></td>
                    <td><input type="number" name="rate[]" class="rate" readonly></td>
                    <td><input type="number" name="amount[]" class="amount" readonly></td>
                    <td><button type="button" class="btn remove-btn">Remove</button></td>
                `;

                // Attach event listeners for the new row
                const qtyInput = newRow.querySelector('.qty');
                qtyInput.addEventListener('input', () => calculateAmount(newRow));

                const removeBtn = newRow.querySelector('.remove-btn');
                removeBtn.addEventListener('click', function() {
                    newRow.remove();
                    calculateTotals();
                });

                // Initialize the rate when the row is added
                updateRate(newRow.querySelector('.product-select'));
            });

            productsTable.querySelectorAll('tr').forEach(row => {
                row.querySelector('.qty').addEventListener('input', () => calculateAmount(row));
                row.querySelector('.rate').addEventListener('input', () => calculateAmount(row));
                row.querySelector('.remove-btn').addEventListener('click', function() {
                    row.remove();
                    calculateTotals();
                });
            });

            document.getElementById('discount').addEventListener('input', calculateTotals);
        });
        
        
        
        
        
        //jquery
        

function updateRate(selectElement) {
    var productID = selectElement.value;

    // Send an AJAX request to the Spring MVC controller
    $.ajax({
        url: '/QuotationProject/getProductPrice', // Spring MVC controller URL
        type: 'GET',
        data: { productID: productID },
        success: function(response) {
            var price = response.price;
           
            // Update the rate field with the returned price
            $(selectElement).closest('tr').find('.rate').val(price);

            // Optionally update the 'amount' field based on the quantity and price
            var qty = $(selectElement).closest('tr').find('.qty').val();
            var amount = qty * price;
            $(selectElement).closest('tr').find('.amount').val(amount);
        },
        error: function(err) {
            console.error("Error fetching price:", err);
        }
    });
}

// Optional: Recalculate amount when quantity changes
$(document).on('input', '.qty', function() {
    var row = $(this).closest('tr');
    var qty = $(this).val();
    var rate = row.find('.rate').val();
    var amount = qty * rate;
    row.find('.amount').val(amount);
});
    </script>
</body>

</html>