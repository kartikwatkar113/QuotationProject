<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detailed Quotation View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        
        header h1 {
            color: #007bff;
        }
        
        .quotation-details {
            margin-top: 20px;
        }
        
        .quote-info {
            margin-bottom: 20px;
        }
        
        .product-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        .product-table th,
        .product-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        
        .product-table th {
            background-color: #007bff;
            color: white;
        }
        
        .totals {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            padding: 10px;
            border-top: 2px solid #007bff;
        }
        
        .total-item {
            flex: 1;
        }
        
        .grand-total {
            font-weight: bold;
            color: #28a745;
        }
        
        .footer {
            text-align: center;
            margin-top: 20px;
            font-style: italic;
        }
    </style>
</head>

<body>

    <div class="container">
        <header>
            <h1>Quotation Details</h1>
        </header>

        <div class="quotation-details">
            <div class="quote-info">
                <h2>Quote #1234</h2>
                <p><strong>Customer:</strong> John Doe</p>
                <p><strong>Quote Date:</strong> <span id="quoteDate">2024-10-01</span></p>
                <p><strong>Status:</strong> Draft</p>
                <p><strong>Discount:</strong> 10%</p>
            </div>

            <h3>Product Details</h3>
            <table class="product-table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Rate</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Product A</td>
                        <td>2</td>
                        <td>$100</td>
                        <td>$200</td>
                    </tr>
                    <tr>
                        <td>Product B</td>
                        <td>1</td>
                        <td>$150</td>
                        <td>$150</td>
                    </tr>
                </tbody>
            </table>

            <div class="totals">
                <div class="total-item">
                    <p><strong>Subtotal:</strong> $350</p>
                </div>
                <div class="total-item">
                    <p><strong>Discount (10%):</strong> -$35</p>
                </div>
                <div class="total-item grand-total">
                    <p><strong>Grand Total:</strong> $315</p>
                </div>
            </div>
        </div>

        <div class="footer">
            <p>Thank you for choosing our services!</p>
        </div>
    </div>

</body>

</html>