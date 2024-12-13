<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecom.dto.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; 
        }
        h1 {
            color: #343a40; 
        }
        .container {
            background-color: #ffffff; 
            border-radius: 10px; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
            padding: 20px; 
        }
        table {
            width: 100%;
            margin-top: 20px; 
            border-collapse: collapse; 
        }
        th, td {
            padding: 12px; 
            text-align: left; 
            border: 1px solid #dee2e6; 
        }
        th {
            background-color: #007bff; 
            color: black; 
            font-weight: bold; 
        }
        #msg {
            width: 100%;
            margin: 20px auto;
            padding: 10px;
            background-color: #28a745; 
            color: white; 
            text-align: center; 
            border-radius: 5px; 
        }
    </style>
    <script>
        function toggleButton() {
            var btn = document.getElementById("Toggle");
            const frame = document.getElementById("update-div");
            frame.style.display = frame.style.display === 'none' || frame.style.display === '' ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <div class="container my-1">
        <h1 class="text-center">Employee Profile</h1>
        <%
            Employee employee = (Employee) session.getAttribute("employee");

            if (employee != null) {
        %>
        <% if (session.getAttribute("status") != null) { %>
            <div id="msg"><%= session.getAttribute("status") %></div>
        <% } %>
        <div class="container form-control shadow p-4" style="display: none;" id="update-div">
            <form action="login" method="post">
                <div class="form-group mb-3">
                    <label>Update First Name:</label>
                    <input type="text" name="fname" value="<%= employee.getFname() %>" class="form-control" required>
                </div>
                <div class="form-group mb-3">
                    <label>Update Last Name:</label>
                    <input type="text" name="lname" value="<%= employee.getLname() %>" class="form-control" required>
                </div>
                <div class="form-group mb-3">
                    <label>Update Mail Id:</label>
                    <input type="email" name="email" value="<%= employee.getMail() %>" class="form-control" required>
                </div>
                <div class="form-group mb-3">
                    <label>Update Phone:</label>
                    <input type="number" name="phone" value="<%= employee.getPhone() %>" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary" id="Toggle" name="profile_update">Update</button>
            </form>
        </div>
        <table class="table table-bordered mx-auto"> 
            <tr><td colspan="2" class="text-center"><button onclick="toggleButton()" class="btn btn-primary">Edit</button></td></tr>
            <tr><th>Employee ID</th><td><%= employee.getEmpid() %></td></tr>
            <tr><th>Name</th><td><%= employee.getFname() %> <%= employee.getLname() %></td></tr>
            <tr><th>DOB</th><td><%= employee.getDob() %></td></tr>
            <tr><th>Gender</th><td><%= employee.getGender() %></td></tr>
            <tr><th>Job Title</th><td><%= employee.getJob() %></td></tr>
            <tr><th>Manager ID</th><td><%= employee.getMgr() %></td></tr>
            <tr><th>Joining Date</th><td><%= employee.getDoj() %></td></tr>
            <tr><th>Salary</th><td><%= employee.getSal() %></td></tr>
            <tr><th>Commission</th><td><%= employee.getComm() %></td></tr>
            <tr><th>Department No</th><td><%= employee.getDno() %></td></tr>
            <tr><th>Company ID</th><td><%= employee.getCid() %></td></tr>
            <tr><th>Email</th><td><%= employee.getMail() %></td></tr>
            <tr><th>Phone</th><td><%= employee.getPhone() %></td></tr>
        </table>
        <%
            } else {
                out.println("<p class='text-danger text-center'>No employee details found. Please log in again.</p>");
            }
        %>
    </div>
</body>
</html>
