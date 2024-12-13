<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #6D9BC3, #E8EAF6);
        
        }
        .container {
            max-width: 500px;
            margin-top: 100px; 
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(1, 10, 0, 0.7);
        }
        .failure {
            color: red;
            text-align: center;
        }
        .success {
            color: green;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px; 
        }
        .form-control:focus {
		    outline: none;
		    border-color: #007bff;
		    box-shadow: 0 0 8px rgba(0, 123, 255, 0.5); 
		    transition: box-shadow 0.3s ease-in-out;
}
    </style>
    <script>
           
            jQuery(document).ready(function($) {
                $("#newpassword").validate({
                    rules: {
                    	 password: {
                             required: true,
                             minlength: 6
                         },
                         confirm: {
                             required: true,
                             minlength: 6,
                             equalTo: "#password"
                         }
                    },
                    messages: {
                    	 password: {
                             required: "Please enter the password.",
                             minlength: "Please enter the password greater than or equal to 7.",
                         },
                         confirm: {
                             required: "Please reenter the password.",
                             minlength: "Please enter the password greater than or equal to 7.",
                             equalTo: "mismatch password"
                         }
                    }
                });
            });
        </script>
        
</head>
<body>
    <div class="container">
        <h1 class="text-center">Forgot Password</h1>
           
        <% if (request.getAttribute("success") != null) { %>
            <h3 class="success"><%= request.getAttribute("success") %></h3>
        <% } %>
        
        <% if (request.getAttribute("failure") != null) { %>
            <h3 class="failure"><%= request.getAttribute("failure") %></h3>
        <% } %>
        <%if(request.getAttribute("employeeInfo")!=null){ %>
               <script>
               document.addEventListener('DOMContentLoaded', function () {
                   var myModal = new bootstrap.Modal(document.getElementById('MyModal'), {
                       backdrop: 'static'
                   });
                   myModal.show();
               });
               </script> 
        <%} %>
        <form action="Forgot" method="post">
            <div class="form-group">
                <label for="email">Enter your Email ID:</label>
                <input type="email" class="form-control" id="email" name="mail" required>
            </div>
            <div class="form-group">
                <label for="phone">Enter your Phone Number:</label>
                <input type="tel" class="form-control" id="phone" name="number" maxlength="10" required>
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-primary" value="Change Password" name="forgotPass">
                <br>
                <a href="Emplogin.jsp" class="btn btn-link">Login?</a>
            </div>
        </form>
    </div>

<!-- set password modal -->

<!-- Modal -->
<div class="modal fade" id="MyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Set Password+</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="newpassword" action="Forgot" method="POST">
                <div class="form-group">
                    <label for="password">New Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm Password:</label>
                    <input type="password" class="form-control" id="confirm" name="confirm" required>
                </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" name="newPassword">Save changes</button>
        
      </div>
      </form>
     </div>   
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>    
</body>
</html>
