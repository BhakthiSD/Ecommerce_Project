package com.ecom.dto;
import java.sql.Timestamp;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
       
public class Log {
    private String action;     
    private String user;       
    private String tableName;  
    private String recordId;    
    private Timestamp timestamp; 
    private int action_id;
    public int getAction_id() {
		return action_id;
	}
	public void setAction_id(int action_id) {
		this.action_id = action_id;
	}
	// Constructor
    public Log(String action, String user, String tableName, String recordId) {
        this.action = action;
        this.user = user;
        this.tableName = tableName;
        this.recordId = recordId;
        this.timestamp = new Timestamp(System.currentTimeMillis());
    }
     public Log() {
    	 
     }
    // Getters
    public String getAction() {
        return action;
    }

    public String getUser() {
        return user;
    }

    public String getTableName() {
        return tableName;
    }

    public String getRecordId() {
        return recordId;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    // Setters (if needed)
    public void setAction(String action) {
        this.action = action;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId;
    }
    
    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    public static String getSessionUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Employee loggedInUser = (Employee) session.getAttribute("employee");
            if (loggedInUser != null) {
                return loggedInUser.getEmpid() + " - " + loggedInUser.getFname();
            }
        }
        return "UnknownUser";
    }
}


