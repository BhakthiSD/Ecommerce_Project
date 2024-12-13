package com.ecom.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import com.ecom.dao.CompanyDAO;
import com.ecom.dao.CompanyDAOImpl;
import com.ecom.dto.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/emp")
public class ManageEmployees extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.setContentType("text/html;charset=UTF-8");
		// type of the response sent to the client or browser
//		PrintWriter out = response.getWriter();
		CompanyDAO dao = new CompanyDAOImpl();
		Employee e=new Employee();
		if(request.getParameter("add_emp")!=null) 
		{
			String fname=request.getParameter("Fname");
			String Lname=request.getParameter("Lname");
			String dob=request.getParameter("dob");
			String gender=request.getParameter("gender");
			String job=request.getParameter("job");
			String mg=request.getParameter("mgr");
			String salar=request.getParameter("sal");
			String phon=request.getParameter("phone");
			String email=request.getParameter("email");
			String dn=request.getParameter("dno");
			String ci=request.getParameter("cid");
			String com=request.getParameter("comm");
			int mgr = Integer.parseInt(request.getParameter("mgr").trim());
			Long phone = Long.parseLong(request.getParameter("phone").trim());
			double salary = Double.parseDouble(request.getParameter("sal").trim());
			int dno = Integer.parseInt(request.getParameter("dno").trim());
			int cid = Integer.parseInt(request.getParameter("cid").trim());
			int comm = Integer.parseInt(request.getParameter("comm").trim());

			e.setFname(fname);
			e.setLname(Lname);
			e.setGender(gender);
			e.setDob(dob);
			e.setJob(job);
			e.setMgr(mgr);
			e.setSal(salary);
			e.setPhone(phone);
			e.setMail(email);
			e.setCid(cid);
			e.setDno(dno);
			e.setComm(comm);
			
			boolean res=dao.addEmployee(e);
			if(res) {
		     	   request.setAttribute("status", "inserted successfully");
               	dao.logAction("EMPLOYEE ADDED",(String) request.getAttribute("LogUser"), "EMP", "1");
		     	   RequestDispatcher rd=request.getRequestDispatcher("addEmp.jsp");
		     	   rd.forward(request, response);
		     	   
		        }else {
		     	   request.setAttribute("status", "failed to insert !");
		     	   RequestDispatcher rd=request.getRequestDispatcher("addEmp.jsp");
		     	   rd.forward(request, response);   
		        }
						
			
		}
		else if(request.getParameter("search_emp")!=null) {
			int id=Integer.parseInt(request.getParameter("eid"));
			Employee emp=dao.getEmployee(id);
			if(emp!=null) {
				request.setAttribute("delEmp",emp);
				RequestDispatcher rd=request.getRequestDispatcher("delete_emp.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("status", "Employee ID doesn't exist!!");
				RequestDispatcher rd=request.getRequestDispatcher("delete_emp.jsp");
				rd.forward(request, response);
			}
			
		}
		else if(request.getParameter("delete_emp")!=null) 
		{
			String id=request.getParameter("eid");
			int Eid=Integer.parseInt(id);
			boolean res=dao.deleteEmployee(Eid);
			if(res) {
				request.setAttribute("status", "Deleted successfully");
               	dao.logAction("EMPLOYEE DELETED",(String) request.getAttribute("LogUser"), "EMP", "1");

				RequestDispatcher rd=request.getRequestDispatcher("delete_emp.jsp");
				rd.forward(request, response);

			}else {
				request.setAttribute("status", "Failed to Delete !");
				RequestDispatcher rd=request.getRequestDispatcher("delete_emp.jsp");
				rd.forward(request, response);

			}
		}
		
		else if(request.getParameter("update")!=null) 
		{
		String ei=request.getParameter("eid");

		 int eid=Integer.parseInt(ei.trim());
		e=dao.getEmployee(eid);
		if(e!=null) {
	     	   request.setAttribute("updatemployee", e);
              	dao.logAction("EMPLOYEE UPDATED",(String) request.getAttribute("LogUser"), "EMP", "1");
	     	   RequestDispatcher rd=request.getRequestDispatcher("update_emp.jsp");
	     	   rd.forward(request, response);
	     	   
	        }else {

	     	   request.setAttribute("status", " Employee ID doesn't exist!");
	     	   RequestDispatcher rd=request.getRequestDispatcher("update_emp.jsp");
	     	   rd.forward(request, response);   
	        }
		}
		
		else if(request.getParameter("update1")!=null) {
		String ei=request.getParameter("Eid");
		String fname=request.getParameter("Fname");
		String Lname=request.getParameter("Lname");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String job=request.getParameter("job");
		String mg=request.getParameter("mgr");
		String salar=request.getParameter("sal");
		String phon=request.getParameter("phone");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		String dn=request.getParameter("dno");
		String ci=request.getParameter("cid");
		String com=request.getParameter("comm");
		String doj=request.getParameter("doj");
		int mgr=Integer.parseInt(mg.trim());
		Long phone=Long.parseLong(phon.trim());
		double salary=Double.parseDouble(salar.trim());
		int dno=Integer.parseInt(dn.trim());
		int cid=Integer.parseInt(ci.trim());
		int eid=Integer.parseInt(ei.trim());
		Double comm=Double.parseDouble(com.trim());
		e.setFname(fname);
		e.setLname(Lname);
		e.setGender(gender);
		e.setDob(dob);
		e.setJob(job);
		e.setMgr(mgr);
		e.setSal(salary);
		e.setPhone(phone);
		e.setMail(email);
		e.setCid(cid);
		e.setDno(dno);
		e.setComm(comm);
		e.setDoj(doj);
		e.setEmpid(eid);
		e.setPassword(pass);
		boolean b=dao.updateEmployee(e);
		
		if(b) {
			 request.setAttribute("status", "Successfully Updated!!");
	     	   RequestDispatcher rd=request.getRequestDispatcher("update_emp.jsp");
	     	   rd.forward(request, response);
	     	   
	        }else {
	     	   request.setAttribute("status", "Failed to Update!");
	     	   RequestDispatcher rd=request.getRequestDispatcher("update_emp.jsp");
	     	   rd.forward(request, response);   
	        }
			
		}
		
	}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}   
	}
	


