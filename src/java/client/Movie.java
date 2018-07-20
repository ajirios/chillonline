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
    
    
    
}
