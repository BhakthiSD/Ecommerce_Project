package com.ecom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecom.connection.ConnectionFactory;
import com.ecom.dto.Customer;
import com.ecom.dto.Department;
import com.ecom.dto.Employee;
import com.ecom.dto.Location;
import com.ecom.dto.Log;
import com.ecom.dto.Order;
import com.ecom.dto.Product;

import jakarta.servlet.http.HttpSession;

public class CompanyDAOImpl implements CompanyDAO {
	
	 private Connection con;
	public CompanyDAOImpl() {
		this.con=ConnectionFactory.requestConnection();
	}
      Log l=null;
	@Override
	public Employee getEmployee(String mail, String password) {
		PreparedStatement ps = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM EMP WHERE MAIL_ID=? AND PASSWORD=?";
	    Employee emp = null;
	    try {
	        ps = con.prepareStatement(query);
	        ps.setString(1, mail);
	        ps.setString(2, password);
	        rs = ps.executeQuery();
	        if(rs.next()) {  
	           emp = new Employee();
	            emp.setEmpid(rs.getInt(1));
	            emp.setFname(rs.getString(2));
	            emp.setLname(rs.getString(3));
	            emp.setDob(rs.getString(4));
	            emp.setGender(rs.getString(5));
	            emp.setJob(rs.getString(6));
	            emp.setMgr(rs.getInt(7));
	            emp.setDoj(rs.getString(8));
	            emp.setSal(rs.getDouble(9));
	            emp.setComm(rs.getDouble(10));
	            emp.setDno(rs.getInt(11));
	            emp.setCid(rs.getInt(12));
	            emp.setMail(rs.getString(13));
	            emp.setPhone(rs.getLong(14));
	            emp.setPassword(rs.getString(15)); 
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return emp;
	}
	
	public Employee getEmployee(String mail, long phone) {
		PreparedStatement ps = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM EMP WHERE MAIL_ID=? AND PHONE=?";
	    Employee emp = null;
	    try {
	        ps = con.prepareStatement(query);
	        ps.setString(1, mail);
	        ps.setLong(2, phone);
	        rs = ps.executeQuery();
	        if(rs.next()) {  
	           emp = new Employee();
	            emp.setEmpid(rs.getInt(1));
	            emp.setFname(rs.getString(2));
	            emp.setLname(rs.getString(3));
	            emp.setDob(rs.getString(4));
	            emp.setGender(rs.getString(5));
	            emp.setJob(rs.getString(6));
	            emp.setMgr(rs.getInt(7));
	            emp.setDoj(rs.getString(8));
	            emp.setSal(rs.getDouble(9));
	            emp.setComm(rs.getDouble(10));
	            emp.setDno(rs.getInt(11));
	            emp.setCid(rs.getInt(12));
	            emp.setMail(rs.getString(13));
	            emp.setPhone(rs.getLong(14));
	            emp.setPassword(rs.getString(15)); 
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return emp;
	}


	@Override
	public Employee getEmployee(String mail,Long phone,int empid) {
		 PreparedStatement ps = null;
		    ResultSet rs = null;
		    String query = "SELECT * FROM EMP WHERE EID=? AND MAIL_ID=? AND PHONE=?";
		    Employee emp = null;
		    try {
		        ps = con.prepareStatement(query);
		        ps.setInt(1, empid);
		        ps.setString(2, mail);
		        ps.setLong(3, phone);
		        rs = ps.executeQuery();
		        if(rs.next()) {  
		           emp = new Employee();
		            emp.setEmpid(rs.getInt(1));
		            emp.setFname(rs.getString(2));
		            emp.setLname(rs.getString(3));
		            emp.setDob(rs.getString(4));
		            emp.setGender(rs.getString(5));
		            emp.setJob(rs.getString(6));
		            emp.setMgr(rs.getInt(7));
		            emp.setDoj(rs.getString(8));
		            emp.setSal(rs.getDouble(9));
		            emp.setComm(rs.getDouble(10));
		            emp.setDno(rs.getInt(11));
		            emp.setCid(rs.getInt(12));
		            emp.setMail(rs.getString(13));
		            emp.setPhone(rs.getLong(14));
		            emp.setPassword(rs.getString(15)); 
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return emp;
	}
	public Employee getEmployee(int empid) {
		 PreparedStatement ps = null;
		    ResultSet rs = null;
		    String query = "SELECT * FROM EMP WHERE EID=?";
		    Employee emp = null;
		    try {
		        ps = con.prepareStatement(query);
		        ps.setInt(1, empid);
		        rs = ps.executeQuery();
		        if(rs.next()) {  
		           emp = new Employee();
		            emp.setEmpid(rs.getInt(1));
		            emp.setFname(rs.getString(2));
		            emp.setLname(rs.getString(3));
		            emp.setDob(rs.getString(4));
		            emp.setGender(rs.getString(5));
		            emp.setJob(rs.getString(6));
		            emp.setMgr(rs.getInt(7));
		            emp.setDoj(rs.getString(8));
		            emp.setSal(rs.getDouble(9));
		            emp.setComm(rs.getDouble(10));
		            emp.setDno(rs.getInt(11));
		            emp.setCid(rs.getInt(12));
		            emp.setMail(rs.getString(13));
		            emp.setPhone(rs.getLong(14));
		            emp.setPassword(rs.getString(15)); 
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return emp;
	}
	@Override
	public boolean updateEmployee(Employee e) {
		PreparedStatement ps=null;
		int res=0;
		String query="UPDATE EMP SET FNAME=?,LNAME=?,DOB=?,GENDER=?,JOB=?,MGR=?,DOJ=?,SAL=?,COMM=?,DNO=?,CID=?,MAIL_ID=?,PHONE=?,PASSWORD=? WHERE EID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, e.getFname());
			ps.setString(2, e.getLname());
			ps.setString(3, e.getDob());
			ps.setString(4, e.getGender());
			ps.setString(5, e.getJob());
			ps.setInt(6, e.getMgr());
			ps.setString(7, e.getDoj());
			ps.setDouble(8, e.getSal());
			ps.setDouble(9, e.getComm());
			ps.setInt(10, e.getDno());
			ps.setInt(11, e.getCid());
			ps.setString(12, e.getMail());
			ps.setLong(13, e.getPhone());
			ps.setString(14, e.getPassword());
			ps.setInt(15, e.getEmpid());
	
			res=ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if(res>0) {
			return true;
		}
		else {
        	System.out.println("Failed to update");
		    return false;
	    }
	}

	@Override
	public boolean deleteEmployee(int empid) {
		PreparedStatement ps=null;
		int res=0;
		String query="DELETE FROM EMP WHERE EID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, empid);
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {	
			return true;
		}else {	
		    return false;
		}
	}

	@Override
	public List<Employee> getAllEmployee() {
		 PreparedStatement ps = null;
		    ResultSet rs = null;
		    String query = "SELECT * FROM EMP";
		    Employee emp = null;
		    ArrayList<Employee> employees=new ArrayList<Employee>();
		    try {
		        ps = con.prepareStatement(query);
		        rs = ps.executeQuery();
		         while(rs.next()) {  
		           emp = new Employee();
		           emp.setEmpid(rs.getInt(1));
		            emp.setFname(rs.getString(2));
		            emp.setLname(rs.getString(3));
		            emp.setDob(rs.getString(4));
		            emp.setGender(rs.getString(5));
		            emp.setJob(rs.getString(6));
		            emp.setMgr(rs.getInt(7));
		            emp.setDoj(rs.getString(8));
		            emp.setSal(rs.getDouble(9));
		            emp.setComm(rs.getDouble(10));
		            emp.setDno(rs.getInt(11));
		            emp.setCid(rs.getInt(12));
		            emp.setMail(rs.getString(13));
		            emp.setPhone(rs.getLong(14));
		            emp.setPassword(rs.getString(15)); 
		            employees.add(emp);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return employees ;
	}

	@Override
	public boolean addEmployee(Employee e) {
		PreparedStatement ps=null;
		int res=0;
		String query="INSERT INTO EMP (EID,FNAME,LNAME,DOB,GENDER,JOB,MGR,DOJ,SAL,COMM,DNO,CID,MAIL_ID,PHONE) VALUES(0,?,?,?,?,?,?,CURDATE(),?,?,?,?,?,?)";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, e.getFname());
			ps.setString(2, e.getLname());
			ps.setString(3, e.getDob());
			ps.setString(4, e.getGender());
			ps.setString(5, e.getJob());
			ps.setInt(6, e.getMgr());
			ps.setDouble(7, e.getSal());
			ps.setDouble(8, e.getComm());
			ps.setInt(9, e.getDno());
			ps.setInt(10, e.getCid());
			ps.setString(11, e.getMail());
			ps.setLong(12, e.getPhone());
			res=ps.executeUpdate();
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if(res>0) {
			//l=new Log();
	       // HttpSession session = request.getSession(false); 
         //   logAction("EMP_ADD",l.getSessionUser(), "EMP", String.valueOf(e.getEmpid()));

			return true;
		}else {
		    System.out.println("Employee insertion failed.");

		return false;
		}
	}

	@Override
	public Customer getCustomer(int cid) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM CUSTOMER WHERE CID=?";
		Customer c=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, cid);
			rs=ps.executeQuery();
			if(rs.next()) {
				c=new Customer();
				c.setCid(rs.getInt(1));
				c.setFirst_name(rs.getString(2));
				c.setLast_name(rs.getString(3));
				c.setLid(rs.getInt(4));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c ;
	}

	@Override
	public List<Customer> getCustomer() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM CUSTOMER";
		Customer c=null;
		ArrayList<Customer> customers=new ArrayList<Customer>();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				c=new Customer();
				c.setCid(rs.getInt(1));
				c.setFirst_name(rs.getString(2));
				c.setLast_name(rs.getString(3));
				c.setLid(rs.getInt(4));	
				customers.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customers;

	}
	
//	@Override
//	public boolean addCustomer(Customer c) {
//		PreparedStatement ps=null;
//		int res=0;
//		String query="INSERT INTO CUSTOMER CID,FIRST_NAME,LAST_NAME,LID VALUES (0,?,?,?)";
//		
//		try {
//			ps=con.prepareStatement(query);
//			ps.setInt(1, c.getCid());
//			ps.setString(2, c.getFirst_name());
//			ps.setString(3, c.getLast_name());
//			ps.setInt(4, c.getLid());
//			res=ps.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		if(res>0) {	
//			return true;
//		}else {	
//		    return false;
//		}
//	}

//	@Override
//	public boolean updateCustomer(Customer c) {
//		PreparedStatement ps=null;
//		int res=0;
//		String query="UPDATE CUSTOMER SET FIRST_NAME=?,LAST_NAME=?,LID=? WHERE CID=?";
//		try {
//			ps=con.prepareStatement(query);
//			ps.setString(1, c.getFirst_name());
//			ps.setString(2, c.getLast_name());
//			ps.setInt(3, c.getLid());
//			ps.setInt(4, c.getCid());
//			res=ps.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		if(res>0) {
//			return true;
//		}
//		else {
//		    return false;
//	    }
//	}
//	
//	@Override
//	public boolean deleteCustomer(int cid) {
//		PreparedStatement ps=null;
//		int res=0;
//		String query="DELETE FROM CUSTOMER WHERE CID=?";
//		try {
//			ps=con.prepareStatement(query);
//			ps.setInt(1, cid);
//			res=ps.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		if(res>0) {	
//			return true;
//		}else {	
//		    return false;
//		}
//	}

	@Override
	public Location getLocation(int lid) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM LOCATION WHERE LID=?";
		Location l=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, lid);
			rs=ps.executeQuery();
			if(rs.next()) {
				l=new Location();
				l.setLid(rs.getInt(1));
				l.setLocation(rs.getString(2));
				l.setCity(rs.getString(3));
				l.setState(rs.getString(4));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l ;
	}
	//custom implementation to get location  from lid
	public Location getLocationValue(int lid) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM LOCATION WHERE LID=?";
		Location l=null;
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, lid);
			rs=ps.executeQuery();
			if(rs.next()) {
				l=new Location();
				l.setLid(rs.getInt(1));
				l.setLocation(rs.getString(2));
				l.setCity(rs.getString(3));
				l.setState(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}
        public int getLocationId(String loc) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from location where LOCATION = ?";
		int lid = 0;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, loc);
			rs = ps.executeQuery();
			while(rs.next()) {
				lid = rs.getInt("lid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return lid;
	     }		

	@Override
	public boolean addLocation(Location l) {
		PreparedStatement ps=null;
		int res=0;
		String query="INSERT INTO LOCATION (LID,LOCATION,CITY,STATE) VALUES (0,?,?,?)";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, l.getLocation());
			ps.setString(2, l.getCity());
			ps.setString(3, l.getState());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {	
			return true;
		}else {	
		    return false;
		}
	}

	@Override
	public boolean updateLocation(Location l) {
		PreparedStatement ps=null;
		int res=0;
		String query="UPDATE LOCATION SET LOCATION=?,CITY=?,STATE=? WHERE LID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, l.getLocation());
			ps.setString(2, l.getCity());
			ps.setString(3, l.getState());
			ps.setInt(4, l.getLid());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}
		else {
		    return false;
	    }
	}

	@Override
	public boolean deleteLocation(int lid) {
		PreparedStatement ps=null;
		int res=0;
		String query="DELETE FROM LOCATION WHERE LID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, lid);
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {	
			return true;
		}else {	
		    return false;
		}
	}

	@Override
	public List<Location> getLocation() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM LOCATION";
		Location l=null;
		ArrayList<Location> locations=new ArrayList<Location>();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				l=new Location();
				l.setLid(rs.getInt(1));
				l.setLocation(rs.getString(2));
				l.setCity(rs.getString(3));
				l.setState(rs.getString(4));
				locations.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return locations;
	}

	@Override
	public Product getProduct(int productId) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM PRODUCT WHERE PRODUCT_ID=?";
		Product p=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, productId);
			rs=ps.executeQuery();
			if(rs.next()) {
				p=new Product();
				p.setProductId(rs.getInt(1));
				p.setP_Name(rs.getString(2));
				p.setPrice(rs.getDouble(3));
				p.setP_image(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p ;
	}

	@Override
	public boolean addProduct(Product p) {
		PreparedStatement ps=null;
		int res=0;
		String query="INSERT INTO PRODUCT (PRODUCT_ID,PNAME,PRICE,P_IMAGE) VALUES (0,?,?,?)";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, p.getP_Name());
			ps.setDouble(2, p.getPrice());
			ps.setString(3, p.getP_image());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {	
			return true;
		}else {	
		    return false;
		}
	}

	@Override
	public boolean updateProduct(Product p) {
		PreparedStatement ps=null;
		int res=0;
		String query="UPDATE PRODUCT SET PNAME=?,PRICE=?,P_IMAGE=? WHERE PRODUCT_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, p.getP_Name());
			ps.setDouble(2, p.getPrice());
			ps.setString(3, p.getP_image());
			ps.setInt(4, p.getProductId());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}
		else {
		    return false;
	    }
	}

	@Override
	public boolean deleteProduct(int productId) {
		PreparedStatement ps=null;
		int res=0;
		String query="DELETE FROM PRODUCT WHERE PRODUCT_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, productId);
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {	
			return true;
		}else {	
		    return false;
		}
	}

	@Override
	public List<Product> getProduct() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM PRODUCT";
		Product p=null;
		ArrayList<Product> products=new ArrayList<Product>();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setProductId(rs.getInt(1));
				p.setP_Name(rs.getString(2));
				p.setPrice(rs.getDouble(3));
				p.setP_image(rs.getString(4));

				products.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	@Override
	public Order getOrder(int order_id) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM ORDERS WHERE ORDER_ID=?";
		Order o=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, order_id);
			rs=ps.executeQuery();
			if(rs.next()) {
				o=new Order();
				o.setOrder_id(rs.getInt(1));
				o.setProduct_id(rs.getInt(2));
				o.setOrder_date(rs.getDate(3));
				o.setDelivery_date(rs.getDate(4));
				o.setEid(rs.getInt(5));
				o.setCid(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return o;
	}

	@Override
	public List<Order> getOrder() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM ORDERS";
		Order o=null;
		ArrayList<Order> Orders=new ArrayList<Order>();

		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				o=new Order();
				o.setOrder_id(rs.getInt(1));
				o.setProduct_id(rs.getInt(2));
				o.setOrder_date(rs.getDate(3));
				o.setDelivery_date(rs.getDate(4));
				o.setEid(rs.getInt(5));
				o.setCid(rs.getInt(6));
				Orders.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return Orders;
	}

	@Override
	public Department getDept(int dno) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM DEPT WHERE DNO=?";
		Department d=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, dno);
			rs=ps.executeQuery();
			if(rs.next()) {
				d=new Department();
				d.setDno(rs.getInt(1));
				d.setDname(rs.getString(2));
				d.setLid(rs.getInt(3));					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public boolean addDept(Department d) {
		PreparedStatement ps=null;
		int res=0;
		String query="INSERT INTO DEPT (DNO,DNAME,LID) VALUES (0,?,?)";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, d.getDname());
			ps.setInt(2, d.getLid());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {	
			return true;
		}else {	
		    return false;
		}
	}

	@Override
	public boolean updateDept(Department d) {
		PreparedStatement ps=null;
		int res=0;
		String query="UPDATE DEPT SET DNAME=?,LID=? WHERE DNO=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, d.getDname());
			ps.setInt(2, d.getLid());
			ps.setInt(3, d.getDno());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}
		else {
		    return false;
	    }
	}

	@Override
	public boolean deleteDept(int dno) {
		PreparedStatement ps=null;
		int res=0;
		String query="DELETE FROM DEPT WHERE DNO=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, dno);
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {	
			return true;
		}else {	
		    return false;
		}
	}

	@Override
	public List<Department> getDept() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM DEPT";
		Department d=null;
		ArrayList<Department> departments=new ArrayList<Department>();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				d=new Department();
				d.setDno(rs.getInt(1));
				d.setDname(rs.getString(2));
				d.setLid(rs.getInt(3));	
				departments.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return departments;
	}
	public Department getDept(String dname, int lid) {
		PreparedStatement ps = null;
		String query = "select * from dept where DNAME = ? and LID = ?";
		ResultSet rs = null;
		Department d = null;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, dname);
			ps.setInt(2, lid);
			rs = ps.executeQuery();
			if(rs.next()) {
				d = new Department();
				d.setDno(rs.getInt("dno"));
				d.setDname(rs.getString("DNAME"));
				d.setLid(rs.getInt("LID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	public void logAction(String action, String user, String tableName, String recordId) {
	    PreparedStatement ps = null;
	    String query = "INSERT INTO log_actions (action, user, table_name, record_id, timestamp) VALUES (?, ?, ?, ?, NOW())";

	    try {
	        ps = con.prepareStatement(query);
	        ps.setString(1, action);
	        ps.setString(2, user);
	        ps.setString(3, tableName);
	        ps.setString(4, recordId);
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public ArrayList<Log> getLog(){
	    PreparedStatement ps = null;
	    ResultSet rs=null;
	    ArrayList<Log> al=new ArrayList<>();
	    Log l=null;
        String query="SELECT * FROM ACTION_LOGS";
        try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				l=new Log();
				l.setAction_id(rs.getInt("id"));
				l.setAction(rs.getString("action"));
				l.setUser(rs.getString("user"));
				l.setTableName(rs.getString("table_name"));
				l.setRecordId(rs.getString("record_id"));
				l.setTimestamp(rs.getTimestamp("timestamp"));
				al.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return al;
	}



		
}

