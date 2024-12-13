<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecom.dao.CompanyDAOImpl" %>
<%@ page import="com.ecom.dao.CompanyDAO" %>
<%@ page import="com.ecom.dto.Location" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff; /* Light background color */
            color: #333;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .alert {
            margin-top: 20px;
        }

        .container {
            margin-top: 50px;
        }

        h3.success {
            color: green;
        }

        h3.failure {
            color: red;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="container my-5">
    <% if (request.getAttribute("success") != null) { %>
        <div class="alert alert-success">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>
    <% if (request.getAttribute("failure") != null) { %>
        <div class="alert alert-danger">
            <%= request.getAttribute("failure") %>
        </div>
    <% } %>

    <% String locationId = request.getParameter("locationId"); 
       int LId = 0;
       if (locationId != null) { 
           LId = Integer.parseInt(locationId);
       } %>

    <% CompanyDAO dao = new CompanyDAOImpl(); 
       Location l = dao.getLocation(LId); 
    %>

    <% if (l != null) { %>
        <div class="card">
            <div class="card-header">
                <h4>Update Location</h4>
            </div>
            <div class="card-body">
                <form action="salesman" method="post">
                    <input type="hidden" name="LId" value="<%= LId %>">
                    <div class="mb-3">
                        <label for="location" class="form-label">Location Name</label>
                        <input type="text" class="form-control" id="location" name="location" value="<%= l.getLocation() %>">
                    </div>
                    <div class="mb-3">
                        <label for="city" class="form-label">City</label>
                        <input type="text" class="form-control" id="city" name="city" value="<%= l.getCity() %>">
                    </div>
                    <div class="mb-3">
                        <label for="state" class="form-label">State</label>
                        <input type="text" class="form-control" id="state" name="state" value="<%= l.getState() %>">
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary" onclick="window.history.go(-1)">Back</button>
                        <button type="submit" class="btn btn-primary" name="ledit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>
