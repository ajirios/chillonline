/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie.board.posts;

/**
 *
 * @author El Jefe
 */
public class MovieBoardPost 

{
    private long boardID;
    private long clientID;
    private long movieID;
    private String creationTime;
    private String deletionTime;
    private String message;
    private String clientProfilePicture;
    private String clientName;
    private String clientGender;
    private String thumbnail;
    private String content;
    private String moviePoster;
    private String movieName;
    private long longitudinalCreationDate;
    private long numberOfPostPeppers;
    private long numberOfPostComments;
    
    public MovieBoardPost(long movieID, long boardID, long clientID, String creationTime, String message)
            
    {
        this.movieID = movieID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.message = message;
        this.clientProfilePicture = null;
        this.clientName = null;
        this.clientGender = null;
        this.thumbnail = null;
        this.content = null;
        this.moviePoster = null;
        this.movieName = null;
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

    public long getMovieID() 
    
    {
        return movieID;
    }

    public void setMovieID(long movieID) 
    
    {
        this.movieID = movieID;
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

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) 
    
    {
        this.thumbnail = thumbnail;
    }

    public String getContent() 
    
    {
        return content;
    }

    public void setContent(String content) 
    
    {
        this.content = content;
    }

    public String getMoviePoster() 
    
    {
        return moviePoster;
    }

    public void setMoviePoster(String moviePoster) 
    
    {
        this.moviePoster = moviePoster;
    }
    
    public String getMovieName() 
    
    {
        return movieName;
    }

    public void setMovieName(String movieName) 
    
    {
        this.movieName = movieName;
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
