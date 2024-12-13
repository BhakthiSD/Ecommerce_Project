<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecom.dto.Department, com.ecom.dao.CompanyDAO, com.ecom.dao.CompanyDAOImpl, com.ecom.dto.Location" %>
<%@page import="com.ecom.dto.Employee" %>
 <%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Department</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        .form {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form {
            height: fit-content;
            width: fit-content;
            padding: 20px;
            margin-top: 100px;
            display: block;
            border: none;
            box-shadow: 0 0 1rem rgba(0,0,0,0.3);
            border-radius: 10px;
        }
        #btn {
            margin-left: 7px;
        }
        .msg, .failure {
            margin: 10px;
        }
        .failure {
            color: red;
        }
        #anchor, #footer {
            color: white;
            padding: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
 <% HttpSession ses=request.getSession(false);
       Employee emp= (Employee)ses.getAttribute("employee"); %>
<% 
    CompanyDAO cdao = new CompanyDAOImpl(); 
    Department d = (Department) request.getAttribute("dept");
    Location l = (d != null) ? cdao.getLocation(d.getLid()) : null;
%>

<div class="form">
    <form action="deptcrud" method="post">
        <% if (d == null) { %>
            <!-- Department Number Form -->
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">Department Number</label>
                <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Enter the Dept Number" name="dno" required>
            </div>
            <button type="submit" class="btn btn-primary" name="update" id="btn">Update</button>
            <button type="button" class="btn btn-secondary"><a href="dashboard.jsp" id="anchor">Back</a></button>
        <% } else { %>
            <!-- Department Update Form -->
            <div class="mb-3">
                <input type="hidden" class="form-control" name="dno" value="<%= d.getDno() %>" required>
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Department Name</label>
                <input type="text" class="form-control" id="formGroupExampleInput" value="<%= d.getDname() %>" name="dname" required>
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">Location Name</label>
                <input type="text" class="form-control" id="formGroupExampleInput2" value="<%= (l != null) ? l.getLocation() : "" %>" name="loc" required>
            </div>
            <button type="submit" class="btn btn-primary" name="updatedept" id="btn">Update Dept</button>
            <button type="button" class="btn btn-secondary"><a href="dashboard.jsp" id="anchor">Back</a></button>
        <% } %>
    </form>
</div>

<center>
    <% if (request.getAttribute("fail") != null) { %>
        <h4 class="failure"><%= request.getAttribute("fail") %></h4>
    <% } %>
    <% if (request.getAttribute("noloc") != null) { %>
        <h4 class="failure"><%= request.getAttribute("noloc") %></h4>
    <% } %>
    <% if (request.getAttribute("success") != null) { %>
        <h4 class="msg"><%= request.getAttribute("success") %></h4>
    <% } %>
    <% if (request.getAttribute("failure") != null) { %>
        <h4 class="failure"><%= request.getAttribute("failure") %></h4>
    <% } %>
    <a href="dashboard.jsp" id="footer">Back to Department Management</a>
</center>
<%@ include file="footer.jsp" %>

</body>
</html>
