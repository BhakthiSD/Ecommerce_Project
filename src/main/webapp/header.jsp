<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession sess = request.getSession(false);
    String employeeName = (sess != null && sess.getAttribute("employee") != null) 
                            ? ((com.ecom.dto.Employee)sess.getAttribute("employee")).getFname() 
                            : "Guest";
%>
<nav class="navbar navbar-expand-lg navbar-light shadow-sm" style="background: linear-gradient(to right, #007bff, #6610f2);">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-white" href="dashboard.jsp">The Pentagon Factory</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="dashboard.jsp">
                        <i class="bi bi-house-door-fill"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="Emplogin.jsp">
                        <i class="bi bi-person-fill"></i> Login
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="logout.jsp">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="help.jsp">
                        <i class="bi bi-question-circle-fill"></i> Help
                    </a>
                </li>
            </ul>
            <span class="navbar-text ms-3 text-white fw-semibold">
                Welcome, <%= employeeName %>!
            </span>
        </div>
    </div>
</nav>

<!-- Add Bootstrap and icons if not already included -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .navbar-nav .nav-link {
        transition: color 0.3s ease;
    }

    .navbar-nav .nav-link:hover {
        color: #ffe600; /* Change to a yellow color on hover */
        text-decoration: underline;
    }

    .navbar-text {
        font-size: 1.1rem; /* Slightly increase the font size for better visibility */
    }
</style>
