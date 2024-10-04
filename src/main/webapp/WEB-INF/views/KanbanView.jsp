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
<title>Quote Kanban View</title>
<!-- Link to external CSS file -->
<link rel="stylesheet" type="text/css" href="/kanban_view.css">

<style type="text/css">
/* General button styling */
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	padding: 20px;
}

h2 {
	text-align: center;
	color: #007bff;
	margin-bottom: 20px;
}

.kanban-board {
	display: flex;
	justify-content: space-between;
}

.kanban-column {
	width: 23%;
	background-color: #ffffff;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.kanban-column h3 {
	text-align: center;
	background-color: #007bff;
	color: white;
	padding: 10px;
	border-radius: 4px;
}

.kanban-cards {
	margin-top: 10px;
	max-height: 400px;
	overflow-y: auto;
}

.kanban-card {
	background-color: #f2f2f2;
	border-radius: 8px;
	padding: 10px;
	margin-bottom: 10px;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.kanban-card:hover {
	transform: scale(1.02);
}

.kanban-card h4 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

.kanban-card p {
	margin: 5px 0;
	font-size: 14px;
}

.view-btn {
	display: block;
	width: 100%;
	background-color: #28a745;
	color: white;
	padding: 10px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
	margin-top: 10px;
	text-align: center;
}

.view-btn:hover {
	background-color: #218838;
}

button {
	padding: 8px 12px;
	font-size: 14px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
}
/* View Details button */
.view-btn {
	background-color: #007bff;
	color: white;
}

.view-btn:hover {
	background-color: #0056b3;
}
/* Send button */
.send-btn {
	background-color: #28a745;
	color: white;
}

.send-btn:hover {
	background-color: #218838;
}
/* Accept button */
.accept-btn {
	background-color: #17a2b8;
	color: white;
}

.accept-btn:hover {
	background-color: #138496;
}
/* Reject button */
.reject-btn {
	background-color: #dc3545;
	color: white;
}

.reject-btn:hover {
	background-color: #c82333;
}
/* Align buttons if needed */
button+button {
	margin-left: 10px;
}

header {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-radius: 8px;
	margin-bottom: 20px;
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
		<h1>Kanban Veiw Report</h1>
		<nav>
			<ul>
				<li><a href="dashBoard">Dashboard</a></li>
				<li><a href="goForQuote">Create Quote</a></li>

			</ul>
		</nav>
	</header>

	<div class="kanban-board">
		<!-- Draft Quotes Column -->
		<div class="kanban-column draft">
			<h3>Draft</h3>
			<div class="kanban-cards">
				<!-- Loop through qDetails and create Kanban cards using c:forEach -->
				<c:forEach var="quote" items="${qDetails}">
					<div class="kanban-card">
						<h4>
							Quote #
							<c:out value="${quote.quoteID}" />
						</h4>
						<p>
							<strong>Customer:</strong>
							<c:out value="${quote.custName}" />
						</p>
						<p>
							<strong>Amount:</strong>  Rs.
							<c:out value="${quote.amount}" />
						</p>
						<p>
							<strong>Status:</strong>
							<c:out value="${quote.status}" />
						</p>
						<a
							href="goToFullDetails?quoteID=<c:out value='${quote.quoteID}' />" style="text-decoration: none">
							<button class="view-btn">View Details</button>
						</a>
						<!-- Send button added -->
						<button class="send-btn">Send</button>
					</div>
				</c:forEach>
			</div>
		</div>


		<!-- Sent Quotes Column -->
		<div class="kanban-column sent">
			<h3>Sent</h3>
			<div class="kanban-cards">
				<div class="kanban-card">
					<h4>Quote #91011</h4>
					<p>
						<strong>Customer:</strong> XYZ Corp
					</p>
					<p>
						<strong>Amount:</strong> $2,500
					</p>
					<p>
						<strong>Status:</strong> Sent
					</p>
					<button class="view-btn">View Details</button>
					<!-- Accept and Reject buttons added -->
					<button class="accept-btn">Accept</button>
					<button class="reject-btn">Reject</button>
				</div>
			</div>
		</div>

		<!-- Accepted Quotes Column -->
		<div class="kanban-column accepted">
			<h3>Accepted</h3>
			<div class="kanban-cards">
				<div class="kanban-card">
					<h4>Quote #121314</h4>
					<p>
						<strong>Customer:</strong> Acme Corp
					</p>
					<p>
						<strong>Amount:</strong> $3,500
					</p>
					<p>
						<strong>Status:</strong> Accepted
					</p>
					<button class="view-btn">View Details</button>
				</div>
			</div>
		</div>

		<!-- Rejected Quotes Column -->
		<div class="kanban-column rejected">
			<h3>Rejected</h3>
			<div class="kanban-cards">
				<div class="kanban-card">
					<h4>Quote #151617</h4>
					<p>
						<strong>Customer:</strong> Sample Company
					</p>
					<p>
						<strong>Amount:</strong> $500
					</p>
					<p>
						<strong>Status:</strong> Rejected
					</p>
					<button class="view-btn">View Details</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>