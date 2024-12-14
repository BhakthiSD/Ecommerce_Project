package com.ecom.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ecom.dao.CompanyDAO;
import com.ecom.dao.CompanyDAOImpl;
import com.ecom.dto.Location;
import com.ecom.dto.Product;

@WebServlet("/salesman")
public class Totalsalesman extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           HttpSession session =request.getSession(false);
		/*
		 * if(request.getParameter("sproduct")!=null) { CompanyDAO dao = new
		 * CompanyDAOImpl();
		 * 
		 * String pid=request.getParameter("productId");
		 * 
		 * if(pid!=null&&!pid.isEmpty()) { int Id=Integer.parseInt(pid); Product
		 * p=dao.getProduct(Id); request.getSession().setAttribute("product", p);
		 * request.getRequestDispatcher("ViewProduct.jsp").forward(request, response);
		 * 
		 * } }
		 * 
		 * if(request.getParameter("slocation")!=null) { CompanyDAO dao = new
		 * CompanyDAOImpl(); String lid=request.getParameter("locationId");
		 * 
		 * if(lid!=null&&!lid.isEmpty()){ int LId=Integer.parseInt(lid); Location
		 * l=dao.getLocation(LId); request.getSession().setAttribute("location", l);
		 * request.getRequestDispatcher("ViewLocation.jsp").forward(request, response);
		 * }
		 * 
		 * }
		 */

		if (request.getParameter("pedit") != null) {
   
			CompanyDAO dao = new CompanyDAOImpl();
			Product p = new Product();

			String pid = request.getParameter("Id");
			String name = request.getParameter("pname");
			String price = request.getParameter("pprice");
			String image = request.getParameter("image");

			    if(pid != null && !pid.isEmpty()) {
			int Pid = Integer.parseInt(pid);
			p.setProductId(Pid);
			/* p = dao.getProduct(Pid); */
			    }
			if (name != null && !name.isEmpty()) {
				p.setP_Name(name);
			}
			if (price != null && !price.isEmpty()) {
				double Price = Double.parseDouble(price);
				p.setPrice(Price);
			}
			if (image != null && !image.isEmpty()) {
				p.setP_image(image);
			}
			

			boolean res = dao.updateProduct(p);
			if (res) {
               	dao.logAction("PRODUCT UPDATE",(String) session.getAttribute("LogUser"), "PRODUCT", "8");
				request.setAttribute("success", "updated successfully");
				RequestDispatcher rd = request.getRequestDispatcher("ProductEdit.jsp");
				rd.forward(request, response);

			} else {
				request.setAttribute("failure", "failed to updated !");
				RequestDispatcher rd = request.getRequestDispatcher("ProductEdit.jsp");
				rd.forward(request, response);
			}
		}

		if (request.getParameter("pdelete") != null) {
			CompanyDAO dao = new CompanyDAOImpl();
			Product p = new Product();
			String pid = request.getParameter("id");

			int Pid = Integer.parseInt(pid);

			boolean res = dao.deleteProduct(Pid);

			
			  if(res) {
	               	dao.logAction("PRODUCT DELETE",(String) session.getAttribute("LogUser"), "PRODUCT", "9");

				  request.setAttribute("success", "Deleted successfully");
					/*
					 * RequestDispatcher rd=request.getRequestDispatcher("ProductDelete.jsp");
					 */		
			  RequestDispatcher rd=request.getRequestDispatcher("ViewProduct.jsp");

			  rd.forward(request, response);
			  
			  }else { request.setAttribute("failure", "failed to Delete !");
					/* RequestDispatcher rd=request.getRequestDispatcher("ProductDelete.jsp"); */
			  RequestDispatcher rd=request.getRequestDispatcher("ViewProduct.jsp");
			  rd.forward(request, response);
			  
			  }
			 
		}

		if (request.getParameter("ledit") != null) {
			CompanyDAO dao = new CompanyDAOImpl();
			Location l = new Location();

			String lid = request.getParameter("LId");
			String location = request.getParameter("location");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			
             if(lid !=null && !lid.isEmpty()) {
			int Lid = Integer.parseInt(lid);
			l.setLid(Lid);
			/* l = dao.getLocation(Lid); */			
             }
			if (location != null && !location.isEmpty()) {
				l.setLocation(location);
			}
			if (city != null && !city.isEmpty()) {
				l.setCity(city);
			}
			if (state != null && !state.isEmpty()) {
				l.setState(state);
			}

			boolean res = dao.updateLocation(l);
			if (res) {
               	dao.logAction("location UPDATE",(String) session.getAttribute("LogUser"), "LOCATION", "10");

				request.setAttribute("success", "updated successfully");
				RequestDispatcher rd = request.getRequestDispatcher("LocationEdit.jsp");
				rd.forward(request, response);

			} else {
				request.setAttribute("failure", "failed to updated !");
				RequestDispatcher rd = request.getRequestDispatcher("LocationEdit.jsp");
				rd.forward(request, response);
			}

		}

		if (request.getParameter("ldelete") != null) {
			CompanyDAO dao = new CompanyDAOImpl();
			Location l = new Location();

			String lid = request.getParameter("id");

			int Lid = Integer.parseInt(lid);

			boolean res = dao.deleteLocation(Lid);

			if (res) {
               	dao.logAction("LOCATION DELETE",(String) session.getAttribute("LogUser"), "LOCATION", "11");
				request.setAttribute("success", "Deleted successfully");
				/* RequestDispatcher rd = request.getRequestDispatcher("LocationDelete.jsp"); */
				 RequestDispatcher rd=request.getRequestDispatcher("ViewLocation.jsp");
				rd.forward(request, response);

			} else {
				request.setAttribute("failure", "failed to Delete !");
				/* RequestDispatcher rd = request.getRequestDispatcher("LocationDelete.jsp"); */
				 RequestDispatcher rd=request.getRequestDispatcher("ViewLocation.jsp");
				rd.forward(request, response);

			}
		}

		if (request.getParameter("insertproduct") != null) {
			CompanyDAO dao = new CompanyDAOImpl();
			Product p = new Product();

			String name = request.getParameter("pname");
			String price = request.getParameter("pprice");
			String Image = request.getParameter("image");
			double Price = Double.parseDouble(price);

			p.setP_Name(name);
			p.setPrice(Price);
			p.setP_image(Image);

			boolean res = dao.addProduct(p);
			if (res) {
               	dao.logAction("PRODUCT ADDED",(String) session.getAttribute("LogUser"), "PRODUCT", "11");
				request.setAttribute("success", "inserted successfully");
				RequestDispatcher rd = request.getRequestDispatcher("ProductInsert.jsp");
				rd.forward(request, response);

			} else {
				request.setAttribute("failure", "failed to insert !");
				RequestDispatcher rd = request.getRequestDispatcher("ProductInsert.jsp");
				rd.forward(request, response);
			}
		}

		if (request.getParameter("insertlocation") != null) {
			CompanyDAO dao = new CompanyDAOImpl();
			Location l = new Location();

			String location = request.getParameter("location");
			String city = request.getParameter("city");
			String state = request.getParameter("state");

			l.setLocation(location);
			l.setCity(city);
			l.setState(state);

			boolean res = dao.addLocation(l);
			if (res) {
               	dao.logAction("LOCATION ADDED",(String) session.getAttribute("LogUser"), "LOCATION", "12");
				request.setAttribute("success", "inserted successfully");
				RequestDispatcher rd = request.getRequestDispatcher("LocationInsert.jsp");
				rd.forward(request, response);

			} else {
				request.setAttribute("failure", "failed to insert !");
				RequestDispatcher rd = request.getRequestDispatcher("LocationInsert.jsp");
				rd.forward(request, response);
			}
		}

	}

}
