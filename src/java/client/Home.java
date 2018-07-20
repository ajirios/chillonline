/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

/**
 *
 * @author El Jefe
 */
public class Home 

{
    private long clientID;
    private Client client;
    private String wallPaper;
    private PictureList pictureList;
    private PostList postList;
    private Program currentProgram;
    
    public Home(long clientID)
            
    {
        this.clientID = clientID;
        this.client = new Client(clientID);
        this.wallPaper = null;
        this.pictureList = null;
        this.postList = null;
        this.currentProgram = null;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public Client getClient() 
    
    {
        return client;
    }

    public void setClient(Client client) 
    
    {
        this.client = client;
    }

    public String getWallPaper() 
    
    {
        return wallPaper;
    }

    public void setWallPaper(String wallPaper) 
    
    {
        this.wallPaper = wallPaper;
    }

    public PictureList getPictureList() 
    
    {
        return pictureList;
    }

    public void setPictureList(PictureList pictureList) 
    
    {
        this.pictureList = pictureList;
    }

    public PostList getPostList() 
    
    {
        return postList;
    }

    public void setPostList(PostList postList) 
    
    {
        this.postList = postList;
    }

    public Program getCurrentProgram() 
    
    {
        return currentProgram;
    }

    public void setCurrentProgram(Program currentProgram) 
    
    {
        this.currentProgram = currentProgram;
    }

    
    
}
