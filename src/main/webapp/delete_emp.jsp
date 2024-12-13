<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@page import="com.ecom.dto.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>DELETE EMPLOYEE</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
        text-align: center;
    }
    .form-container {
        width: 500px;
        margin: 40px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    .form-group label {
        width: 30%;
        font-weight: bold;
        text-align: right;
        margin-right: 10px;
    }
    .form-group input,
    .form-group select {
        width: 70%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .card {
        max-width: 500px;
        margin: 20px auto;
        padding: 20px;
    }
    .card-header {
        background-color: #007bff;
        color: white;
        font-size: 1.5rem;
    }
    .card-body p {
        font-size: 1.1rem;
    }
    .btn-block {
        width: 100%;
        padding: 12px;
        font-weight: bold;
        border-radius: 5px;
    }
    .btn-danger {
        background-color: red;
        color: white;
    }
    .btn-secondary {
        background-color: grey;
        color: white;
    }
    #msg {
        background: green;
        color: black;
        border: 1px solid green;
        width: 24%;
        font-weight: bold;
        font-size: 20px;
        padding: 5px;
        margin: 5px auto;
    }
</style>
</head>
<body>
<header>
</header>

<center>
    <% if (request.getAttribute("status") != null) { %>
        <div id="msg"><%= request.getAttribute("status") %></div>
    <% } %>
</center>

<div class="form-container">
    <form action="emp" method="post">
        <div class="form-group">
            <label for="id">Employee ID:</label>
            <input type="tel" name="eid" id="id" placeholder="Enter Employee ID" required>
        </div>
        <button name="search_emp" class="btn btn-primary btn-block">Search for Deletion</button>
        <h5>or</h5>
        <button type="button" class="btn btn-secondary btn-block" onclick="window.history.back()">Back</button>
    </form>
</div>

<% 
    Employee Employee_del = (Employee) request.getAttribute("delEmp");
    if (Employee_del != null) { 
%>
    <div id="employeeDetails" class="container">
        <div class="card">
            <div class="card-header">
                <h3>Employee Details</h3>
            </div>
            <div class="card-body">
                <p><strong>ID:</strong> <%= Employee_del.getEmpid() %></p>
                <p><strong>Name:</strong> <%= Employee_del.getFname() + " " + Employee_del.getLname() %></p>
                <p><strong>Job Role:</strong> <%= Employee_del.getJob() %></p>
                <p><strong>Salary:</strong> <%= Employee_del.getSal() %></p>
                <p><strong>Phone:</strong> <%= Employee_del.getPhone() %></p>
                
                <!-- Delete Confirmation Form -->
                <form action="emp" method="post">
                    <input type="hidden" name="eid" value="<%= Employee_del.getEmpid() %>" />
                    <button name="delete_emp" class="btn btn-danger btn-block">Confirm Delete</button>
                </form>
                <button class="btn btn-secondary btn-block" onclick="window.history.go(-1)">Back</button>
            </div>
        </div>
    </div>
<% } %>

<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

</body>
</html>
