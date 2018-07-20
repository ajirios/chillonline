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
public class TVChannel 

{
    private long tvChannelID;
    private String tvChannelName;
    private String tvChannelPoster;
    private String distributor;
    private String rentalPrice;
    private String locality;
    private String tvChannelTrailer;
    private String tvChannelContent;
    private String description;
    private String promoPoster;
    
    public TVChannel(long tvChannelID, String tvChannelName, String tvChannelPoster, String distributor, String rentalPrice, String locality)
            
    {
        this.tvChannelID = tvChannelID;
        this.tvChannelName = tvChannelName;
        this.tvChannelPoster = tvChannelPoster;
        this.distributor = distributor;
        this.rentalPrice = rentalPrice;
        this.locality = locality;
        this.description = null;
        this.tvChannelContent = null;
        this.tvChannelTrailer = null;
        this.promoPoster = null;
    }

    public long getTvChannelID() 
    
    {
        return tvChannelID;
    }

    public void setTvChannelID(long tvChannelID) 
    
    {
        this.tvChannelID = tvChannelID;
    }

    public String getTvChannelName() 
    
    {
        return tvChannelName;
    }

    public void setTvChannelName(String tvChannelName) 
    
    {
        this.tvChannelName = tvChannelName;
    }

    public String getTvChannelPoster() 
    
    {
        return tvChannelPoster;
    }

    public void setTvChannelPoster(String tvChannelPoster) 
    
    {
        this.tvChannelPoster = tvChannelPoster;
    }

    public String getDistributor() 
    
    {
        return distributor;
    }

    public void setDistributor(String distributor) 
    
    {
        this.distributor = distributor;
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public void setRentalPrice(String rentalPrice) 
    
    {
        this.rentalPrice = rentalPrice;
    }

    public String getLocality() 
    
    {
        return locality;
    }

    public void setLocality(String locality) 
    
    {
        this.locality = locality;
    }

    public String getTvChannelTrailer() 
    
    {
        return tvChannelTrailer;
    }

    public void setTvChannelTrailer(String tvChannelTrailer) 
    
    {
        this.tvChannelTrailer = tvChannelTrailer;
    }

    public String getTvChannelContent() 
    
    {
        return tvChannelContent;
    }

    public void setTvChannelContent(String tvChannelContent) 
    
    {
        this.tvChannelContent = tvChannelContent;
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
