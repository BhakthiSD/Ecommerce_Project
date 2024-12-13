<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* Navbar styling */
        .navbar-custom {
            background-color: #2a2a72;
            padding: 10px 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }
        .navbar-custom .navbar-brand {
            color: #ffffff;
            font-weight: bold;
            font-size: 1.5rem;
        }
        .navbar-custom .nav-link {
            color: #ffffff;
            font-size: 1.2rem;
        }
        .navbar-custom .nav-link:hover {
            color: #f0a500;
        }

        /* General styling */
        body {
            background-color: #f8f9fa;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; 
        }

        /* Left Image styling */
        .left-image {
            flex: 0 0 60%;  
            background: url('https://cdn.pixabay.com/photo/2021/01/01/16/06/hand-5879027_1280.jpg') no-repeat center center;
            background-size: cover;
            height: 100%;
            border-radius: 10px 0 0 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        /* Right Form styling */
        .right-form {
            flex: 0 0 40%; 
            background-color: white;
            padding: 40px;
            border-radius: 0 10px 10px 0;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width : 70%;
        }

        .form-label {
            font-weight: bold;
        }
        
        .btn-primary {
            background-color: #2a2a72;
            border: none;
        }

        .form-text {
            font-size: 0.9rem;
        }

    </style>
</head>
<body class="bg-light">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard.jsp">
                <i class="fas fa-industry"></i> Pentagon Factory
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto icon-container">
                    <li class="nav-item"><a class="nav-link" href="home.jsp" title="Home"><i class="fas fa-home"></i></a></li>
                    <li class="nav-item"><a class="nav-link" href="logout" title="Logout"><i class="fas fa-sign-out-alt"></i></a></li>
                    <li class="nav-item"><a class="nav-link" href="help.jsp" title="Help"><i class="fas fa-question-circle"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Login Container with Image on Left and Form on Right -->
    <div class="login-container">

        <!-- Left Image Section -->
        <div class="left-image">
            <span>Welcome to Employee Login</span>
        </div>

        <!-- Right Form Section -->
        <div class="right-form">
            <% if((String)session.getAttribute("error") != null) { %>
                <div class="text-danger text-center mb-3"><%= session.getAttribute("error") %>!!!</div>
                <% session.removeAttribute("error"); %>
            <% } %>

            <h2 class="text-center mb-4">Employee Login</h2>
            <form id="login" action="login" method="post" novalidate>
                <div class="mb-3">
                    <label for="email" class="form-label">Enter your Mail ID</label>
                    <input type="text" name="email" class="form-control" placeholder="example@gmail.com">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Enter your Password</label>
                    <input type="password" name="pw" class="form-control" placeholder="example123">
                </div>

                <div class="d-flex justify-content-between mb-4">
                    <a href="Forgot.jsp">Forgot Password?</a>
                    <a href="NewEmployee.jsp">New Employee?</a>
                </div>

                <button type="submit" class="btn btn-primary w-100" name="Login">Login</button>
            </form>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
</body>
</html>
