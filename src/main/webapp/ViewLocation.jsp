<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.Iterator" %> 
<%@ page import="com.ecom.dao.CompanyDAOImpl" %>
<%@ page import="com.ecom.dao.CompanyDAO" %>
<%@ page import="com.ecom.dto.Location" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Location</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        /* Custom Styles */
        body {
            background-color: #f8f9fa; /* Soft background */
            color: #333; /* Dark text color for better readability */
        }
        
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #2c3e50; /* Darker text for headers */
            font-weight: 500;
        }

        .table th {
            background-color: #3498db; /* Blue header */
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1; /* Hover effect */
        }

        .btn-danger {
            background-color: #e74c3c;
            border-color: #c0392b;
        }

        .btn-danger:hover {
            background-color: #c0392b;
            border-color: #a7281f;
        }

        .modal-header {
            background-color: #3498db;
            color: white;
            border-bottom: none;
        }

        .modal-footer {
            background-color: #ecf0f1;
            border-top: none;
        }

        .alert {
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* Modal adjustments */
        .modal-content {
            border-radius: 8px;
        }

        .btn-close {
            background-color: transparent;
        }
    </style>
</head>
<body>

<div class="container my-5">
    <!-- Title for the page -->
    <h2 class="mb-4">Locations Overview</h2>
    
    <% if (request.getAttribute("success") != null) { %>
        <div class="alert alert-success" role="alert">
            <%= request.getAttribute("success") %>
        </div>
        <% response.sendRedirect("ViewLocation.jsp"); %>
    <% } %>
    <% if (request.getAttribute("failure") != null) { %>
        <div class="alert alert-danger" role="alert">
            <%= request.getAttribute("failure") %>
        </div>
        <% response.sendRedirect("ViewLocation.jsp"); %>
    <% } %>

    <!-- Search bar for filtering -->
    <input class="form-control mb-3" id="search" type="text" placeholder="Search for locations...">

    <!-- Table for displaying locations -->
    <table id="locationTable" class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>LID</th>
                <th>Location</th>
                <th>City</th>
                <th>State</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody id="table">
        <%
        CompanyDAO dao = new CompanyDAOImpl();
        List<Location> locations = dao.getLocation();
        
        if (locations != null && !locations.isEmpty()) {
            Iterator<Location> itr = locations.iterator();
            while (itr.hasNext()) {
                Location l = itr.next();
        %>
            <tr>
                <td><%= l.getLid() %></td>
                <td><%= l.getLocation() %></td>
                <td><%= l.getCity() %></td>
                <td><%= l.getState() %></td>
                <td>
                    <button class="btn btn-primary btn-sm">
                        <a href="LocationEdit.jsp?locationId=<%= l.getLid() %>" class="text-white text-decoration-none">Edit</a>
                    </button>
                </td>
                <td>
                    <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#myModal<%= l.getLid() %>">Delete</button>
                    
                    <div class="modal fade" id="myModal<%= l.getLid() %>" tabindex="-1" aria-labelledby="modalLabel<%= l.getLid() %>" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel<%= l.getLid() %>">Confirm Deletion</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete <%= l.getLocation() %>?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <form action="salesman" method="post">
                                        <input type="hidden" name="id" value="<%= l.getLid() %>">
                                        <button type="submit" class="btn btn-danger" name="ldelete">Delete</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        <%
            }
        } else {
        %>
            <tr>
                <td colspan="6" class="text-center">No locations available.</td>
            </tr>
        <% } %>
            <tr>
                <td colspan="6" class="text-center">
                    <button type="button" class="btn btn-secondary" onclick="history.back()">Back</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<script>
$(document).ready(function(){
    $("#search").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#table tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});
</script>
</body>
</html>
