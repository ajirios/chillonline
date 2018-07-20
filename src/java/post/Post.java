/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package post;


import sharelist.ShareList;
import pepperlist.*;
import feedbacklist.*;


/**
 *
 * @author El Jefe
 */
public class Post 

{
    protected long postID;
    protected long boardID;
    protected long programID;
    protected String programName;
    protected String programPoster;
    protected String programPodcast;
    protected String postReport;
    protected PepperList listOfPeppers;
    protected FeedbackList listOfFeedback;
    protected ShareList listOfShares;
    
    //size properties
    protected int postHeight;
    protected int postReportHeight;
    
    public Post(long boardID, String postReport, long programID)
            
    {
        this.postID = -1;
        this.boardID = boardID;
        this.programID = programID;
        this.postReport = postReport;
        this.programName = null;
        this.programPoster = null;
        this.programPodcast = null;
        this.listOfPeppers = null;
        this.listOfFeedback = null;
        this.listOfShares = null;
        this.postHeight = 0;
        this.postReportHeight = 0;
    }
    
    public void constructPost()
            
    {
        
    }

    public long getPostID() 
    
    {
        return postID;
    }

    public void setPostID(long postID) 
    
    {
        this.postID = postID;
    }

    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public long getProgramID() 
    
    {
        return programID;
    }

    public void setProgramID(long programID) 
    
    {
        this.programID = programID;
    }

    public String getProgramName() 
    
    {
        return programName;
    }

    public void setProgramName(String programName) 
    
    {
        this.programName = programName;
    }

    public String getProgramPoster() 
    
    {
        return programPoster;
    }

    public void setProgramPoster(String programPoster) 
    
    {
        this.programPoster = programPoster;
    }

    public String getProgramPodcast() 
    
    {
        return programPodcast;
    }

    public void setProgramPodcast(String programPodcast) 
    
    {
        this.programPodcast = programPodcast;
    }

    public String getPostReport() 
    
    {
        return postReport;
    }

    public void setPostReport(String postReport) 
    
    {
        this.postReport = postReport;
    }

    public PepperList getListOfPeppers() 
    
    {
        return listOfPeppers;
    }

    public void setListOfPeppers(PepperList listOfPeppers) 
    
    {
        this.listOfPeppers = listOfPeppers;
    }

    public FeedbackList getListOfFeedback() 
    
    {
        return listOfFeedback;
    }

    public void setListOfFeedback(FeedbackList listOfFeedback) 
    
    {
        this.listOfFeedback = listOfFeedback;
    }

    public ShareList getListOfShares() 
    
    {
        return listOfShares;
    }

    public void setListOfShares(ShareList listOfShares) 
    
    {
        this.listOfShares = listOfShares;
    }

    public int getPostHeight() 
    
    {
        return postHeight;
    }

    public void setPostHeight(int postHeight) 
    
    {
        this.postHeight = postHeight;
    }

    public int getPostReportHeight() 
    
    {
        return postReportHeight;
    }

    public void setPostReportHeight(int postReportHeight) 
    
    {
        this.postReportHeight = postReportHeight;
    }
    
}
