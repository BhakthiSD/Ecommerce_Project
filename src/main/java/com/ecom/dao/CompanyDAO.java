package com.ecom.dao;

import java.util.List;

import com.ecom.dto.Customer;
import com.ecom.dto.Department;
import com.ecom.dto.Employee;
import com.ecom.dto.Location;
import com.ecom.dto.Order;
import com.ecom.dto.Product;

public interface CompanyDAO {
	    //Employee CRUD mainly for CEO and HR
		Employee getEmployee(String mail,Long phone,int empid);//to create new password for employee
		boolean updateEmployee(Employee e);
		boolean deleteEmployee(int empid);
		List<Employee> getAllEmployee();
		boolean addEmployee(Employee e);
		Employee getEmployee(int empid);
	    Employee getEmployee(String mail,String password);//to validate login

		
		Customer getCustomer(int cid);
		//boolean addCustomer(Customer c);
		//boolean updateCustomer(Customer c);
		//boolean deleteCustomer(int cid);
		List<Customer> getCustomer();
		
		Location getLocation(int lid);
		boolean addLocation(Location l);
		boolean updateLocation(Location l);
		boolean deleteLocation(int lid);
		List<Location> getLocation();//Need to discuss further on this method,temporarily let it be here
		
		Product getProduct(int productId);
		boolean addProduct(Product p);
		boolean updateProduct(Product p);
		boolean deleteProduct(int productId);
		List<Product> getProduct();//Need to discuss further on this method,temporarily let it be here
		
		Order getOrder(int order_id);
		//boolean addOrder(Order o);
		//boolean updateOrder(Order o);
		//boolean deleteOrder(int order_id);
		List<Order> getOrder();	//Need to discuss further on this method,temporarily let it be here
		
		Department getDept(int dno);
		boolean addDept(Department d);
		boolean updateDept(Department d);
		boolean deleteDept(int dno);
		List<Department> getDept();//Need to discuss further on this method,temporarily let it be here
		
		void logAction(String action, String user, String tableName, String recordId); //log
		}
