<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
 <style>
        /* admin_dashboard.css */
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        
        header {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 8px;
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
        
        main {
            margin-top: 20px;
        }
        
        .kpi-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        
        .kpi-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            flex: 1;
            margin: 10px;
            min-width: 220px;
            text-align: center;
            transition: transform 0.2s;
        }
        
        .kpi-card:hover {
            transform: scale(1.05);
        }
        
        .kpi-card h2 {
            font-size: 18px;
            color: #333;
        }
        
        .kpi-value {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }
        
        .kanban-report {
            margin-top: 40px;
            display: flex;
            justify-content: space-between;
        }
        
        .kanban-column {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            flex: 1;
            margin: 10px;
        }
        
        .kanban-column h3 {
            color: #007bff;
            text-align: center;
        }
        
        .kanban-column p {
            text-align: center;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>

<body>

    <div class="container">
        <header>
            <h1>Admin Dashboard</h1>
            <nav>
                <ul>
                    <li><a href="kanbanView">Quote Kanban</a></li>
                    <li><a href="goForQuote">Create Quote</a></li>
            
                </ul>
            </nav>
        </header>

        <main>
            <div class="kpi-container">
                <div class="kpi-card">
                    <h2>Total Open Quotes</h2>
                    <p class="kpi-value">15</p>
                </div>
                <div class="kpi-card">
                    <h2>Conversion Ratio</h2>
                    <p class="kpi-value">60%</p>
                </div>
                <div class="kpi-card">
                    <h2>Rejection Ratio</h2>
                    <p class="kpi-value">20%</p>
                </div>
                <div class="kpi-card">
                    <h2>Quoted Amount This Month</h2>
                    <p class="kpi-value">$10,000</p>
                </div>
            </div>

            <h2>Quote Kanban Report</h2>
            <div class="kanban-report">
                <div class="kanban-column">
                    <h3>Draft</h3>
                    <p>5 Quotes</p>
                </div>
                <div class="kanban-column">
                    <h3>Sent</h3>
                    <p>7 Quotes</p>
                </div>
                <div class="kanban-column">
                    <h3>Accepted</h3>
                    <p>2 Quotes</p>
                </div>
                <div class="kanban-column">
                    <h3>Rejected</h3>
                    <p>1 Quote</p>
                </div>
            </div>
        </main>
    </div>

</body>

</html>