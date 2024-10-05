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
	height: 600px;
	display: flex;
	justify-content: space-between;
	padding: 20px;
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

/* Table Styling */
.kanban-board table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	font-size: 16px;
	min-width: 400px;
	border-radius: 5px 5px 0 0;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.kanban-board th, .kanban-board td {
	padding: 12px 15px;
	text-align: left;
}

.kanban-board th {
	background-color: #3D329B;
	color: #ffffff;
	font-weight: bold;
	text-transform: uppercase;
}

.kanban-board td {
	background-color: #ffffff;
	color: #333333;
}

.kanban-board tr:nth-child(even) {
	background-color: #f2f2f2;
}

.kanban-board tr:hover {
	background-color: #e0e0e0;
}

.kanban-board tr td:first-child {
	font-weight: bold;
}

.kanban-board tbody tr:hover {
	background-color: #f1f1f1;
	color: #333;
	cursor: pointer;
}

/* Optional - Style for the table borders */
.kanban-board table, .kanban-board th, .kanban-board td {
	border: 1px solid #ddd;
}

/* Make the table responsive on smaller screens */
@media ( max-width : 768px) {
	.kanban-board table {
		width: 100%;
	}
	.kanban-board th, .kanban-board td {
		padding: 10px;
		font-size: 14px;
	}
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
				<h1>Quote List</h1>
			</div>



			<div class="kanban-board">
				<table border="1" width="100%"
					style="border-collapse: collapse; text-align: left;">
					<thead>
						<tr>
							<th>Quote ID</th>
							<th>Customer Name</th>
							<th>Quote Date</th>
							<th>Status</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<!-- Loop through qDetails to create dynamic rows for the table -->
						<c:forEach var="quote" items="${qDetails}">
							
							<tr>
							
								<td><a
									href="goToFullDetails?quoteID=<c:out value='${quote.quoteID}' />"
									style="text-decoration: none"><c:out value="${quote.quoteID}" /></a></td>
								<td><c:out value="${quote.custName}" /></td>
								<td><c:out value="${quote.quoteDate}" /></td>
								<td><c:out value="${quote.status}" /></td>
								<td><c:out value="${quote.grandTotal}" /></td>
							
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>

	</div>

</body>

</html>