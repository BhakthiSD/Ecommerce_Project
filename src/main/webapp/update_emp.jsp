<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
     <%@page import="com.ecom.dto.Employee" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update EMPLOYEE</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
        text-align: center;
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
</head>
<body>
<header>
    <% 
        Employee employee = (Employee) request.getAttribute("updatemployee");
    %>
</header>

 <center><% if (request.getAttribute("status") != null) {%>
        <div id="msg">  <%= request.getAttribute("status")%></div>
        
        <%}%></center>

<%if(employee == null) {%>

<div>
    <form action="emp" method="post">
        <div class="form-group">
            <label for="id">Enter Employee ID to be Updated:</label>
            <input type="tel" name="eid" id="id">
        </div>
         <button name="update">Go</button>
         <h5>or</h5>
          <button type="button" onclick="window.history.go(-1)">Back</button>
         
    </form>
    </div>
    <%} else{ %>
    <div>
    <form action="emp"   method="post">
        <div class="form-group">
            
            <input type="hidden" name="Eid" value=<%=employee.getEmpid()%>>
            <label for="Fname">First Name:</label>
            <input type="text" name="Fname" value=<%=employee.getFname()%> id="Fname">
        </div>
        <div class="form-group">
            <label for="Lname">Last Name:</label>
            <input type="text" name="Lname" value=<%=employee.getLname()%> id="Lname">
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" name="dob" value=<%=employee.getDob()%> id="dob">
        </div>
        <div class="form-group">
            <label for="doj">Date of join:</label>
            <input type="date" name="doj" value=<%=employee.getDoj()%> id="doj">
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select name="gender" value=<%=employee.getGender()%> id="gender">
                <option value="m">m</option>
                <option value="f">f</option>
            </select>
        </div>
        <div class="form-group">
            <label for="job">Job Role:</label>
            <input type="text" value=<%=employee.getJob()%> name="job" id="job">
        </div>
        <div class="form-group">
            <label for="mgr">Manager ID:</label>
            <input type="tel" value=<%=employee.getMgr()%> name="mgr" id="mgr">
        </div>
        <div class="form-group">
            <label for="sal">Salary:</label>
            <input type="number" value=<%=employee.getSal()%>  name="sal" id="sal">
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" value=<%=employee.getPhone()%>  name="phone" id="phone">
        </div>
        <div class="form-group">
            <label for="dno">dno:</label>
            <input type="tel" value=<%=employee.getDno()%>  name="dno" id="dno">
        </div>
        <div class="form-group">
            <label for="comm">comm:</label>
            <input type="text" value=<%=employee.getComm()%> name="comm" id="comm">
        </div>
        <div class="form-group">
            <label for="cid">cid:</label>
            <input type="tel" value=<%=employee.getCid()%> name="cid" id="cid">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" value=<%=employee.getMail()%> name="email" id="email">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" value=<%=employee.getPassword()%>   name="password" id="password">
        </div>
   		 <button name="update1">Update</button>
   	     <button type="button" onclick="window.history.go(-2)">Back</button>
   		 
    </form>
</div>
    <%} %>
  <%@ include file="footer.jsp" %>
    
</body>
</html>



