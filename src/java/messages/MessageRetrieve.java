/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package messages;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class MessageRetrieve 

{
    private long senderClientID;
    private long recipientClientID;
    private String creationTime;
    private long longitudinalCreationDate;
    private String message;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public MessageRetrieve(long senderClientID, long recipientClientID, long longitudinalCreationDate)
            
    {
        this.senderClientID = senderClientID;
        this.recipientClientID = recipientClientID;
        this.longitudinalCreationDate = longitudinalCreationDate;
        this.creationTime = String.valueOf(longitudinalCreationDate);
        this.message = null;
        
        constructRetrieve();
        
    }
    
    private void constructRetrieve()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT message FROM messages WHERE senderClientID=" + this.senderClientID + 
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
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    
                    this.message = resultSet.getString("message");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getMessage() 
    
    {
        return message;
    }
    
}
