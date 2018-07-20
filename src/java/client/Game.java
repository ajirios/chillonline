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
public class Game 

{
    private long gameID;
    private String gameName;
    private String gamePoster;
    private String distributor;
    private String purchasePrice;
    private String locality;
    private String gameTrailer;
    private String gameContent;
    private String description;
    private String promoPoster;
    
    public Game(long gameID, String gameName, String gamePoster, String distributor, String locality, String purchasePrice)
            
    {
        this.gameID = gameID;
        this.gameName = gameName;
        this.gamePoster = gamePoster;
        this.distributor = distributor;
        this.purchasePrice = purchasePrice;
        this.locality = locality;
        this.description = null;
        this.gameContent = null;
        this.gameTrailer = null;
        this.promoPoster = null;
    }

    public long getGameID() 
    
    {
        return gameID;
    }

    public void setGameID(long gameID) 
    
    {
        this.gameID = gameID;
    }

    public String getGameName() 
    
    {
        return gameName;
    }

    public void setGameName(String gameName) 
    
    {
        this.gameName = gameName;
    }

    public String getGamePoster() 
    
    {
        return gamePoster;
    }

    public void setGamePoster(String gamePoster) 
    
    {
        this.gamePoster = gamePoster;
    }

    public String getDistributor() 
    
    {
        return distributor;
    }

    public void setDistributor(String distributor) 
    
    {
        this.distributor = distributor;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public void setPurchasePrice(String purchasePrice) 
    
    {
        this.purchasePrice = purchasePrice;
    }

    public String getLocality() 
    
    {
        return locality;
    }

    public void setLocality(String locality) 
    
    {
        this.locality = locality;
    }

    public String getGameTrailer() 
    
    {
        return gameTrailer;
    }

    public void setGameTrailer(String gameTrailer) 
    
    {
        this.gameTrailer = gameTrailer;
    }

    public String getGameContent() 
    
    {
        return gameContent;
    }

    public void setGameContent(String gameContent) 
    
    {
        this.gameContent = gameContent;
    }

    public String getDescription() 
    
    {
        return description;
    }

    public void setDescription(String description) 
    
    {
        this.description = description;
    }

    public String getPromoPoster() 
    
    {
        return promoPoster;
    }

    public void setPromoPoster(String promoPoster) 
    
    {
        this.promoPoster = promoPoster;
    }
    
    
    
}
