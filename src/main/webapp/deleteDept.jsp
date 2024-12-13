<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ecom.dto.Employee" %>
<%@page import="com.ecom.dto.Department" %>

 <%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Department</title>
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
            margin-left: 10px;
        }
        .failure {
        	color : red;
        	margin : 10px;
        }
        .msg {
        	margin: 10px;
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
 <% HttpSession ses=request.getSession(false);
       Employee emp= (Employee)ses.getAttribute("employee"); %>
    <div class="form">
        <form action="deptcrud" method="post">
    <div class="mb-3">
        <label for="formGroupExampleInput" class="form-label">Department Number</label>
        <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Enter the dept number" name="deptno">
      </div>
      <button type="submit" class="btn btn-primary" name="search" id="btn">Delete Department</button>
      <button type="submit" class="btn btn-primary" class="anchor"><a href="dashboard.jsp">Back</a></button>
    </form>
    </div>
    <br>
    
    <%Department dep=(Department)request.getAttribute("dept_del"); %>
    <%if(dep!=null){ %>
        <button type="button" id="triggerDeleteModal" class="d-none" data-bs-toggle="modal" data-bs-target="#deleteModal"></button>
    
       <script>
            document.addEventListener("DOMContentLoaded",function(){
            	var triggerButton=document.getElementById("triggerDeleteModal")
            	if(triggerButton){
            		 triggerButton.click();
            	}
            });
       </script>
    <%} %>
    <center>
    <% if(request.getAttribute("success") != null) { %>
    <h4 class="msg"><%= request.getAttribute("success") %></h4>
    <% } %>
    <% if(request.getAttribute("failure") != null) { %>
    <h4 class="failure"><%= request.getAttribute("failure") %></h4>
    <% } %>
    </center>
   <%if(request.getParameter("search")!=null) {%> 
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header ">
        <h5 class="modal-title text-center bg-primary" style="margin-left:140px;">Delete Department?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center text-dark">
      <%if(dep!=null){ %>
        <p>Dept.No:<%= dep.getDno() %><br>
           Dept.Name:<%= dep.getDname() %><br>
           Location ID:<%= dep.getLid() %>
        
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <form action="deptcrud" method="post">
        <input type="hidden" name="deptno" value="<%= dep.getDno() %>">
        <button type="submit" class="btn btn-primary" name="delete">Confirm Delete</button>
        </form>
      </div>
      <%} %>
    </div>
  </div>
</div>
<%} %>
    <%@ include file="footer.jsp" %>
    
</body>
</html>

