/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie;



/**
 *
 * @author El Jefe
 */
public class Movie 

{
    private long movieID;
    private String movieName;
    private String moviePoster;
    private String distributor;
    private String rentalPrice;
    private String purchasePrice;
    private String locality;
    private String movieTrailer;
    private String movieContent;
    private String description;
    private String promoPoster;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    private long numberOfTeaserFeeds;
    private long numberOfTeaserPeppers;
    private String genre;
    private String thumbnail;
    private String producer;
    private String productionCountry;
    private long distributorID;
    private long freeID;
    private int verification;
    private long actionID;
    private long adventureID;
    private long comedyID;
    private long documentaryID;
    private long horrorID;
    private long kidsID;
    private long romanceID;
    
    public Movie(long movieID, String movieName, String moviePoster, String distributor, String rentalPrice, String locality)
            
    {
        this.movieID = movieID;
        this.movieName = movieName;
        this.moviePoster = moviePoster;
        this.distributor = distributor;
        this.rentalPrice = rentalPrice;
        this.purchasePrice = null;
        this.locality = locality;
        this.description = null;
        this.movieContent = null;
        this.movieTrailer = null;
        this.promoPoster = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        this.numberOfTeaserFeeds = 0;
        this.numberOfTeaserPeppers = 0;
        this.genre = null;
        this.thumbnail = null;
        this.producer = null;
        this.productionCountry = null;
        this.distributorID = 0;
        this.freeID = 0;
        this.verification = 0;
        this.actionID = 0;
        this.adventureID = 0;
        this.comedyID = 0;
        this.documentaryID = 0;
        this.horrorID = 0;
        this.kidsID = 0;
        this.romanceID = 0;
    }

    public long getMovieID() 
    
    {
        return movieID;
    }

    public void setMovieID(long movieID) 
    
    {
        this.movieID = movieID;
    }

    public String getMovieName() 
    
    {
        return movieName;
    }

    public void setMovieName(String movieName) 
    
    {
        this.movieName = movieName;
    }

    public String getMoviePoster() 
    
    {
        return moviePoster;
    }

    public void setMoviePoster(String moviePoster) 
    
    {
        this.moviePoster = moviePoster;
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

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public void setPurchasePrice(String purchasePrice) 
    
    {
        this.purchasePrice = purchasePrice;
    }

    public String getMovieTrailer() 
    
    {
        return movieTrailer;
    }

    public void setMovieTrailer(String movieTrailer) 
    
    {
        this.movieTrailer = movieTrailer;
    }

    public String getMovieContent() 
    
    {
        return movieContent;
    }

    public void setMovieContent(String movieContent) 
    
    {
        this.movieContent = movieContent;
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
    
    public long getNumberOfPodcastFeeds() 
    
    {
        return numberOfPodcastFeeds;
    }

    public void setNumberOfPodcastFeeds(long numberOfPodcastFeeds) 
    
    {
        this.numberOfPodcastFeeds = numberOfPodcastFeeds;
    }

    public long getNumberOfPodcastPeppers() 
    
    {
        return numberOfPodcastPeppers;
    }

    public void setNumberOfPodcastPeppers(long numberOfPodcastPeppers) 
    
    {
        this.numberOfPodcastPeppers = numberOfPodcastPeppers;
    }

    public long getNumberOfPodcastShares() 
    
    {
        return numberOfPodcastShares;
    }

    public void setNumberOfPodcastShares(long numberOfPodcastShares) 
    
    {
        this.numberOfPodcastShares = numberOfPodcastShares;
    }
    
    public long getNumberOfTeaserFeeds() 
    
    {
        return numberOfTeaserFeeds;
    }

    public void setNumberOfTeaserFeeds(long numberOfTeaserFeeds) 
    
    {
        this.numberOfTeaserFeeds = numberOfTeaserFeeds;
    }

    public long getNumberOfTeaserPeppers() 
    
    {
        return numberOfTeaserPeppers;
    }

    public void setNumberOfTeaserPeppers(long numberOfTeaserPeppers) 
    
    {
        this.numberOfTeaserPeppers = numberOfTeaserPeppers;
    }

    public String getGenre() 
    
    {
        return genre;
    }

    public void setGenre(String genre) 
    
    {
        this.genre = genre;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) 
    
    {
        this.thumbnail = thumbnail;
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

    public long getFreeID() 
    
    {
        return freeID;
    }

    public void setFreeID(long freeID) 
    
    {
        this.freeID = freeID;
    }

    public int getVerification() 
    
    {
        return verification;
    }

    public void setVerification(int verification) 
    
    {
        this.verification = verification;
    }

    public long getActionID() 
    
    {
        return actionID;
    }

    public void setActionID(long actionID) 
    
    {
        this.actionID = actionID;
    }

    public long getAdventureID() 
    
    {
        return adventureID;
    }

    public void setAdventureID(long adventureID) 
    
    {
        this.adventureID = adventureID;
    }

    public long getComedyID() 
    
    {
        return comedyID;
    }

    public void setComedyID(long comedyID) 
    
    {
        this.comedyID = comedyID;
    }

    public long getDocumentaryID() 
    
    {
        return documentaryID;
    }

    public void setDocumentaryID(long documentaryID) 
    
    {
        this.documentaryID = documentaryID;
    }

    public long getHorrorID() 
    
    {
        return horrorID;
    }

    public void setHorrorID(long horrorID) 
    
    {
        this.horrorID = horrorID;
    }

    public long getKidsID() 
    
    {
        return kidsID;
    }

    public void setKidsID(long kidsID) 
    
    {
        this.kidsID = kidsID;
    }

    public long getRomanceID() 
    
    {
        return romanceID;
    }

    public void setRomanceID(long romanceID) 
    
    {
        this.romanceID = romanceID;
    }
    
}
