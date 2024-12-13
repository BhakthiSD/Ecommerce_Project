<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.ecom.dto.Department" %>
    <%@page import="com.ecom.dto.Employee" %>
 <%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Department</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        .form {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form {
            height:fit-content;
            width:fit-content;
            border: 1px solid black;
            padding: 20px;
            margin-top: 100px ;
            display: block;
            border: none;
            box-shadow:  0 0 1rem rgba(0,0,0,0.3);
            border-radius: 10px;
        }
        
        #btn {
            margin-left: 20px;
        }      
        #msg1 {
        	margin : 30px 0px 0px 0px;
        }
        #msg2 {
        	margin : 15px 0px 0px 0px;
        }
        .failure {
        	color : red;
        	margin : 25px 0px;
        }
        a {
        	color : white;
        	padding : 5px;
        	text-decoration : none;
        }
        .anchor {
        	margin : 10px 15px;
        }
    </style>
</head>
<body>

       <div class="form">
        <form action="deptcrud" method="post">
    <div class="mb-3">
        <label for="formGroupExampleInput" class="form-label">Department Name</label>
        <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Enter the dept name" name="dname" required>
      </div>
      <div class="mb-3">
        <label for="formGroupExampleInput2" class="form-label">Location Name</label>
        <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Enter the location name" name="loc" required>
      </div>
      <button type="submit" class="btn btn-primary" name="add" id="btn">Add Dept</button>
            <button type="submit" class="btn btn-primary" class="anchor"><a href="dashboard.jsp">Back</a></button>
      
    </form>
    </div>
    <center>
    <%Department d = (Department) request.getAttribute("dept"); %>
    <%String msg = (String) request.getAttribute("failure"); %>
    <%String existed_msg = (String) request.getAttribute("existed"); %>
    <%String loc_details = (String) request.getAttribute("noloc"); %>
    <% if(d != null) { %>
    <h4 id="msg1"><%= "Successfully added the Department." %></h4>
    <h4 id="msg2"><%= "Your generated Department No is : " + d.getDno() %></h4>
    <%} %>
    <% if(msg != null) { %>
    <h4 class="failure"><%= request.getAttribute("failure") %></h4>
    <%} %>
    <% if(existed_msg != null) { %>
    <h4 class="failure"><%= request.getAttribute("existed") %><br>Can't add it again.</h4>
    <%} %>
    <% if(loc_details != null) { %>
    <h4 class="failure"><%= request.getAttribute("noloc") %></h4>
    <%} %>
    </center>
  <%@ include file="footer.jsp" %>
    
</body>
</html>
