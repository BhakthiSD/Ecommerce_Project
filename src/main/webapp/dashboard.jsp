<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecom.dto.Employee, com.ecom.dto.Product, java.util.List, java.util.Iterator, com.ecom.dao.CompanyDAOImpl, com.ecom.dao.CompanyDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
    background: url('https://plus.unsplash.com/premium_vector-1682298508389-6bd41a0b1ca2?q=80&w=1800&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') 
                no-repeat center center fixed;
    background-size: cover;
    color: #333;
}
.navbar { 
        background-color: #3498db; 
        border-bottom: 2px solid #2980b9; 
    }

    .navbar .nav-link {
        color: white;
        padding: 10px 15px;
        font-size: 1.1em;
        transition: all 0.3s ease;
    }
    
    .navbar .nav-link:hover {
        background-color: #2980b9;
        color: #fff;
        border-radius: 5px;
        transform: scale(1.1);
    }

    .navbar .nav-item {
        margin-right: 10px;
    }
 header, .options-section {
    background-color: #343a40;
    color: white;
}

header {
    padding: 10px;
    text-align: center;
}

.options-section, .product-card {
    background: linear-gradient(135deg, #e0f7fa, #80deea);
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    padding: 20px;
    margin-top: 20px;
}



.product-card .card-title {
    font-size: 1.2em;
    font-weight: bold;
}
.product-card img {
    width: 100%;
    height: 100px; 
    object-fit: fill; 
    border-radius: 8px;
}

.card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px); 
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3); 
}

.btn-primary {
    background-color: #007bff;
    width: 100%;
    font-size: 1.1em;
    margin: 5px 0;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-group-custom .btn {
    width: 100%;
    font-size: 1.1em;
    padding: 10px;
    background-color: #00796b;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s, transform 0.3s;
}

.btn-group-custom .btn:hover {
    background-color: #004d40;
    transform: translateY(-3px);
}

    
</style>
<script>
    function toggleFrame(src) {
        const frame = document.getElementById('contentFrame');
        frame.src = frame.style.display === 'none' || frame.src !== src ? src : 'about:blank';
        frame.style.display = frame.style.display === 'none' ? 'block' : 'none';
    }

    function toggleSection(sectionId) {
        const section = document.getElementById(sectionId);
        section.style.display = section.style.display === 'none' ? 'block' : 'none';
    }

    function toggleProductCards(containerId, btnId, openText, closeText) {
        const container = document.getElementById(containerId);
        const button = document.getElementById(btnId);
        const isVisible = container.style.display === 'flex';
        container.style.display = isVisible ? 'none' : 'flex';
        button.innerText = isVisible ? openText : closeText;
    }

</script>
</head>
<body>
<header style="background: linear-gradient(135deg, #3498db, #2c3e50); color: white;  text-align: center; font-size: 2em; font-weight: bold; letter-spacing: 1px; border-radius: 10px;">
    <% HttpSession ses = request.getSession(false);
       Employee emp = (Employee) ses.getAttribute("employee");
       String job = emp.getJob();
       if (emp == null) { response.sendRedirect("login.jsp"); return; }
    %>
    <h1>Welcome to the Dashboard,<span style="color: #f39c12;"> <%= emp.getFname() %>!</span></h1>
</header>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleFrame('profile.jsp')">Your Profile</button></li>
           <li class="nav-item">
               <button id="ToggleProduct" class="toggle-button nav-link"  onclick="toggleProductCards('productContainer', 'ToggleProduct', 'View Products', 'Close Products')"> View Products </button></li>
            <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleFrame('viewEmployees.jsp')">View Employees</button></li>
            <li class="nav-item"><a class="nav-link" href="DashboardController?action=logout">Logout</a></li>
        </ul>
    </div>
    
    <div class="container-fluid">
        <% if ("CEO".equalsIgnoreCase(job)) { %>
            <ul class="navbar-nav">
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleSection('employeeOptions')">Manage Employees</button></li>
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleSection('deptOptions')">Manage Department</button></li>
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleSection('LocationOptions')">Manage Locations</button></li>
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleSection('ProductOptions')">Manage Products</button></li>
               
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleFrame('viewcustomers.jsp')">View Customers</button></li>
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleFrame('viewOrders.jsp')">View Orders</button></li>
               <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleFrame('viewDept.jsp')">View Department</button></li>
                
            </ul>
        <% } else if ("HR".equalsIgnoreCase(job)) { %>
            <ul class="navbar-nav">
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleSection('employeeOptions')">Manage Employees</button></li>
                <li class="nav-item"><a class="nav-link" href="DashboardController?action=ManageDept">Manage Departments</a></li>
                <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleFrame('viewDept.jsp')">View Department</button></li>
            
            </ul>
        <% } else if ("SALESMAN".equalsIgnoreCase(job)) { %>
            <ul class="navbar-nav">
                 <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleSection('ProductOptions')">Manage Products</button></li>
                 <li class="nav-item"><button class="toggle-button nav-link" onclick="toggleSection('LocationOptions')">Manage Locations</button></li>
            
            </ul>
        <% } %>
    </div>
</nav>

<div class="container options-section" id="deptOptions" style="display: none;">
    <h2 class="text-center text-dark">Department Options</h2>
    <div class="row btn-group-custom d-flex justify-content-around">
        <div class="col-md-2"><a href="addDept.jsp" class="btn">Add Department</a></div>
        <div class="col-md-2"><a href="deleteDept.jsp" class="btn">Delete Department</a></div>
        <div class="col-md-2"><a href="updateDept.jsp" class="btn">Update Department</a></div>
    </div>
</div>

<div class="container options-section" id="employeeOptions" style="display: none;">
    <h2 class="text-center text-dark">Employee Options</h2>
    <div class="row btn-group-custom d-flex justify-content-around">
        <div class="col-md-2"><a href="addEmp.jsp" class="btn">Add Employee</a></div>
        <div class="col-md-2"><a href="delete_emp.jsp" class="btn">Delete Employee</a></div>
        <div class="col-md-2"><a href="update_emp.jsp" class="btn">Update Employee</a></div>
    </div>
</div>

<div class="container options-section" id="ProductOptions" style="display: none;">
    <h2 class="text-center text-dark">Product Options</h2>
    <div class="row btn-group-custom d-flex justify-content-around">
        <div class="col-md-2"><a href="ViewProduct.jsp" class="btn">Edit/Delete Products</a></div>
        <div class="col-md-2"><a href="ProductInsert.jsp" class="btn">Add Products</a></div>
    </div>
</div>

<div class="container options-section" id="LocationOptions" style="display: none;">
    <h2 class="text-center text-dark">Location Options</h2>
    <div class="row btn-group-custom d-flex justify-content-around">
        <div class="col-md-2"><a href="LocationInsert.jsp" class="btn">Add Location</a></div>
        <div class="col-md-2"><a href="ViewLocation.jsp" class="btn">Edit/Delete Location</a></div>
    </div>
</div>
<div id="productContainer" class="container mt-4 bg-light" style="display: none;">
    <h1 class="bg-dark text-light text-center p-3 shadow custom-h1">Products</h1>
    <div class="row">
        <% 
        CompanyDAO dao = new CompanyDAOImpl();
        List<Product> products = dao.getProduct();
        if (products != null && !products.isEmpty()) {
            for (Product p : products) { 
        %>
        <div class="col-md-4 col-lg-3 mb-4">
            <div class="card h-100 shadow" style="width:18rem">
                <img src="Images\<%= p.getP_image() %>" class="card-img-top" alt="<%= p.getP_Name() %>" height="220">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getP_Name() %></h5>
                    <p class="card-text">Price: ₹<%= p.getPrice() %></p>
                    <p class="card-text text-muted">Product ID: <%= p.getProductId() %></p>
                </div>
            </div>
        </div>
        <% 
            }
        } else { 
        %>
        <div class="col-12 text-center text-danger">
            <p>No products available.</p>
        </div>
        <% } %>
    </div>
</div>


<iframe id="contentFrame" style="width:100%; height:500px; border:none; display:none;"></iframe>
<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
