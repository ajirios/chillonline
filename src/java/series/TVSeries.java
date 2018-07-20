/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package series;


import episode.EpisodeList;



/**
 *
 * @author El Jefe
 */
public class TVSeries 

{
    private long tvSeriesID;
    private String tvSeriesName;
    private String tvSeriesPoster;
    private String distributor;
    private String rentalPrice;
    private String purchasePrice;
    private String locality;
    private String tvSeriesTrailer;
    private String tvSeriesContent;
    private String description;
    private String promoPoster;
    private String distributionDate;
    private String deletionDate;
    private String producer;
    private String productionCountry;
    private long distributorID;
    private String genre;
    private String runTime;
    private EpisodeList episodeList;
    
    public TVSeries(long tvSeriesID, String tvSeriesName, String tvSeriesPoster, String distributor, String locality, String rentalPrice, String purchasePrice)
            
    {
        this.tvSeriesID = tvSeriesID;
        this.tvSeriesName = tvSeriesName;
        this.tvSeriesPoster = tvSeriesPoster;
        this.distributor = distributor;
        this.rentalPrice = rentalPrice;
        this.purchasePrice = purchasePrice;
        this.locality = locality;
        this.description = null;
        this.tvSeriesContent = null;
        this.tvSeriesTrailer = null;
        this.promoPoster = null;
        this.distributionDate = null;
        this.deletionDate = null;
        this.producer = null;
        this.productionCountry = null;
        this.runTime = null;
        this.genre = null;
        this.distributorID = -1;
        this.episodeList = new EpisodeList(this.tvSeriesID);
    }

    public long getTvSeriesID() 
    
    {
        return tvSeriesID;
    }

    public void setTvSeriesID(long tvSeriesID) 
    
    {
        this.tvSeriesID = tvSeriesID;
    }

    public String getTvSeriesName() 
    
    {
        return tvSeriesName;
    }

    public void setTvSeriesName(String tvSeriesName) 
    
    {
        this.tvSeriesName = tvSeriesName;
    }

    public String getTvSeriesPoster() 
    
    {
        return tvSeriesPoster;
    }

    public void setTvSeriesPoster(String tvSeriesPoster) 
    
    {
        this.tvSeriesPoster = tvSeriesPoster;
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

    public String getTvSeriesTrailer() 
    
    {
        return tvSeriesTrailer;
    }

    public void setTvSeriesTrailer(String tvSeriesTrailer) 
    
    {
        this.tvSeriesTrailer = tvSeriesTrailer;
    }

    public String getTvSeriesContent() 
    
    {
        return tvSeriesContent;
    }

    public void setTvSeriesContent(String tvSeriesContent) 
    
    {
        this.tvSeriesContent = tvSeriesContent;
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

    public String getDistributionDate() 
    
    {
        return distributionDate;
    }

    public void setDistributionDate(String distributionDate) 
    
    {
        this.distributionDate = distributionDate;
    }

    public String getDeletionDate() 
    
    {
        return deletionDate;
    }

    public void setDeletionDate(String deletionDate) 
    
    {
        this.deletionDate = deletionDate;
    }

    public String getProducer() 
    
    {
        return producer;
    }

    public void setProducer(String producer) 
    
    {
        this.producer = producer;
    }

    public String getProductionCountry() 
    
    {
        return productionCountry;
    }

    public void setProductionCountry(String productionCountry) 
    
    {
        this.productionCountry = productionCountry;
    }

    public long getDistributorID() 
    
    {
        return distributorID;
    }

    public void setDistributorID(long distributorID) 
    
    {
        this.distributorID = distributorID;
    }

    public String getGenre() 
    
    {
        return genre;
    }

    public void setGenre(String genre) 
    
    {
        this.genre = genre;
    }

    public String getRunTime() 
    
    {
        return runTime;
    }

    public void setRunTime(String runTime) 
    
    {
        this.runTime = runTime;
    }

    public EpisodeList getEpisodeList() 
    
    {
        return episodeList;
    }
    
}
