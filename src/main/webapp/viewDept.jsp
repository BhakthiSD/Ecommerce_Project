<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page import="com.ecom.dto.Department" %>
    <%@ page import="com.ecom.dao.CompanyDAO" %>
       <%@ page import="com.ecom.dao.CompanyDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Department</title>
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
            display: block;
            border: none;
            box-shadow:  0 0 1rem rgba(0,0,0,0.3);
            border-radius: 10px;
        }
        table {
        	border-collapse: collapse;
	        width: 80%;
	        margin: 0 auto;
	        background-color: #ffffff;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        border-radius: 8px;
	        overflow: hidden;
        }
        th {
        	padding : 10px;
        	background-color: #2980b9;
            color: #bbbbbb;
       		padding: 15px;
        	font-size: 1.2em;
        	text-align: left;
        	
        }
         td {
        padding: 12px 15px;
        border-bottom: 1px solid #dddddd;
        color: #2c3e50;
        font-size: 1em;
    }
        tr:nth-child(even) {
        background-color: #f2f2f2;
    }
        .fail {
        	color : red;
        	margin : 20px;
        }
        .anchor {
        	margin-left : 10px;
        }
        a {
        	color : 2980b9;
        	padding : 5px;
        	text-decoration : none;
        }
</style>
</head>
<body>

	<div class="form" style="display: flex; justify-content: center; align-items: center;">
    <form action="deptcrud" method="POST" style="display: flex; flex-direction: column; align-items: center; width: 100%; max-width: 400px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); background-color: #ffffff;">
        <div class="mb-3" style="width: 100%;">
            <label for="formGroupExampleInput" class="form-label" style="font-size: 1.2em; color: #2c3e50;">Department No</label>
            <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Enter the Dept No" name="dno" style="font-size: 1.1em; padding: 10px; border-radius: 5px; border: 2px solid #ccc; margin-bottom: 10px;">
        </div>
        <div style="display: flex; gap: 10px;">
            <button type="submit" class="btn btn-primary" class="anchor" name="view" style="font-size: 1.1em; padding: 10px 15px; background-color: #007bff; color: white; border: 2px solid #007bff; border-radius: 5px;">View Dept</button>
            <button class="btn btn-secondary" style="font-size: 1.1em; padding: 10px 15px; background-color: #2c3e50; color: white; border: 2px solid #2c3e50; border-radius: 5px;">Back</button>
        </div>
    </form>
</div>
	
	
    <% if((request.getAttribute("dept") == null && request.getAttribute("failure") == null) || request.getAttribute("allDepts") != null) { %>
     <div class="container ">
	   <div class="jumbotron">
	 	<table >
		 <thead>
		 <tr>
		 <br>
			 <th>Department Number</th>
			 <th>Department Name</th>
			 <th>Location Id</th>
			 </tr>
		 </thead>
		 <tbody id="table">
		 <% CompanyDAO cdao = new CompanyDAOImpl(); %>
		<% List<Department> list = cdao.getDept(); %>
		 <%Iterator<Department> itr = list.iterator();
		 while (itr.hasNext()) {
		 Department d = itr.next();
		 %>
		 <tr>
	 		<td><%=d.getDno()%></td>
			 <td><%=d.getDname()%></td>
			 <td><%=d.getLid()%></td>
		 </tr>
	 <%}%>
			 </tbody>
		 </table>
	  </div>
	 </div>
	 <%} else if(request.getAttribute("dept") != null) {%>
	      <div class="container ">
	 <div class="jumbotron">
	 <table class="table">
	 	<thead>
	 	<tr style="background-color: darkblue;">
	 	<br>
	 		<th>Department Number</th>
			<th>Department Name</th>
			<th>Location Id</th>
	 	</tr>
	   </thead>
	   <tbody id="table">
	 	<% Department d = (Department) request.getAttribute("dept");%>
	 	<tr>
		 <td><%=d.getDno()%></td>
		 <td><%=d.getDname()%></td>
		 <td><%=d.getLid()%></td>
		 </tr>
	 	</tbody>
	   </table>
	 </div>
  </div>
 <%} %>
	 <center>
	 <% if(request.getAttribute("failure") != null) { %>
	 <h4 class="fail"> <%= request.getAttribute("failure") %></h4>
	 <%} %>
	 <a href="viewDept.jsp">Back to Department Management</a>
	 </center>
 </body>
</html>
