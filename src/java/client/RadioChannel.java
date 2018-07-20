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
public class RadioChannel 

{
    private long radioChannelID;
    private String radioChannelName;
    private String radioChannelPoster;
    private String distributor;
    private String rentalPrice;
    private String locality;
    private String radioChannelTrailer;
    private String radioChannelContent;
    private String description;
    private String promoPoster;
    
    public RadioChannel(long radioChannelID, String radioChannelName, String radioChannelPoster, String distributor, String rentalPrice, String locality)
            
    {
        this.radioChannelID = radioChannelID;
        this.radioChannelName = radioChannelName;
        this.radioChannelPoster = radioChannelPoster;
        this.distributor = distributor;
        this.rentalPrice = rentalPrice;
        this.locality = locality;
        this.description = null;
        this.radioChannelContent = null;
        this.radioChannelTrailer = null;
        this.promoPoster = null;
    }

    public long getRadioChannelID() 
    
    {
        return radioChannelID;
    }

    public void setRadioChannelID(long radioChannelID) 
    
    {
        this.radioChannelID = radioChannelID;
    }

    public String getRadioChannelName() 
    
    {
        return radioChannelName;
    }

    public void setRadioChannelName(String radioChannelName) 
    
    {
        this.radioChannelName = radioChannelName;
    }

    public String getRadioChannelPoster() 
    
    {
        return radioChannelPoster;
    }

    public void setRadioChannelPoster(String radioChannelPoster) 
    
    {
        this.radioChannelPoster = radioChannelPoster;
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

    public String getRadioChannelTrailer() 
    
    {
        return radioChannelTrailer;
    }

    public void setRadioChannelTrailer(String radioChannelTrailer) 
    
    {
        this.radioChannelTrailer = radioChannelTrailer;
    }

    public String getRadioChannelContent() 
    
    {
        return radioChannelContent;
    }

    public void setRadioChannelContent(String radioChannelContent) 
    
    {
        this.radioChannelContent = radioChannelContent;
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
