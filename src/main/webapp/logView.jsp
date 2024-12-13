<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ecom.dto.Log" %>
<%@ page import="com.ecom.dao.CompanyDAOImpl" %>
<%@ page import="com.ecom.connection.ConnectionFactory" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Log</title>
    <style>
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
    <h1>Log List</h1>
    <table>
        <thead>
            <tr>
                <th>Log ID</th>
                <th>Log Action</th>
                <th>User Name</th>
                <th>Record ID</th>
                <th>Table Name</th>
                <th>TimeStamp</th>
            </tr>
        </thead>
        <tbody>
            <%
                CompanyDAOImpl companyDao = new CompanyDAOImpl();
                List<Log> l = companyDao.getLog();
                if (l != null && !l.isEmpty()) {
                    for (Log l1 : l) {
                        out.println("<tr>");
                        out.println("<td>" + l1.getAction_id() + "</td>");
                        out.println("<td>" + l1.getAction() + "</td>");
                        out.println("<td>" + l1.getUser() + "</td>");
                        out.println("<td>" + l1.getRecordId() + "</td>");
                        out.println("<td>" + l1.getTableName() + "</td>");
                        out.println("<td>" + l1.getTimestamp() + "</td>");
                        out.println("</tr>");
                    }
                } else {
                    out.println("<tr><td colspan='6'>No Log found.</td></tr>");
                }
            %>
        </tbody>
    </table>
</body>
</html>