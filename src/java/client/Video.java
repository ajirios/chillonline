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
public class Video 

{
    private long videoID;
    private String videoName;
    private String videoPoster;
    private String distributor;
    private String purchasePrice;
    private String locality;
    private String videoTrailer;
    private String videoContent;
    private String description;
    private String promoPoster;
    
    public Video(long videoID, String videoName, String videoPoster, String distributor, String purchasePrice, String locality)
            
    {
        this.videoID = videoID;
        this.videoName = videoName;
        this.videoPoster = videoPoster;
        this.distributor = distributor;
        this.purchasePrice = purchasePrice;
        this.locality = locality;
        this.description = null;
        this.videoContent = null;
        this.videoTrailer = null;
        this.promoPoster = null;
    }

    public long getVideoID() 
    
    {
        return videoID;
    }

    public void setVideoID(long videoID) 
    
    {
        this.videoID = videoID;
    }

    public String getVideoName() 
    
    {
        return videoName;
    }

    public void setVideoName(String videoName) 
    
    {
        this.videoName = videoName;
    }

    public String getVideoPoster() 
    
    {
        return videoPoster;
    }

    public void setVideoPoster(String videoPoster) 
    
    {
        this.videoPoster = videoPoster;
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

    public String getVideoTrailer() 
    
    {
        return videoTrailer;
    }

    public void setVideoTrailer(String videoTrailer) 
    
    {
        this.videoTrailer = videoTrailer;
    }

    public String getVideoContent() 
    
    {
        return videoContent;
    }

    public void setVideoContent(String videoContent) 
    
    {
        this.videoContent = videoContent;
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
