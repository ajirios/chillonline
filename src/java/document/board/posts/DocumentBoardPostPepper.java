/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package document.board.posts;

/**
 *
 * @author El Jefe
 */
public class DocumentBoardPostPepper 

{
    private String documentID;
    private long boardID;
    private long postClientID;
    private long pepperClientID;
    private String postCreationTime;
    private String clientName;
    private long postLongitudinalCreationDate;
    
    public DocumentBoardPostPepper(String documentID, long boardID, long postClientID, long pepperClientID, String postCreationTime)
            
    {
        this.documentID = documentID;
        this.boardID = boardID;
        this.postClientID = postClientID;
        this.pepperClientID = pepperClientID;
        this.postCreationTime = postCreationTime;
        this.clientName = null;
        this.postLongitudinalCreationDate = Long.parseLong(postCreationTime);
    }
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public String getDocumentID() 
    
    {
        return documentID;
    }

    public void setDocumentID(String documentID) 
    
    {
        this.documentID = documentID;
    }

    public long getPostClientID() 
    
    {
        return postClientID;
    }

    public void setPostClientID(long postClientID) 
    
    {
        this.postClientID = postClientID;
    }

    public long getPepperClientID() 
    
    {
        return pepperClientID;
    }

    public void setPepperClientID(long pepperClientID) 
    
    {
        this.pepperClientID = pepperClientID;
    }

    public String getPostCreationTime() 
    
    {
        return postCreationTime;
    }

    public void setPostCreationTime(String postCreationTime) 
    
    {
        this.postCreationTime = postCreationTime;
    }

    public String getClientName() 
    
    {
        return clientName;
    }

    public void setClientName(String clientName) 
    
    {
        this.clientName = clientName;
    }

    public long getPostLongitudinalCreationDate() 
    
    {
        return postLongitudinalCreationDate;
    }

    public void setPostLongitudinalCreationDate(long postLongitudinalCreationDate) 
    
    {
        this.postLongitudinalCreationDate = postLongitudinalCreationDate;
    }
    
}
