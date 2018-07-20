/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package messages;

/**
 *
 * @author El Jefe
 */
public class Message 

{
    private long senderClientID;
    private long recipientClientID;
    private String creationTime;
    private long longitudinalCreationDate;
    private String message;
    
    public Message(String message, long senderClientID, long recipientClientID, String creationTime)
            
    {
        this.senderClientID = senderClientID;
        this.recipientClientID = recipientClientID;
        this.creationTime = creationTime;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.message = message;
    }

    public long getSenderClientID() 
    
    {
        return senderClientID;
    }

    public void setSenderClientID(long senderClientID) 
    
    {
        this.senderClientID = senderClientID;
    }

    public long getRecipientClientID() 
    
    {
        return recipientClientID;
    }

    public void setRecipientClientID(long recipientClientID) 
    
    {
        this.recipientClientID = recipientClientID;
    }

    public String getCreationTime() 
    
    {
        return creationTime;
    }

    public void setCreationTime(String creationTime) 
    
    {
        this.creationTime = creationTime;
    }

    public long getLongitudinalCreationDate() 
    
    {
        return longitudinalCreationDate;
    }

    public void setLongitudinalCreationDate(long longitudinalCreationDate) 
    
    {
        this.longitudinalCreationDate = longitudinalCreationDate;
    }

    public String getMessage() 
    
    {
        return message;
    }

    public void setMessage(String message) 
    
    {
        this.message = message;
    }
    
}
