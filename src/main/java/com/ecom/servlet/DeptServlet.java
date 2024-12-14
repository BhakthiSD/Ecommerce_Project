package com.ecom.servlet;

import java.io.IOException;
import java.util.List;

import com.ecom.dao.CompanyDAO;
import com.ecom.dao.CompanyDAOImpl;
import com.ecom.dto.Department;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deptcrud")
public class DeptServlet extends HttpServlet {

	public void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    
        try {
        	HttpSession session=req.getSession(false);
        	CompanyDAOImpl cdao = new CompanyDAOImpl();
        	if(req.getParameter("add") != null) 
        	{
        		String dname = req.getParameter("dname");
        		String loc = req.getParameter("loc");
        		int locid = cdao.getLocationId(loc);
        		if(locid == 0) {
        			req.setAttribute("noloc", "Services in the specified location is not there!");
    				RequestDispatcher rd = req.getRequestDispatcher("addDept.jsp");
    				rd.forward(req, res);
        		} else {
        		Department d = cdao.getDept(dname,locid); // to check if the dept in the specified location is already present.
        		if(d == null) 
        		{
        			d = new Department();
        			d.setDname(dname);
        			d.setLid(locid);
        			boolean result = cdao.addDept(d);
        			if(result) {
        				d = cdao.getDept(dname,locid);
        				req.setAttribute("dept", d);
                       	cdao.logAction("DEPARTMENT ADDED",(String) session.getAttribute("LogUser"), "DEPT", "5");
        				RequestDispatcher rd = req.getRequestDispatcher("addDept.jsp");
        				rd.forward(req, res);
        			}
        			else {
        				req.setAttribute("failure", "Failed to add the department!");
        				RequestDispatcher rd = req.getRequestDispatcher("addDept.jsp");
        				rd.forward(req, res);
        			}
        		} else {
        			req.setAttribute("existed", "The specified department in the specified location is already present!");
        			RequestDispatcher rd = req.getRequestDispatcher("addDept.jsp");
        			rd.forward(req, res);
        		  }
        		}
        	}
        	else if(req.getParameter("search")!=null) {
        		String dno = req.getParameter("deptno");
        		int deptNo = Integer.parseInt(dno);
        		Department dept=cdao.getDept(deptNo);
        		if(dept!=null) {
        			req.setAttribute("status", "present");   			
        			req.setAttribute("dept_del", dept);
        		    req.getRequestDispatcher("deleteDept.jsp").forward(req, res);
        		}
        		else {
        			req.setAttribute("dept_del", null);
        			System.out.println("else part came");
        			System.out.println(dept);
        			req.setAttribute("failure", "The provided data doesn't exist to delete!");
        			System.out.println("About to forward to next page");
        			RequestDispatcher rd = req.getRequestDispatcher("deleteDept.jsp");
        			rd.forward(req, res);
        		    System.out.println("forwarded");
        		}
        	}
        	else if(req.getParameter("delete") != null) 
        	  {       		
        		String dno = req.getParameter("deptno");
        		int deptNo = Integer.parseInt(dno);
        		boolean flag = cdao.deleteDept(deptNo);
        		if(flag) {
                   	cdao.logAction("DEPARTMENT DELETED",(String) session.getAttribute("LogUser"), "DEPT", "6");
        			req.setAttribute("success", "Department data deleted successfully.");
        			RequestDispatcher rd = req.getRequestDispatcher("deleteDept.jsp");
        			rd.forward(req, res);
        		}
        		else {
        			req.setAttribute("failure", "The provided data doesn't exist to delete!");
        			RequestDispatcher rd = req.getRequestDispatcher("deleteDept.jsp");
        			rd.forward(req, res);
        		}
        	  } else if(req.getParameter("update") != null) 
        	  	{
        		  	String deptno = req.getParameter("dno");
        		  	int dno = Integer.parseInt(deptno);
        		  	Department d = cdao.getDept(dno);
        		  	if(d != null) {
        		  		req.setAttribute("dept", d);
        		  		RequestDispatcher rd = req.getRequestDispatcher("updateDept.jsp");
        		  		rd.forward(req,res);
        		  	}
        		  	else {
        		  		req.setAttribute("fail", "The provided data doesn't exist to update!");
        		  		RequestDispatcher rd = req.getRequestDispatcher("updateDept.jsp");
        		  		rd.forward(req,res);
        		  	}
        	  	} else if(req.getParameter("updatedept") != null) 
        	  	  {
        	  			String dno = req.getParameter("dno");
        	  			String dname = req.getParameter("dname");
        	  			String loc = req.getParameter("loc");
        			
        	  			int deptNo = Integer.parseInt(dno);
        	  			int lid = cdao.getLocationId(loc);        	  			        	  			       	  			
        	  			HttpSession se = null;
        	  			if(lid == 0) {
        	  				se = req.getSession();
        	  				se.setAttribute("dno",dno);
        	  				se.setAttribute("dname",dname);
        	  				se.setAttribute("loc",loc);
        	  				req.setAttribute("noloc", "Services in the specified location is not available!");
            				RequestDispatcher rd = req.getRequestDispatcher("updateDept.jsp");
            				rd.forward(req, res);
        	  			} else {
        	  				Department d = new Department();
            	  			d.setDname(dname);
            	  			d.setDno(deptNo);
            	  			d.setLid(lid);
        	  			boolean result = cdao.updateDept(d);
        	  			if(result) {
        	  				req.setAttribute("dept", d);
                           	cdao.logAction("DEPARTMENT UPDATED",(String) session.getAttribute("LogUser"), "DEPT", "7");
        	  				req.setAttribute("success", "Data Updated Successfully.");
        	  				RequestDispatcher rd = req.getRequestDispatcher("updateDept.jsp");
        	  				rd.forward(req, res);
        	  			} else {
        	  				req.setAttribute("failure", "Unable to Update the data!");
        	  				RequestDispatcher rd = req.getRequestDispatcher("updateDept.jsp");
        	  				rd.forward(req, res);
        	  			}
        	  		}
        	  	  } else if (req.getParameter("view") != null) 
        	  	  	{
        	  		  String deptno = req.getParameter("dno");
        	  		  int dno = Integer.parseInt(deptno);
        	  		  
        	  		  Department d = cdao.getDept(dno);        	  		 
        	  		  if(d != null) {
        	  			req.setAttribute("dept", d);
      	  			  	RequestDispatcher rd = req.getRequestDispatcher("viewDept.jsp");
      	  			  	rd.forward(req, res);
        	  		  } else {
        	  			  req.setAttribute("alldepts", "All data");
        	  			  req.setAttribute("failure", "Unable to fetch the data!");
        	  			  RequestDispatcher rd = req.getRequestDispatcher("viewDept.jsp");
        	  			  rd.forward(req, res);
        	  		  }
        	  	  	} else if(req.getParameter("viewalldepts") != null) {
        	  			req.setAttribute("allDepts", "All depts data");
      	  			  	RequestDispatcher rd = req.getRequestDispatcher("viewDept.jsp");
      	  			  	rd.forward(req, res);
        	  		  }
        }catch(Exception e) {
        	e.printStackTrace();
        }

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {	
		processRequest(req,res);
	}
}



