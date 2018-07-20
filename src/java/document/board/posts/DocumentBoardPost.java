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
public class DocumentBoardPost 

{
    private long boardID;
    private long clientID;
    private String documentID;
    private String creationTime;
    private String deletionTime;
    private String message;
    private String clientProfilePicture;
    private String clientName;
    private String clientGender;
    private String documentLocation;
    private long longitudinalCreationDate;
    private long numberOfPostPeppers;
    private long numberOfPostComments;
    
    public DocumentBoardPost(String documentID, long boardID, long clientID, String creationTime, String message)
            
    {
        this.documentID = documentID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.message = message;
        this.clientProfilePicture = null;
        this.clientName = null;
        this.clientGender = null;
        this.documentLocation = null;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.numberOfPostPeppers = 0;
        this.numberOfPostComments = 0;
    }
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public String getDocumentID() 
    
    {
        return documentID;
    }

    public void setDocumentID(String documentID) 
    
    {
        this.documentID = documentID;
    }

    public String getDocumentLocation() 
    
    {
        return documentLocation;
    }

    public void setDocumentLocation(String documentLocation) 
    
    {
        this.documentLocation = documentLocation;
    }

    public long getLongitudinalCreationDate() 
    
    {
        return longitudinalCreationDate;
    }

    public void setLongitudinalCreationDate(long longitudinalCreationDate) 
    
    {
        this.longitudinalCreationDate = longitudinalCreationDate;
    }

    public String getCreationTime() 
    
    {
        return creationTime;
    }

    public void setCreationTime(String creationTime) 
    
    {
        this.creationTime = creationTime;
    }

    public String getDeletionTime() 
    
    {
        return deletionTime;
    }

    public void setDeletionTime(String deletionTime) 
    
    {
        this.deletionTime = deletionTime;
    }

    public String getMessage() 
    
    {
        return message;
    }

    public void setMessage(String message) 
    
    {
        this.message = message;
    }
    
    public String getClientProfilePicture() 
    
    {
        return clientProfilePicture;
    }

    public void setClientProfilePicture(String clientProfilePicture) 
    
    {
        this.clientProfilePicture = clientProfilePicture;
    }

    public String getClientName() 
    
    {
        return clientName;
    }

    public void setClientName(String clientName) 
    
    {
        this.clientName = clientName;
    }
    
    public String getClientGender() 
    
    {
        return clientGender;
    }

    public void setClientGender(String clientGender) 
    
    {
        this.clientGender = clientGender;
    }

    public long getNumberOfPostPeppers() 
    
    {
        return numberOfPostPeppers;
    }

    public void setNumberOfPostPeppers(long numberOfPostPeppers) 
    
    {
        this.numberOfPostPeppers = numberOfPostPeppers;
    }

    public long getNumberOfPostComments() 
    
    {
        return numberOfPostComments;
    }

    public void setNumberOfPostComments(long numberOfPostComments) 
    
    {
        this.numberOfPostComments = numberOfPostComments;
    }
    
}
