<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Location</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; /* Light background color for the page */
            color: #495057; /* Dark text color for better readability */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff; /* White background for the form */
            border-radius: 10px;
            box-shadow: 0px 12px 30px rgba(0, 0, 0, 0.15); /* Enhanced box-shadow */
            transition: box-shadow 0.3s ease-in-out;
        }

        .container:hover {
            box-shadow: 0px 15px 35px rgba(0, 0, 0, 0.2); /* Hover effect for more depth */
        }

        h2 {
            color: #007bff; /* Color for the title */
            text-align: center;
            margin-bottom: 30px;
        }

        h3.success {
            color: #28a745;
            text-align: center;
            margin-bottom: 20px;
        }

        h3.failure {
            color: #dc3545;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            font-size: 1.1rem;
            color: #495057;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            background-color: #f1f3f5; /* Light background for inputs */
            border: 1px solid #ccc;
            color: #495057;
            font-size: 1rem;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .form-control:focus {
            background-color: #ffffff; /* White background on focus */
            border-color: #80bdff; /* Blue border on focus */
            color: #495057;
        }

        .btn-custom {
            border-radius: 8px;
            padding: 12px 25px;
            cursor: pointer;
            font-size: 1.1rem;
            width: 100%;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: scale(1.05); /* Scale-up effect */
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
            font-weight: bold;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
            transform: scale(1.05); /* Scale-up effect */
        }

        .btn-group {
            display: flex;
            gap: 15px;
            justify-content: space-between;
        }
    </style>
</head>
<body>

<% if (request.getAttribute("success") != null) { %>
    <h3 class="success"><%= request.getAttribute("success") %></h3>
<% } %>

<% if (request.getAttribute("failure") != null) { %>
    <h3 class="failure"><%= request.getAttribute("failure") %></h3>
<% } %>

<div class="container">
    <form action="salesman" method="post">
        <h2>Insert Location</h2>
        
        <div class="mb-3">
            <label for="location" class="form-label">Location Name</label>
            <input type="text" class="form-control" id="location" name="location" required>
        </div>

        <div class="mb-3">
            <label for="city" class="form-label">City Name</label>
            <input type="text" class="form-control" id="city" name="city" required>
        </div>

        <div class="mb-3">
            <label for="state" class="form-label">State Name</label>
            <input type="text" class="form-control" id="state" name="state" required>
        </div>

        <div class="btn-group">
            <button type="button" class="btn btn-danger" onclick="window.history.go(-1)">Back</button>
            <button type="submit" class="btn btn-primary" name="insertlocation">Submit</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
