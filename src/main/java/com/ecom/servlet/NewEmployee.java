package com.ecom.servlet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import java.io.IOException;

import com.ecom.dao.*;
import com.ecom.dto.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/reset")

public class NewEmployee extends HttpServlet{
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if(request.getParameter("newEmployee")!=null) {
		 String eid = request.getParameter("eid");
		 String email = request.getParameter("email");
		 String phonenum = request.getParameter("phone");
		
		
		 HttpSession session = request.getSession();
		 int id = Integer.parseInt(eid);
		 long phone = Long.parseLong(phonenum);
		
		 response.setContentType("text/html");
		 CompanyDAO c = new CompanyDAOImpl();
		 Employee e = c.getEmployee(email,phone,id);		 
		 if(e!=null) {
			 session.setAttribute("newEmp", e);
             request.setAttribute("modalTrigger", true); 
			 RequestDispatcher rd = request.getRequestDispatcher("NewEmployee.jsp");
			 rd.forward(request, response);
		 }
		 else {
			 request.setAttribute("failure", "Invalid Credentials");
			 RequestDispatcher rd = request.getRequestDispatcher("NewEmployee.jsp");
			 rd.forward(request, response);
		   }
		 }
		 else if(request.getParameter("newPassword")!=null) {
			 String pass = request.getParameter("password");
		        String conf = request.getParameter("confirm");

		        HttpSession session = request.getSession(false);
		        Employee e = (Employee) session.getAttribute("newEmp");  // Retrieve the employee object from session
		        response.setContentType("text/html");
		        CompanyDAO c = new CompanyDAOImpl();

		        if (e != null && pass.equalsIgnoreCase(conf)) {  // Ensure e is not null
		            e.setPassword(pass);  // Set the new password

		            boolean res = c.updateEmployee(e);
		            if (res) {
		            	session.removeAttribute("newEmp");
		            	request.setAttribute("success", "Password Set Successfully!!!");
		                RequestDispatcher rd = request.getRequestDispatcher("NewEmployee.jsp");
		                rd.forward(request, response);
		            } else {
		            	request.setAttribute("failure", "Failed to set!!!");
		                RequestDispatcher rd = request.getRequestDispatcher("NewEmployee.jsp");
		                rd.forward(request, response);
		            }
		        } else {
		        	System.out.println(e);
		        	System.out.println(pass+" "+conf);
		        	request.setAttribute("failure", "Password mismatch!!!");
		            RequestDispatcher rd = request.getRequestDispatcher("NewEmployee.jsp");
		            rd.forward(request, response);
		        }
		 }
	 }
}

