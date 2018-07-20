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
public class MessageList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long senderClientID;
    private long recipientClientID;
    private int size;
    private Message[] messages;
    
    public MessageList(long senderClientID, long recipientClientID)
            
    {
        this.senderClientID = senderClientID;
        this.recipientClientID = recipientClientID;
        this.size = getMessageCount();
        this.messages = new Message[size];
        
        
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT senderClientID, recipientClientID, message, creationTime, longitudinalCreationDate FROM ((SELECT * FROM messages WHERE senderClientID=" + this.senderClientID + 
                    " AND recipientClientID=" + this.recipientClientID + ") UNION ALL (SELECT * FROM messages WHERE senderClientID=" + this.recipientClientID + 
                    " AND recipientClientID=" + this.senderClientID + ")) AS box ORDER BY longitudinalCreationDate ASC");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateMessages();
        
    }
    
    private ResultSet getMessages()
            
    {
        try
            
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }

        return resultSet;

    }
    
    private void populateMessages()
            
    {
        int count;
        String nextCount = null;
        ResultSet messagesSet = getMessages();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (messagesSet.next() == true); count++) 

            {
                
                nextCount = messagesSet.getString("message");
                messages[count] = new Message(nextCount, Long.parseLong(messagesSet.getString("senderClientID")), Long.parseLong(messagesSet.getString("recipientClientID")), messagesSet.getString("creationTime"));
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Message getMessage(int count)
            
    {
        return messages[count];
    }
    
    public long length()
            
    {
        return messages.length;
    }
    
    private int getMessageCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM ((SELECT * FROM messages WHERE senderClientID=" + this.senderClientID + 
                    " AND recipientClientID=" + this.recipientClientID + ") UNION ALL (SELECT * FROM messages WHERE senderClientID=" + this.recipientClientID + 
                    " AND recipientClientID=" + this.senderClientID + ")) AS box");
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        try
            
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                count = Integer.parseInt(resultSet.getString("COUNT(creationTime)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }
    
    
}
