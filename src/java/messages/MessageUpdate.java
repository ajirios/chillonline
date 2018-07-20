/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package messages;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class MessageUpdate 

{
    private long senderClientID;
    private long recipientClientID;
    private String creationTime;
    private long longitudinalCreationDate;
    private String message;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public MessageUpdate(long senderClientID, long recipientClientID, long longitudinalCreationDate)
            
    {
        this.senderClientID = senderClientID;
        this.recipientClientID = recipientClientID;
        this.longitudinalCreationDate = longitudinalCreationDate;
        this.creationTime = String.valueOf(longitudinalCreationDate);
        this.message = null;
    }

    public void setSenderClientID(long senderClientID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE messages SET senderClientID=" + senderClientID + " WHERE senderClientID=" + this.senderClientID + 
                    " AND recipientClientID=" + this.recipientClientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
                this.senderClientID = senderClientID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setRecipientClientID(long recipientClientID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE messages SET recipientClientID=" + recipientClientID + " WHERE senderClientID=" + this.senderClientID + 
                    " AND recipientClientID=" + this.recipientClientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
                this.recipientClientID = recipientClientID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setCreationTime(String creationTime) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE messages SET creationTime='" + creationTime + "' WHERE senderClientID=" + this.senderClientID + 
                    " AND recipientClientID=" + this.recipientClientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
                this.creationTime = creationTime;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setLongitudinalCreationDate(long longitudinalCreationDate) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE messages SET longitudinalCreationDate=" + longitudinalCreationDate + " WHERE senderClientID=" + this.senderClientID + 
                    " AND recipientClientID=" + this.recipientClientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
                this.longitudinalCreationDate = longitudinalCreationDate;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setMessage(String message) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE messages SET message='" + message + "' WHERE senderClientID=" + this.senderClientID + 
                    " AND recipientClientID=" + this.recipientClientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
                this.message = message;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
