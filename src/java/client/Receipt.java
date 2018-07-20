/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class Receipt 

{
    private long clientID;
    private String email;
    private String password;
    private long programID;
    private long packageID;
    private Program program;
    private Package carrierPackage;
    private String department;
    private String transactionType;
    private String programName;
    private String programPoster;
    private String producer;
    private String productionCountry;
    private String subtotal;
    private String gst;
    private String pst;
    private String total;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Receipt(long clientID, String email, String password, long programID, String department, String transactionType, String programName, String programPoster, String producer, String productionCountry, String subtotal, String gst, String pst, String total)
            
    {
        this.clientID = clientID;
        this.programID = programID;
        this.department = department;
        this.transactionType = transactionType;
        this.programName = programName;
        this.programPoster = programPoster;
        this.producer = producer;
        this.productionCountry = productionCountry;
        this.subtotal = subtotal;
        this.gst = gst;
        this.pst = pst;
        this.total = total;
        this.packageID = -1;
        this.email = email;
        this.password = password;
        this.program = null;
        this.carrierPackage = null;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public String getEmail() 
    
    {
        return email;
    }

    public void setEmail(String email) 
    
    {
        this.email = email;
    }

    public String getPassword() 
    
    {
        return password;
    }

    public void setPassword(String password) 
    
    {
        this.password = password;
    }

    public long getProgramID() 
    
    {
        return programID;
    }

    public void setProgramID(long programID) 
    
    {
        this.programID = programID;
    }

    public long getPackageID() 
    
    {
        return packageID;
    }

    public void setPackageID(long packageID) 
    
    {
        this.packageID = packageID;
    }

    public Program getProgram() 
    
    {
        return program;
    }

    public void setProgram(Program program) 
    
    {
        this.program = program;
    }

    public Package getCarrierPackage() 
    
    {
        return carrierPackage;
    }

    public void setCarrierPackage(Package carrierPackage) 
    
    {
        this.carrierPackage = carrierPackage;
    }

    public String getDepartment() 
    
    {
        return department;
    }

    public void setDepartment(String department) 
    
    {
        this.department = department;
    }

    public String getTransactionType() 
    
    {
        return transactionType;
    }

    public void setTransactionType(String transactionType) 
    
    {
        this.transactionType = transactionType;
    }

    public String getProgramName() 
    
    {
        return programName;
    }

    public void setProgramName(String programName) 
    
    {
        this.programName = programName;
    }

    public String getProgramPoster() 
    
    {
        return programPoster;
    }

    public void setProgramPoster(String programPoster) 
    
    {
        this.programPoster = programPoster;
    }

    public String getProducer() 
    
    {
        return producer;
    }

    public void setProducer(String producer) 
    
    {
        this.producer = producer;
    }

    public String getProductionCountry() 
    
    {
        return productionCountry;
    }

    public void setProductionCountry(String productionCountry) 
    
    {
        this.productionCountry = productionCountry;
    }

    public String getSubtotal() 
    
    {
        return subtotal;
    }

    public void setSubtotal(String subtotal) 
    
    {
        this.subtotal = subtotal;
    }

    public String getGst() 
    
    {
        return gst;
    }

    public void setGst(String gst) 
    
    {
        this.gst = gst;
    }

    public String getPst() 
    
    {
        return pst;
    }

    public void setPst(String pst) 
    
    {
        this.pst = pst;
    }

    public String getTotal() 
    
    {
        return total;
    }

    public void setTotal(String total) 
    
    {
        this.total = total;
    }

}