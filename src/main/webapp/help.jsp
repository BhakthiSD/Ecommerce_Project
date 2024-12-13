<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help & FAQ - The Pentagon Factory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Help & FAQ</h1>
        <hr>
        
        <section id="crud-operations" class="my-5">
            <h2>How to Add, Edit, and Delete Employees or Departments</h2>
            <p>To perform CRUD operations for employees or departments:</p>
            <ul>
                <li><strong>Adding:</strong> Use the “Add Employee” or “Add Department” buttons available on your dashboard. Fill in the required fields, then submit.</li>
                <li><strong>Editing:</strong> Navigate to the employee or department list, select the entry you want to edit, and click on "Edit". Make necessary changes, then save.</li>
                <li><strong>Deleting:</strong> Locate the item in the list, click “Delete,” and confirm your action.</li>
            </ul>
        </section>

        <section id="dashboard-navigation" class="my-5">
            <h2>Dashboard Navigation</h2>
            <p>Each user role has specific access:</p>
            <ul>
                <li><strong>CEO:</strong> Can access and manage employees, departments, products, and locations. View all logs and reports.</li>
                <li><strong>HR:</strong> Manages employees and departments only.</li>
                <li><strong>Salesman:</strong> Has access to product and location management.</li>
            </ul>
            <p>Use the left-side menu to navigate through your available modules.</p>
        </section>

        <section id="troubleshooting" class="my-5">
            <h2>Troubleshooting</h2>
            <h4>Login Issues</h4>
            <p>If you encounter login errors:</p>
            <ul>
                <li>Ensure your email and password are correct. Passwords are case-sensitive.</li>
                <li>If you've forgotten your password, use the "Forgot Password?" link to reset it.</li>
            </ul>
            
            <h4>Session Timeout</h4>
            <p>Sessions expire after a period of inactivity. If you're logged out, simply log in again.</p>

            <h4>Common Errors</h4>
            <p>If you encounter errors during any operation, please check your internet connection and try again. For persistent issues, contact support.</p>
        </section>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
