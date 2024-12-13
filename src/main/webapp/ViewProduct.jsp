<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.Iterator" %> 
<%@ page import="com.ecom.dao.CompanyDAOImpl" %>
<%@ page import="com.ecom.dao.CompanyDAO" %>
<%@ page import="com.ecom.dto.Product" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    /* Custom Theme */
    body {
        background-color: #f7f7f7; /* Light gray background */
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .container {
        background-color: #ffffff;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #2c3e50; /* Dark blue for headings */
    }

    .table thead {
        background-color: #007bff; /* Bootstrap Primary Blue */
        color: white;
    }

    .table tbody tr:hover {
        background-color: #f1f1f1; /* Light gray hover */
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #0056b3;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }

    .btn-danger {
        background-color: #dc3545;
        border-color: #c82333;
    }

    .btn-danger:hover {
        background-color: #c82333;
        border-color: #bd2130;
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border-color: #c3e6cb;
    }

    .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
        border-color: #f5c6cb;
    }

    .modal-content {
        border-radius: 8px;
    }

    .modal-header {
        background-color: #007bff;
        color: white;
    }

    .modal-footer {
        background-color: #f8f9fa;
    }

    /* Search Box Styling */
    #search {
        margin-bottom: 20px;
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ddd;
        font-size: 16px;
    }

    /* Button Styling */
    .btn-back {
        background-color: #6c757d;
        color: white;
        border-radius: 5px;
    }

    .btn-back:hover {
        background-color: #5a6268;
    }
</style>
</head>
<body>

<div class="container my-5">
    <h2 class="text-center mb-4">Product List</h2>

    <% if(request.getAttribute("success") != null) { %>
        <div class="alert alert-success" role="alert"><%= request.getAttribute("success") %></div>
        <% response.sendRedirect("ViewProduct.jsp"); %>
    <% } %>
    <% if(request.getAttribute("failure") != null) { %>
        <div class="alert alert-danger" role="alert"><%= request.getAttribute("failure") %></div>
        <% response.sendRedirect("ViewProduct.jsp"); %>
    <% } %>

    <!-- Search bar -->
    <input class="form-control mb-3" id="search" type="text" placeholder="Search products...">

    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody id="table">
            <% 
            CompanyDAO dao = new CompanyDAOImpl();
            List<Product> products = dao.getProduct(); 
            if (products != null && !products.isEmpty()) {
                Iterator<Product> itr = products.iterator(); 
                while (itr.hasNext()) { 
                    Product p = itr.next(); 
            %>
            <tr>
                <td><%= p.getProductId() %></td> 
                <td><%= p.getP_Name() %></td>    
                <td><%= p.getPrice() %></td>  
                <td>
                    <a href="ProductEdit.jsp?productId=<%= p.getProductId() %>" class="btn btn-primary btn-sm">Edit</a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#myModal<%= p.getProductId() %>">Delete</button>
                    <!-- Modal for confirmation -->
                    <div class="modal fade" id="myModal<%= p.getProductId() %>" tabindex="-1" aria-labelledby="modalLabel<%= p.getProductId() %>" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel<%= p.getProductId() %>">Confirm Deletion</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete <strong><%= p.getP_Name() %></strong>?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <form action="salesman" method="post" style="display: inline;">
                                        <input type="hidden" name="id" value="<%= p.getProductId() %>">
                                        <button type="submit" class="btn btn-danger" name="pdelete">Delete</button>
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
                <td colspan="5" class="text-center text-danger">No products available.</td> 
            </tr>
            <% } %>
            <tr>
                <td colspan="5">
                    <button type="button" onclick="history.back()" class="btn btn-back">Back</button>
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
