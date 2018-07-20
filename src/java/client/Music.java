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
public class Music 

{
    private long musicID;
    private String musicName;
    private String musicPoster;
    private String distributor;
    private String purchasePrice;
    private String locality;
    private String musicTrailer;
    private String musicContent;
    private String description;
    private String promoPoster;
    
    public Music(long musicID, String musicName, String musicPoster, String distributor, String purchasePrice, String locality)
            
    {
        this.musicID = musicID;
        this.musicName = musicName;
        this.musicPoster = musicPoster;
        this.distributor = distributor;
        this.purchasePrice = purchasePrice;
        this.locality = locality;
        this.description = null;
        this.musicContent = null;
        this.musicTrailer = null;
        this.promoPoster = null;
    }

    public long getMusicID() 
    
    {
        return musicID;
    }

    public void setMusicID(long musicID) 
    
    {
        this.musicID = musicID;
    }

    public String getMusicName() 
    
    {
        return musicName;
    }

    public void setMusicName(String musicName) 
    
    {
        this.musicName = musicName;
    }

    public String getMusicPoster() 
    
    {
        return musicPoster;
    }

    public void setMusicPoster(String musicPoster) 
    
    {
        this.musicPoster = musicPoster;
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

    public String getMusicTrailer() 
    
    {
        return musicTrailer;
    }

    public void setMusicTrailer(String musicTrailer) 
    
    {
        this.musicTrailer = musicTrailer;
    }

    public String getMusicContent() 
    
    {
        return musicContent;
    }

    public void setMusicContent(String musicContent) 
    
    {
        this.musicContent = musicContent;
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
