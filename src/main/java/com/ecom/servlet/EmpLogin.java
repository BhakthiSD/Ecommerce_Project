package com.ecom.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ecom.dao.CompanyDAO;
import com.ecom.dao.CompanyDAOImpl;
import com.ecom.dto.Employee;
import com.ecom.dto.Log;

@WebServlet("/login")
public class EmpLogin  extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			CompanyDAO dao=new CompanyDAOImpl();

			if(req.getParameter("Login")!=null) {
			String mail=req.getParameter("email");
			String password=req.getParameter("pw");
			HttpSession session = req.getSession();
			
			Employee e=dao.getEmployee(mail, password);
			if(e!=null) {
				session.setAttribute("employee", e);				
				session.setAttribute("LogUser",Log.getSessionUser(req));
				dao.logAction("EMPLOYEE LOGIN", (String)session.getAttribute("LogUser"), "EMP", "1");
				req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
					
			}
			else {
				session.setAttribute("error", "Invalid mail or password");
				req.getRequestDispatcher("Emplogin.jsp").forward(req, resp);
			}
		}
			else if(req.getParameter("profile_update")!=null) {
				String fname=req.getParameter("fname");
				String lname=req.getParameter("lname");
				String email=req.getParameter("email");
                String phone_no=req.getParameter("phone");
                long phone=Long.parseLong(phone_no);
                HttpSession session = req.getSession(false);
                Employee e=(Employee) session.getAttribute("employee");
                e.setFname(fname);
                e.setLname(lname);
                e.setMail(email);
                e.setPhone(phone);
                Boolean res=dao.updateEmployee(e);
                if(res) {
                	session.setAttribute("employee",e);
                	dao.logAction("PROFILE UPDATE",(String) session.getAttribute("LogUser"), "EMP", "1");
                	session.setAttribute("status", "Updated successfully");
                	req.getRequestDispatcher("profile.jsp").forward(req, resp);
                }
                else {
                	session.setAttribute("status", "Update failed!!");
                	req.getRequestDispatcher("profile.jsp").forward(req, resp);
                }
				
			}

		}
				

}
