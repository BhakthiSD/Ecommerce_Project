package com.ecom.servlet;

import java.io.IOException;

import com.ecom.dto.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ecom.dao.CompanyDAO;
import com.ecom.dao.CompanyDAOImpl;
@WebServlet("/DashboardController")
public class DashboardController  extends HttpServlet{
	private CompanyDAO dao;

    public DashboardController() {
        super();
        dao = new CompanyDAOImpl(); // Initialize your DAO here
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   
            String action=req.getParameter("action");
            if(action.equals("viewProfile")) {
            	HttpSession ses=req.getSession(false);
            	Employee e=(Employee)ses.getAttribute("employee");
                req.getRequestDispatcher("#").forward(req, resp);//give jsp name for self details
            }         
            else if(action.equals("ManageProduct")) {
            	req.getRequestDispatcher("Product.jsp").forward(req, resp);
            }
            else if(action.equals("logout")) {
            	HttpSession ses=req.getSession(false);
                ses.invalidate();
                resp.sendRedirect("Emplogin.jsp");
            }
            else {
            	resp.sendRedirect("Emplogin.jsp");
            }
	}
}

