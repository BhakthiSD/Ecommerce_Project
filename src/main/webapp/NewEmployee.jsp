<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Employee</title>
<style>
    #msg {
	    text-align: center;
	    font-size: 30px;
	    color: red;
     }
    body {
        background: linear-gradient(135deg, #6D9BC3, #E8EAF6);
        font-family: Arial, sans-serif;
    }
    .container {
        max-width: 500px;
        margin: 100px auto;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    }
    h2 {
        color: #3F51B5;
        text-align: center;
        font-weight: 600;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-control:focus {
        border-color: #3F51B5;
        box-shadow: 0 0 8px rgba(63, 81, 181, 0.5);
        transition: box-shadow 0.3s ease-in-out;
    }
    .btn-primary, .btn-secondary {
        border-radius: 5px;
        font-weight: 500;
        transition: all 0.3s ease;
    }
    .btn-primary {
        background-color: #3F51B5;
        border: none;
    }
    .btn-primary:hover {
        background-color: #303F9F;
    }
    .btn-secondary {
        background-color: #757575;
        border: none;
    }
    .btn-secondary:hover {
        background-color: #616161;
    }
    .modal-header, .modal-footer {
        background-color: #F5F5F5;
    }
    .modal-title {
        color: #3F51B5;
        font-weight: bold;
    }
    .success, .failure, #msg {
        font-size: 16px;
        text-align: center;
        font-weight: bold;
    }
    .success { color: green; }
    .failure, #msg { color: red; }
</style>
</head>
<body>
	<script>
            jQuery.validator.addMethod("checkemail", function(value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            }, "Please enter the email format as abc@gmail.com");

            jQuery(document).ready(function($) {
                $("#newEmployee").validate({
                    rules: {
                    	eid: {
                    		required: true;
                    	},
                		name: {
                			required: true;
                		},
                        email: {
                            required: true,
                            checkemail: true
                        },
                    },
                    messages: {
                    	eid: {
                    		required: :"Please enter the Employee ID.",
                    	},
                    	name: {
                    		required: "Please enter your name.",
                    	},
                        email: {
                            required: "Please enter the email.",
                        },
                    }
                });
            });
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
        <%if(request.getAttribute("success")!=null) {%>
		<h3 class="success"><%=request.getAttribute("success") %></h3>
		<% } %>
	
         <% if (request.getAttribute("failure") != null) {%>
        <div id="msg">  <%= request.getAttribute("failure")%></div>
        <%}%>
         <%if(request.getAttribute("modalTrigger")!=null){ %>
               <script>
               document.addEventListener('DOMContentLoaded', function () {
                   var myModal = new bootstrap.Modal(document.getElementById('MyModal'), {
                       backdrop: 'static'
                   });
                   myModal.show();
               });
               </script> 
        <%} %>
     <div class="container">
	    <form method="POST" id="newEmployee" action="reset">
	        <h2>New Employee</h2>
	        <div class="form-group">
	            <label for="eid">Employee ID</label>
	            <input type="text" class="form-control" id="eid" name="eid" placeholder="Enter Employee ID">
	        </div>
	        <div class="form-group">
	            <label for="email">Email Address</label>
	            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
	        </div>
	        <div class="form-group">
	            <label for="phone">Phone Number</label>
	            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number">
	        </div>
	        <div class="d-flex justify-content-between">
	            <button type="submit" class="btn btn-primary" name="newEmployee" value="reset">Set Password</button>
	            <a href="Emplogin.jsp" class="btn btn-secondary">Back</a>
	        </div>
	    </form>
    </div>
    <!-- setting new password modal -->
    <div class="modal fade" id="MyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Set New Password+</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="newpassword" action="reset" method="POST">
                <div class="form-group">
                    <label for="password">Enter your New Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm Password:</label>
                    <input type="password" class="form-control" id="confirm" name="confirm" required>
                </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" name="newPassword">Submit</button>
        
      </div>
      </form>
     </div>   
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>    

</body>
</html>
