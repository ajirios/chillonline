/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;



/**
 *
 * @author El Jefe
 */
public class Content 

{
    protected long programID;
    protected String programType;
    protected String contentPoster;
    protected String contentLocation;
    protected String distributor;
    protected String producer;
    protected String country;
    protected long numberOfViews;
    protected PostList postList;
    
    public Content(long programID, String programType)
            
    {
        this.programID = 0;
        this.programType = null;
        this.contentPoster = null;
        this.contentLocation = null;
        this.distributor = null;
        this.producer = null;
        this.country = null;
        this.numberOfViews = 0;
        this.postList = null;
    }

    public long getProgramID() 
    
    {
        return programID;
    }

    public void setProgramID(long programID) 
    
    {
        this.programID = programID;
    }

    public String getProgramType() 
    
    {
        return programType;
    }

    public void setProgramType(String programType) 
    
    {
        this.programType = programType;
    }

    public String getContentPoster() 
    
    {
        return contentPoster;
    }

    public void setContentPoster(String contentPoster) 
    
    {
        this.contentPoster = contentPoster;
    }

    public String getContentLocation() 
    
    {
        return contentLocation;
    }

    public void setContentLocation(String contentLocation) 
    
    {
        this.contentLocation = contentLocation;
    }

    public String getDistributor() 
    
    {
        return distributor;
    }

    public void setDistributor(String distributor) 
    
    {
        this.distributor = distributor;
    }

    public String getProducer() 
    
    {
        return producer;
    }

    public void setProducer(String producer) 
    
    {
        this.producer = producer;
    }

    public String getCountry() 
    
    {
        return country;
    }

    public void setCountry(String country) 
    
    {
        this.country = country;
    }

    public long getNumberOfViews() 
    
    {
        return numberOfViews;
    }

    public void setNumberOfViews(long numberOfViews) 
    
    {
        this.numberOfViews = numberOfViews;
    }

    public PostList getPostList() 
    
    {
        return postList;
    }

    public void setPostList(PostList postList) 
    
    {
        this.postList = postList;
    }
    
}
