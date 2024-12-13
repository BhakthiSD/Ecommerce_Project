<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ecom.dto.Employee" %>
     <%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Password</title>
<style>
.success{
	color: green;
	text-align: center;
	text-size: 30px;
}
.failure{
	color: red;
	text-align: center;
	text-size: 30px;
}

</style>
</head>
<body>
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
        
        <%if(request.getAttribute("success")!=null) {%>
		<h3 class="success"><%=request.getAttribute("success") %></h3>
		<% } %>
	
		<%if(request.getAttribute("failure")!=null) {%>
		<h3 class="failure"><%=request.getAttribute("failure") %></h3>
		<% } %>
         <%HttpSession sesss=request.getSession(false);
          Employee e=(Employee)sesss.getAttribute("newEmp");
         %>
<center>
        <form method="POST" id="newpassword" action="reset">
            <font color="blue" size="4">
            <h2> New Password  </h2>
            </font>
            <br>
            <div class="container ">
            <table>
            	<tr>
                    <td><label >Enter your new Password</label></td>
                    <td><input type="password" id="password" placeholder="Enter Password"  name="password"></td>
                </tr>
                
                <tr>
                    <td><label >Confirm Password</label></td>
                    <td><input type="password"  placeholder="Confirm Password"  name="confirm"></td>
                </tr>
                <tr>
	                <td><center><button type="submit" name="newPassword" value="setPassword">Set Password</button></center></td>
	                <td><center><button><a href="Emplogin.jsp">Back</a></button></center></td>
                </tr>
            </div>
            </table>
        </form>
</center>
</body>
</html>

