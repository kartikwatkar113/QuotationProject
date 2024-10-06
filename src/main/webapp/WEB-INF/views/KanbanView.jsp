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
<title>Admin Dashboard</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	position: fixed;
	width: 100%;
}
/* Admin Dashboard Title */
.dashboard-title {
	/* text-align: center; */
	padding-left: 10px;
	font-size: 25px;
	font-weight: bold;
	margin: 20px 0;
}

.dashboard-container {
	display: flex;
	border: 1px solid #ccc;
	/* Box border for the whole page */
	/* border-radius: 10px; */
	overflow: hidden;
	background-color: white;
	/* Background color for the box */
}

.sidebar {
	background-color: #3D329B;
	color: white;
	width: 250px;
	/* Increased sidebar width */
	padding: 10px;
	height: 100vh;
}

.sidebar h2 {
	font-size: 23px;
	margin-bottom: 20px;
	padding-top: 20px;
}

.sidebar ul {
	list-style: none;
}

.sidebar ul li {
	margin-bottom: 10px;
	font-size: 20px;
	border-bottom: 1px solid #fff;
	padding-bottom: 20px;
	padding-top: 20px;
}

.sidebar ul li a {
	text-decoration: none;
	color: white;
}

.main-content {
	margin-left: 10px;
	/* Adjusted to account for increased sidebar width */
	padding: 10px;
	width: calc(100% - 270px);
	/* Adjusted width calculation */
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.header h1 {
	font-size: 25px;
}

.add-quote-btn {
	background-color: #3D329B;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	width: 120px;
	height: 40px;
}

.stats-container {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	margin-bottom: 10px;
}

.stat-box {
	background-color: white;
	padding: 15px;
	border: 2px solid #3D329B;
	border-radius: 10px;
	text-align: center;
	width: 22%;
	height: 100px;
	margin-bottom: 10px;
}

.stat-box h2 {
	font-size: 30px;
	margin-bottom: 5px;
}

.stat-box p {
	font-size: 20px;
}
/* Responsive Design */
@media ( max-width : 768px) {
	.sidebar {
		width: 180px;
	}
	.main-content {
		margin-left: 200px;
		width: calc(100% - 200px);
	}
	.stat-box {
		width: 48%;
	}
}

@media ( max-width : 480px) {
	.sidebar {
		width: 100px;
	}
	.main-content {
		margin-left: 120px;
		width: calc(100% - 120px);
	}
	.dashboard-title {
		font-size: 24px;
	}
	.header h1 {
		font-size: 18px;
	}
	.add-quote-btn {
		padding: 8px 12px;
		font-size: 14px;
	}
	.stat-box {
		width: 100%;
	}
}

.kanban-board {
	background-color: #E5E5E5;
	height: 600px;
	display: flex;
	justify-content: space-between;
	border: 1px solid #000;
	padding: 30px;
}
/* .kanban-board {
            display: flex;
            justify-content: space-between;
        } */
.kanban-board .kanban-column {
	width: 23%;
	background-color: #ffffff;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	height: 550px; /* Fixed height for the column */
	display: flex; /* Use flexbox for layout */
	flex-direction: column; /* Arrange items in a column */
}

.kanban-board .kanban-column h3 {
	text-align: center;
	background-color: #007bff;
	color: white;
	padding: 10px;
	border-radius: 4px;
	margin: 0; /* Remove margin to ensure consistent height */
}

.kanban-board .kanban-cards {
	margin-top: 10px;
	flex: 1; /* Make the cards section take remaining space */
	overflow-y: auto; /* Enable vertical scrolling */
	overflow-x: hidden; /* Hide horizontal overflow */
}

.kanban-board .kanban-card {
	background-color: #f2f2f2;
	border-radius: 8px;
	padding: 10px;
	margin-bottom: 10px;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.kanban-board .kanban-card:hover {
	transform: scale(1.02);
}

.kanban-board .kanban-card h4 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

.kanban-board .kanban-card p {
	margin: 5px 0;
	font-size: 14px;
}

.view-btn {
	display: block;
	width: 100%;
	background-color: #28a745;
	color: white;
	/* padding: 10px; */
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 15px;
	margin-top: 10px;
	text-align: center;
	height: 30px;
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
	background-color: #555555;
	color: white;
}

.view-btn:hover {
	background-color: #555555;
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
</style>
</head>

<body>


	<div class="dashboard-container">
		<div class="sidebar">
			<ul>
				<li><a href="kanbanView">Dashboard</a></li>
				<li><a href="QuoteLIst">Quotes</a></li>
			</ul>
		</div>

		<div class="main-content">
			<div class="header">
				<h1>Hi, John Doe</h1>
				<a class="add-quote-btn" href="goForQuote"
					style="text-decoration: none">Add Quote</a>
			</div>

			<div class="stats-container">
				<div class="stat-box">
					<h2>${count.openQuotes}</h2>
					<p>Total Open Quotes</p>
				</div>
				<div class="stat-box">
					<h2>${count.conversionRatio}</h2>
					<p>Conversion Ratio</p>
				</div>
				<div class="stat-box">
					<h2>${count.rejectionRatio}</h2>
					<p>Rejection Ratio</p>
				</div>
				<div class="stat-box">
					<h2>${count.quotedCurMoth}</h2>
					<p>Total Quoted this month</p>
				</div>
			</div>


			<div class="kanban-board">
				<div class="kanban-column draft">
					<h3>Draft</h3>
					<div class="kanban-cards">
						<!-- Loop through qDetails and create Kanban cards using c:forEach -->
						<c:forEach var="quote" items="${qDetails}">

							<div class="kanban-card">

								<a
									href="goToFullDetails?quoteID=<c:out value='${quote.quoteID}' />"
									style="text-decoration: none">
									<h2 style="text-align: center; color: black;">
										<c:out value="${quote.custName}" />
									</h2>
									<p style="text-align: center; color: black;">
										<c:out value="${quote.custaddress}" />
									</p>
								</a>
								<!-- Send button added -->
								<button class="send-btn" data-id="${quote.quoteID}">Send</button>
							</div>

						</c:forEach>
					</div>
				</div>


				<!-- Sent Quotes Column -->
				<div class="kanban-column sent">
					<h3>Sent</h3>
					<div class="kanban-cards">
						<!-- Loop through qDetails and create Kanban cards using c:forEach -->
						<c:forEach var="sendQuote" items="${sendQDetails}">

							<div class="kanban-card">

								<a
									href="goToFullDetails?quoteID=<c:out value='${sendQuote.quoteID}' />"
									style="text-decoration: none">
									<h2 style="text-align: center; color: black;">
										<c:out value="${sendQuote.custName}" />
									</h2>
									<p style="text-align: center; color: black;">
										<c:out value="${sendQuote.custaddress}" />
									</p>
								</a>
								<!-- Send button added -->

								<button class="accept-btn" data-id="${sendQuote.quoteID}">Accept</button>
								<button class="reject-btn" data-id="${sendQuote.quoteID}">Reject</button>
							</div>

						</c:forEach>
					</div>
				</div>

				<!-- Accepted Quotes Column -->
				<div class="kanban-column accepted">
					<h3>Accepted</h3>
					<div class="kanban-cards">
						<!-- Loop through qDetails and create Kanban cards using c:forEach -->
						<c:forEach var="acceptQuote" items="${acceptQDetails}">

							<div class="kanban-card">

								<a
									href="goToFullDetails?quoteID=<c:out value='${acceptQuote.quoteID}' />"
									style="text-decoration: none">
									<h2 style="text-align: center; color: black;">
										<c:out value="${acceptQuote.custName}" />
									</h2>
									<p style="text-align: center; color: black;">
										<c:out value="${acceptQuote.custaddress}" />
									</p>
								</a>
								<!-- Send button added -->
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- Rejected Quotes Column -->
				<div class="kanban-column rejected">
					<h3>Rejected</h3>
					<div class="kanban-cards">
						<!-- Loop through qDetails and create Kanban cards using c:forEach -->
						<c:forEach var="rejectQuote" items="${rejectQDetails}">

							<div class="kanban-card">

								<a
									href="goToFullDetails?quoteID=<c:out value='${rejectQuote.quoteID}' />"
									style="text-decoration: none">
									<h2 style="text-align: center; color: black;">
										<c:out value="${rejectQuote.custName}" />
									</h2>
									<p style="text-align: center; color: black;">
										<c:out value="${rejectQuote.custaddress}" />
									</p>
								</a>
								<!-- Send button added -->
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			// Handle the click event for the send button
			$('.send-btn').click(function() {
				var quoteID = $(this).data('id'); // Get the quoteID from the button's data attribute

				// Send the quoteID to the sendController using AJAX
				$.ajax({
					url : '/QuotationProject/sendController', // URL of the controller
					type : 'GET',
					data : {
						quoteID : quoteID
					},
					success : function(response) {
						// Handle success response
						if (response === "Success") {

							// Optionally, you could reload the Kanban board or move the item dynamically
							// e.g., $(this).closest('.kanban-card').appendTo('.kanban-column.sent .kanban-cards');
							location.reload(); // Reload the page to reflect the changes
						} else {
							alert("Failed to send quote. Please try again.");
						}
					},
					error : function(xhr, status, error) {
						// Handle error response
						console.error("Error sending quote:", error);
						alert("Failed to send quote. Please try again.");
					}
				});
			});
		});

		$(document).ready(function() {
			// Handle the click event for the send button
			$('.accept-btn').click(function() {
				var quoteID = $(this).data('id'); // Get the quoteID from the button's data attribute

				// Send the quoteID to the sendController using AJAX
				$.ajax({
					url : '/QuotationProject/acceptController', // URL of the controller
					type : 'GET',
					data : {
						quoteID : quoteID
					},
					success : function(response) {
						// Handle success response
						if (response === "Success") {

							// Optionally, you could reload the Kanban board or move the item dynamically
							// e.g., $(this).closest('.kanban-card').appendTo('.kanban-column.sent .kanban-cards');
							location.reload(); // Reload the page to reflect the changes
						} else {
							alert("Failed to send quote. Please try again.");
						}
					},
					error : function(xhr, status, error) {
						// Handle error response
						console.error("Error sending quote:", error);
						alert("Failed to send quote. Please try again.");
					}
				});
			});
		});

		$(document).ready(function() {
			// Handle the click event for the send button
			$('.reject-btn').click(function() {
				var quoteID = $(this).data('id'); // Get the quoteID from the button's data attribute

				// Send the quoteID to the sendController using AJAX
				$.ajax({
					url : '/QuotationProject/rejectController', // URL of the controller
					type : 'GET',
					data : {
						quoteID : quoteID
					},
					success : function(response) {
						// Handle success response
						if (response === "Success") {

							// Optionally, you could reload the Kanban board or move the item dynamically
							// e.g., $(this).closest('.kanban-card').appendTo('.kanban-column.sent .kanban-cards');
							location.reload(); // Reload the page to reflect the changes
						} else {
							alert("Failed to send quote. Please try again.");
						}
					},
					error : function(xhr, status, error) {
						// Handle error response
						console.error("Error sending quote:", error);
						alert("Failed to send quote. Please try again.");
					}
				});
			});
		});
	</script>
</body>

</html>