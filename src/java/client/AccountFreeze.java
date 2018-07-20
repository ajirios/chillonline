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
public class AccountFreeze 

{
    private long freezeID;
    private long clientID;
    private String freezeReason;
    private String freezeDuration;
    private String password;
    private String freezeDateTime;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public AccountFreeze(long clientID, String freezeReason, String freezeDuration, String password)
            
    {
        this.freezeID = 0;
        this.clientID = clientID;
        this.password = password;
        this.freezeReason = freezeReason;
        this.freezeDuration = freezeDuration;
        this.freezeDateTime = null;
        
        setClientID(clientID);
        
        if (!freezeReason.equals(""))
            
        {
            setFreezeReason(freezeReason);
        }
        
        if (!freezeDuration.equals(""))
            
        {
            setFreezeDuration(freezeDuration);
        }
        
    }

    public long getFreezeID() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeIDStatement;
        ResultSet freezeIDSet;
        
        //initialise objects for backup
        connection = null;
        setFreezeIDStatement = null;
        freezeIDSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeIDStatement = connection.prepareStatement("SELECT freezeID FROM account-freezes WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeIDStatement != null)
                
            {
            
                freezeIDSet = setFreezeIDStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (freezeIDSet.next() == true)
                
            {
            
                this.freezeID = Long.parseLong(freezeIDSet.getString("freezeID")); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return freezeID;
    }

    public void setFreezeID(long freezeID) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeIDStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setFreezeIDStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeIDStatement = connection.prepareStatement("UPDATE account-freezes set freezeID=" + freezeID + " WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeIDStatement != null)
                
            {
            
                result = setFreezeIDStatement.executeUpdate(); 
                this.freezeID = freezeID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public long getClientID() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClientIDStatement;
        ResultSet clientIDSet;
        
        //initialise objects for backup
        connection = null;
        setClientIDStatement = null;
        clientIDSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClientIDStatement = connection.prepareStatement("SELECT clientID FROM `account-freezes` WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClientIDStatement != null)
                
            {
            
                clientIDSet = setClientIDStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (clientIDSet.next() == true)
                
            {
            
                this.clientID = Long.parseLong(clientIDSet.getString("clientID")); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClientIDStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setClientIDStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClientIDStatement = connection.prepareStatement("UPDATE `account-freezes` set clientID=" + clientID + " WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClientIDStatement != null)
                
            {
            
                result = setClientIDStatement.executeUpdate(); 
                this.clientID = clientID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getFreezeReason() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeReasonStatement;
        ResultSet freezeReasonSet;
        
        //initialise objects for backup
        connection = null;
        setFreezeReasonStatement = null;
        freezeReasonSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeReasonStatement = connection.prepareStatement("SELECT freezeReason FROM `account-freezes` WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeReasonStatement != null)
                
            {
            
                freezeReasonSet = setFreezeReasonStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (freezeReasonSet.next() == true)
                
            {
            
                this.freezeReason = freezeReasonSet.getString("freezeReason"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return freezeReason;
    }

    public void setFreezeReason(String freezeReason) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeReasonStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setFreezeReasonStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeReasonStatement = connection.prepareStatement("UPDATE `account-freezes` set freezeReason='" + freezeReason + "' WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeReasonStatement != null)
                
            {
            
                result = setFreezeReasonStatement.executeUpdate(); 
                this.freezeReason = freezeReason;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getFreezeDuration() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeDurationStatement;
        ResultSet freezeDurationSet;
        
        //initialise objects for backup
        connection = null;
        setFreezeDurationStatement = null;
        freezeDurationSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeDurationStatement = connection.prepareStatement("SELECT freezeDuration FROM `account-freezes` WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeDurationStatement != null)
                
            {
            
                freezeDurationSet = setFreezeDurationStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (freezeDurationSet.next() == true)
                
            {
            
                this.freezeDuration = freezeDurationSet.getString("freezeDuration"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return freezeDuration;
    }

    public void setFreezeDuration(String freezeDuration) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeDurationStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setFreezeDurationStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeDurationStatement = connection.prepareStatement("UPDATE `account-freezes` set freezeDuration='" + freezeDuration + "' WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeDurationStatement != null)
                
            {
            
                result = setFreezeDurationStatement.executeUpdate(); 
                this.freezeDuration = freezeDuration;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getFreezeDateTime() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeDateTimeStatement;
        ResultSet freezeDateTimeSet;
        
        //initialise objects for backup
        connection = null;
        setFreezeDateTimeStatement = null;
        freezeDateTimeSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeDateTimeStatement = connection.prepareStatement("SELECT freezeDateTime FROM `account-freezes` WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeDateTimeStatement != null)
                
            {
            
                freezeDateTimeSet = setFreezeDateTimeStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (freezeDateTimeSet.next() == true)
                
            {
            
                this.freezeDateTime = freezeDateTimeSet.getString("freezeDateTime"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return freezeDateTime;
    }

    public void setFreezeDateTime(String freezeDateTime) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setFreezeDateTimeStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setFreezeDateTimeStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setFreezeDateTimeStatement = connection.prepareStatement("UPDATE `account-freezes` set freezeDateTime='" + freezeDateTime + "' WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setFreezeDateTimeStatement != null)
                
            {
            
                result = setFreezeDateTimeStatement.executeUpdate(); 
                this.freezeDateTime = freezeDateTime;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getPassword() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setPasswordStatement;
        ResultSet passwordSet;
        
        //initialise objects for backup
        connection = null;
        setPasswordStatement = null;
        passwordSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setPasswordStatement = connection.prepareStatement("SELECT password FROM `account-freezes` WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setPasswordStatement != null)
                
            {
            
                passwordSet = setPasswordStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (passwordSet.next() == true)
                
            {
            
                this.password = passwordSet.getString("password"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return password;
    }

    public void setPassword(String password) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setPasswordStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setPasswordStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setPasswordStatement = connection.prepareStatement("UPDATE `account-freezes` set password='" + password + "' WHERE freezeID=" + this.freezeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setPasswordStatement != null)
                
            {
            
                result = setPasswordStatement.executeUpdate(); 
                this.password = password;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
