<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>

<style type="text/css">

body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f6fa;
    }
    h1 {
        background-color: #2c3e50;
        color: #ecf0f1;
        padding: 1em;
        text-align: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        font-size: 2em;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }
    .table-container {
        display: flex;
        justify-content: center;
        padding: 2em 0;
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
        background-color: #3498db;
        color: #ffffff;
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

	a{
	text-decoration: none;
	color:purple;
	}
 #recordModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        #modalContent {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            text-align: center;
            position: relative;
        }
        #closeModal {
            position: absolute;
            top: 10px;
            right: 15px;
            cursor: pointer;
            font-size: 18px;
        }
		form {
		    display: flex; 
		    justify-content: center; 
		    align-items: center; 
		    margin-left: 50px;
		}
		
		input[type="text"] {
		    padding: 10px; 
		    border: 2px solid #ccc;
		    border-radius: 5px;
		    font-size: 1.2em; 
		    margin-right: 5px; 
		    width: 250px; 
		    transition: border-color 0.3s; 
		}
		
		input[type="text"]:focus {
		    border-color: #007bff; 
		    outline: none; 
		}
		
		button {
		    padding: 10px 15px; 
		    border: 2px solid #007bff;
		    border-radius: 5px; 
		    background-color: #007bff; 
		    color: white; 
		    font-size: 1.2em; 
		    cursor: pointer; /* Pointer cursor on hover */
		    transition: background-color 0.3s; 
		    margin-left: 5px; /* Space to the left of the button */
		}
</style>
<script>
        function closeModal() {
            document.getElementById("recordModal").style.display = "none";
        }
    </script>

</head>
<body>

    <%@ page import="com.ecom.dao.CompanyDAOImpl, com.ecom.dto.*,java.util.*" %>
    <% 
        CompanyDAOImpl cdao=new CompanyDAOImpl();
        List<Customer> list = cdao.getCustomer();
        request.setAttribute("list", list);
    %>


    <h1>Customers</h1>
    <form method="get" action="viewcustomers.jsp">
        <input type="text" id="searchInput" name="id" placeholder="Enter Customer ID">
        <button type="submit">Search</button>
    </form>
     <div id="recordModal" style="<%= request.getParameter("id") != null ? "display:flex;" : "display:none;" %>">
        <div id="modalContent">
            <span id="closeModal" onclick="closeModal()">✖</span>
            <h3>Customer Details</h3>
            <p id="recordDetails">
                <%
                    String id = request.getParameter("id");
                    if (id != null && !id.trim().isEmpty()) {
                        CompanyDAOImpl dao = new CompanyDAOImpl();
                        Customer customer = dao.getCustomer(Integer.parseInt(id));
                        if (customer != null) {
                %>
                    ID: <%= customer.getCid() %><br>
                    Name: <%= customer.getFirst_name() %> <%= customer.getLast_name() %><br>
                    LID: <%= customer.getLid() %>
                <%
                        } else {
                            out.print("Customer not found");
                        }
                    }
                %>
            </p>
          <button onclick="closeModal()">OK</button>
        </div>
    </div>
    <div>
    
    <table>
        <tr>
            <th>Id</th><th>First Name</th><th>Last Name</th><th>Location</th>
            <th>City</th><th>State</th>
        </tr>
<%
    List<Customer> userList = (List<Customer>)request.getAttribute("list");
    if (userList != null) {
        for (Customer c : userList) {
        	Location l=cdao.getLocationValue(c.getLid());
%>
            <tr>
                <td><%= c.getCid() %>
                <td><%= c.getFirst_name() %></td>
                <td><%= c.getLast_name() %></td>
                <td><%= l.getLocation() %></td>
                <td><%= l.getCity() %></td>
                <td><%= l.getState() %></td>

            </tr>
<%
        }
    }
%>

    </table>

    </div>

</body>
</html>
</body>
</html>