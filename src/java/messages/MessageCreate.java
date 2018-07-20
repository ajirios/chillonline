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
public class MessageCreate 

{
    private long senderClientID;
    private long recipientClientID;
    private String creationTime;
    private long longitudinalCreationDate;
    private String message;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public MessageCreate(String message, long senderClientID, long recipientClientID, String creationTime)
            
    {
        this.senderClientID = senderClientID;
        this.recipientClientID = recipientClientID;
        this.creationTime = creationTime;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.message = message;
        
        insertMessage();
        
    }
    
    private void insertMessage()
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        message = modifyChars(message);
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO `messages`(senderClientID, recipientClientID, message, creationTime, longitudinalCreationDate) "
                    + "VALUES(" + this.senderClientID 
                    + ", " + this.recipientClientID 
                    + ", '" + this.message 
                    + "', '" + this.creationTime 
                    + "', " + this.longitudinalCreationDate 
                    + ")");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the result
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private String modifyChars(String movieName)
            
    {
        String modification;
        char[] prohibitedChars = new char[2];
        int count;
        int index;
        boolean prohibitedExists = false;
        
        prohibitedChars[0] = '`';
        prohibitedChars[1] = '~';
        modification = "";
        
        for (count = 0; count < movieName.length(); count++)
            
        {
            
            if (movieName.charAt(count) == '\'')
            
            {
                modification = modification + '\\'; 
            }
            
            if (movieName.charAt(count) == '\"')
            
            {
                modification = modification + '\\'; 
            }
            
            for (index = 0; index < prohibitedChars.length; index++)
                
            {
                
                if (movieName.charAt(count) == prohibitedChars[index])

                {
                    prohibitedExists = true;
                }
                
            }
            
            if (prohibitedExists == false)
                
            {
                modification = modification + movieName.charAt(count);
            }
            
        }
        
        return modification;
        
    }
    
}
