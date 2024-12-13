package com.ecom.servlet;


import java.io.IOException;

import com.ecom.dao.CompanyDAO;
import com.ecom.dao.CompanyDAOImpl;
import com.ecom.dto.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Forgot")
public class Forgot extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("forgotPass")!=null) {
		String mail=req.getParameter("mail");
		String phonenum=req.getParameter("number");
		
		long phone=Long.parseLong(phonenum);
		HttpSession session=req.getSession();
		
		resp.setContentType("text/html");
		CompanyDAOImpl cdao= new CompanyDAOImpl();
		Employee e=cdao.getEmployee(mail,phone) ;
		session.setAttribute("employeeInfo", e);
		if(e!=null)
		{
			req.setAttribute("employeeInfo",e);
			RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("failure", "user not found");
			RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
			rd.forward(req, resp);	
		}
		}
		else if(req.getParameter("newPassword")!=null) {
			String password = req.getParameter("password");
			String confirm = req.getParameter("confirm");
			 HttpSession session = req.getSession();
		        Employee e = (Employee) session.getAttribute("employeeInfo"); 
			resp.setContentType("text/html");
			CompanyDAOImpl cdao = new CompanyDAOImpl();
			
			  if (e != null && password.equals(confirm)) { 
		            e.setPassword(password); 

		            boolean res = cdao.updateEmployee(e);
		            if (res) {
		                req.setAttribute("success", "Password Set Successfully!!!");
		                RequestDispatcher rd = req.getRequestDispatcher("Forgot.jsp");
		                rd.forward(req, resp);
		            } else {
		                req.setAttribute("failure", "Failed to set!!!");
		                RequestDispatcher rd = req.getRequestDispatcher("Forgot.jsp");
		                rd.forward(req, resp);
		            }
		        } else {
		            req.setAttribute("failure", "Password mismatch or invalid employee.");
		            RequestDispatcher rd = req.getRequestDispatcher("Forgot.jsp");
		            rd.forward(req, resp);
		        }

		}
		}}
