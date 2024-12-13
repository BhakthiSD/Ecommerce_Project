<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Location Delete</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            background-image: url('https://wallpapers.com/images/hd/sales-1600-x-900-background-1gjk99udiabzoqmb.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #333;
            position: relative;
        }

        
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.8);
            z-index: -1;
        }

        h3.success {
            color: green;
            text-align: center;
        }

        h3.failure {
            color: red;
            text-align: center;
        }

        form {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 50px auto;
            max-width: 500px; 
        }

        h1 {
            text-align: center;
        }

        button {
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            background-color: #007bff; 
            margin-top: 10px; 
        }

        button:hover {
            opacity: 0.9;
        }

        .back-button {
            background-color: #6c757d; 
        }

        .back-button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

<%if(request.getAttribute("success")!=null){ %>
<h3 class="success"><%=request.getAttribute("success") %></h3>
<%}%>
<%if(request.getAttribute("failure")!=null){ %>
<h3 class="failure"><%=request.getAttribute("failure") %></h3>
<%}%>

<form action="salesman" method="post">   <!--ldelete  -->
<%
String locationId=request.getParameter("locationId"); 
int LId=0;
if(locationId!=null){ 
    LId=Integer.parseInt(locationId);
} 
%>
<input type="hidden" value="<%=LId %>" name="id">
<table>
 <tr>
 <th colspan="2"><h1>Are You Sure You Want to Delete This Location?<%=LId %></h1></th>
 </tr>
 <tr>
  <td><button type="button" onclick="history.back()">back</button></td> 
  <td><button type="submit" name="ldelete">Ok</button></td> 
 </tr>
</table>


</form>
</body>
</html>

