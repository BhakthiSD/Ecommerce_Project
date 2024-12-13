<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script>
    $(document).ready(function() {
        // Custom email validation to allow email or 10-digit number
        $.validator.addMethod("checkemail", function(value, element) {
            return /^(([^<>()[\\\]\\.,;:\s@\"]+(\.[^<>()[\\\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
        }, "Please enter a valid email or a 10-digit phone number.");

        // Apply validation rules and messages
        var validator = $("#login").validate({
            rules: {
                email: {
                    required: true,
                    checkemail: true
                },
                pw: {
                    required: true,
                    minlength: 6
                }
            },
            messages: {
                email: {
                    required: "Please enter your email."
                },
                pw: {
                    required: "Please enter your password.",
                    minlength: "Password must be at least 6 characters long."
                }
            },
            errorPlacement: function(error, element) {
                error.addClass("text-danger");
                error.insertAfter(element); // Place the error message right after the input field
            }
         
        });

        // Trigger validation errors to display immediately on page load
        validator.form();
    });
</script>
<style> .navbar-custom {
            background-color: #2a2a72;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            padding: 10px 20px;
        }
        .navbar-custom .navbar-brand {
            color: #ffffff;
            font-weight: bold;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }
        .navbar-custom .navbar-brand i {
            margin-right: 8px;
            font-size: 1.8rem;
        }
        .navbar-custom .nav-link {
            color: #ffffff;
            margin: 0 10px;
            font-size: 1.2rem;
        }
        .navbar-custom .nav-link:hover {
            color: #f0a500;
        }
        .navbar-custom .icon-container {
            display: flex;
            gap: 20px;
        }
        .navbar-custom .nav-item i {
            font-size: 1.2rem;
        }
        .container{
           width: 700px;
           margin-top:0px;
        }
    .error-message {
        font-size: 2.5rem;
        color: red;
        text-align: center;
        margin-top: 50px;
        margin-bottom:0px;
    }
</style>
</head>
<body class="bg-light d-flex  justify-content-center vh-100">
<nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard.jsp">
                <i class="fas fa-industry"></i> Pentagon Factory
            </a>
            
            <!-- Toggler for mobile view -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto icon-container">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp" title="Home">
                            <i class="fas fa-home"></i>
                        </a>
                    </li>
                   
                    <li class="nav-item">
                        <a class="nav-link" href="logout" title="Logout">
                            <i class="fas fa-sign-out-alt"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp" title="Help">
                            <i class="fas fa-question-circle"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

   <div class="container d-flex flex-column align-items-center">

   <%if((String)session.getAttribute("error")!=null){ %>
    <div class="text-danger error-message text-center"><%=session.getAttribute("error") %>!!!</div>
        <% session.removeAttribute("error"); %>
    
   <%} %>
   <div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-sm p-4" style="max-width: 900px;">
        <h2 class="text-center mb-4">Employee Login</h2>
        <form id="login" action="login" method="post" novalidate>
            <label for="email" class="form-label">Enter your Mail ID</label>
            <input type="email" name="email" class="form-control mb-3" placeholder="example@gmail.com">
            <br>
            <label for="password" class="form-label">Enter your Password</label>
            <input type="password" name="pw" class="form-control mb-3" placeholder="example123">

            <div class="d-flex justify-content-between mb-4">
                <a href="Forgot.jsp">Forgot Password?</a>
                <a href="NewEmployee.jsp">New Employee?</a>
            </div>
            
            <button type="submit" class="btn btn-primary w-100" name="Login">Login</button>
        </form>
    </div>
</div>
   </div>
   <%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
</body>
</html>
