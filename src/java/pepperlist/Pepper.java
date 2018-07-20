/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pepperlist;

/**
 *
 * @author El Jefe
 */
public class Pepper 

{
    private long clientID;
    private String clientName;
    private long postID;
    
    public Pepper(long clientID, long postID)
            
    {
        this.clientID = clientID;
        this.postID = postID;
        this.clientName = "";
        
        constructPepper();
        
    }
    
    public void constructPepper()
            
    {
        
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public String getClientName() 
    
    {
        return clientName;
    }

    public void setClientName(String clientName) 
    
    {
        this.clientName = clientName;
    }

    public long getPostID() 
    
    {
        return postID;
    }

    public void setPostID(long postID) 
    
    {
        this.postID = postID;
    }
    
}
