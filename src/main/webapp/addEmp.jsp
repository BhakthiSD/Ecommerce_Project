<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERTION EMPLOYEE</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
    body {
        background-color: #f8f9fa;
    }
   
    h1 {
        font-size: 2rem;
        text-align: center;
    }
    ul.nav {
        list-style: none;
        padding: 0;
        text-align: center;
    }
    ul.nav li {
        display: inline;
        margin: 0 15px;
    }
    ul.nav li a {
        color: white;
        text-decoration: none;
    }
    ul.nav li a:hover {
        text-decoration: underline;
    }
    .main-content {
        margin-top: 30px;
    }
    .card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    form {
        height: auto;
        width: 500px;
        border-radius: 10px;
        margin: 80px auto;
        padding: 20px;
        background-color: #f9f9f9;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    .form-group label {
        width: 30%;
        font-weight: bold;
        text-align: right;
        margin-right: 10px;
    }
    .form-group input,
    .form-group select {
        width: 70%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    button {
        display: block;
        width: 100%;
        padding: 12px;
        background-color: blue;
        color: white;
        font-weight: bold;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        margin-top: 20px;
    }
     a{
    text-decoration: none;
    color:white;
    }
     #msg
            {
                
                background: green;
                color:black;
                border: 1px solid green;
                width:24%;
                font-weight: bold;
                font-size: 25px;
                padding: 5px;
                margin: 5px;
            }
</style>
<script>
            //jQuery.validator.addMethod( name, method [, message ] )         
           // value---> "current value of the validated element".
          //elememt---> " element to be validated ".

            $(document).ready(function() {
            // Custom email validation to allow email or 10-digit number
            $.validator.addMethod("checkemail", function(value, element) {
                return /^(([^<>()[\\\]\\.,;:\s@\"]+(\.[^<>()[\\\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            }, "Please enter a valid email or a 10-digit phone number.");

            // Apply validation rules and messages
            var validator = $("#signup").validate({
                rules: {
                    Fname: { required: true },
                    Lname: { required: true },
                    dob:   {required: true},
                    gender:{required: true},
                    job:   {required: true},
                    mgr:   {required: true},
                    sal:    {required: true}, 
                    phone: { required: true, minlength: 10, maxlength: 10 },
                    dno:    {required: true}, 
                    email: { required: true, checkemail: true }
                },
                messages: {
                    Fname: { required: "Please enter name." },
                    Lname: { required: "Please enter name." },
                    dob:{required:"Please enter DOB"},
                    gender: { required: "Please select gender" },
                    job: { required: "Please enter Job Role" },
                    mgr: { required: "Please enter Mgr ID" },
                    mgr: { required: "Please enter Salary" },
                    phone: { required: "Please enter the number.", minlength: "Please enter a 10-digit number.", maxlength: "Maximum 10 digits." },
                    dno: { required: "Please enter Dpt No." },         
                    email: { required: "Please enter the email." }
                },
                errorPlacement: function(error, element) {
                    error.addClass("text-danger");
                    error.insertAfter(element); // Place the error message right after the input field
                }
            });

        });
        </script>
       
</head>
<body>
<header>
    <%@page import="com.ecom.dto.Employee" %>
    <% HttpSession ses=request.getSession(false);
       Employee emp= (Employee)ses.getAttribute("employee");
    %>
</header>
<center><% if (request.getAttribute("status") != null) {%>
        <div id="msg">  <%= request.getAttribute("status")%></div>
        <%}%></center>
<div>
    <form action="emp" method="post" id="signup">
        <div class="form-group">  
            <label for="Fname">First Name:</label>
            <input type="text" name="Fname" id="Fname">
        </div>
        <div class="form-group">
            <label for="Lname">Last Name:</label>
            <input type="text" name="Lname" id="Lname">
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" name="dob" id="dob">
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select name="gender" id="gender">
                <option value="m">m</option>
                <option value="f">f</option>
            </select>
        </div>
        <div class="form-group">
            <label for="job">Job Role:</label>
            <input type="text" name="job" id="job">
        </div>
        <div class="form-group">
            <label for="mgr">Manager ID:</label>
            <input type="tel" name="mgr" id="mgr">
        </div>
        <div class="form-group">
            <label for="sal">Salary:</label>
            <input type="tel" name="sal" id="sal">
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" name="phone" id="phone">
        </div>
        <div class="form-group">
            <label for="dno">dno:</label>
            <input type="tel" name="dno" id="dno">
        </div>
        <div class="form-group">
            <label for="comm">comm:</label>
            <input type="tel" name="comm" id="comm" value="0">
        </div>
        <div class="form-group">
            <label for="cid">cid:</label>
            <input type="tel" name="cid" id="cid" value="0">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email">
        </div>
       
          <button name="add_emp">add</button>
         <button type="button" onclick="window.history.go(-1)">back</button>
    </form>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>



