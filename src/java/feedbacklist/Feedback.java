/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedbacklist;


import pepperlist.*;


/**
 *
 * @author El Jefe
 */
public class Feedback 

{
    private long clientID;
    private long postID;
    private long feedbackID;
    private String feedbackReport;
    private PepperList listOfPeppers;
    
    public Feedback(long clientID, long postID, String feedbackReport)
            
    {
        this.clientID = clientID;
        this.postID = postID;
        this.feedbackID = -1;
        this.feedbackReport = feedbackReport;
        this.listOfPeppers = new PepperList();
        
        constructFeedback();
        
    }
    
    private void constructFeedback()
            
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

    public long getPostID() 
    
    {
        return postID;
    }

    public void setPostID(long postID) 
    
    {
        this.postID = postID;
    }

    public long getFeedbackID() 
    
    {
        return feedbackID;
    }

    public void setFeedbackID(long feedbackID) 
    
    {
        this.feedbackID = feedbackID;
    }

    public String getFeedbackReport() 
    
    {
        return feedbackReport;
    }

    public void setFeedbackReport(String feedbackReport) 
    
    {
        this.feedbackReport = feedbackReport;
    }

    public PepperList getListOfPeppers() 
    
    {
        return listOfPeppers;
    }

    public void setListOfPeppers(PepperList listOfPeppers) 
    
    {
        this.listOfPeppers = listOfPeppers;
    }
    
}
