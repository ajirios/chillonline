/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class MovieRetrieve 

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
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    public MovieRetrieve(long movieID)
            
    {
        this.movieID = movieID;
        this.movieName = null;
        this.moviePoster = null;
        this.distributor = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        this.locality = null;
        this.description = null;
        this.movieContent = null;
        this.movieTrailer = null;
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
        
        constructRetrieve();
        
    }
    
    private void constructRetrieve()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("SELECT movieName, moviePoster, thumbnail, distributor, rentalPrice, purchasePrice, locality, description, verification, "
                    + "freeID, distributorID, genre, teaser, podcast, producer, productionCountry, numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfPodcastFeeds, "
                    + "numberOfPodcastPeppers, numberOfPodcastShares, actionID, adventureID, comedyID, documentaryID, horrorID, "
                    + "kidsID, romanceID FROM movies WHERE movieID=" + this.movieID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    
                    this.movieName = resultSet.getString("movieName"); 
                    this.thumbnail = resultSet.getString("thumbnail"); 
                    this.distributor = resultSet.getString("distributor");
                    this.rentalPrice = resultSet.getString("rentalPrice");
                    this.purchasePrice = resultSet.getString("purchasePrice");
                    this.locality = resultSet.getString("locality");
                    this.description = resultSet.getString("description");
                    this.moviePoster = resultSet.getString("moviePoster");
                    this.movieContent = resultSet.getString("podcast");
                    this.movieTrailer = resultSet.getString("teaser");
                    this.numberOfPodcastFeeds = Long.parseLong(resultSet.getString("numberOfPodcastFeeds"));
                    this.numberOfPodcastPeppers = Long.parseLong(resultSet.getString("numberOfPodcastPeppers"));
                    this.numberOfPodcastShares = Long.parseLong(resultSet.getString("numberOfPodcastShares"));
                    this.numberOfTeaserFeeds = Long.parseLong(resultSet.getString("numberOfTeaserFeeds"));
                    this.numberOfTeaserPeppers = Long.parseLong(resultSet.getString("numberOfTeaserPeppers"));
                    this.verification = Integer.parseInt(resultSet.getString("verification"));
                    this.distributorID = Long.parseLong(resultSet.getString("distributorID"));
                    this.producer = resultSet.getString("producer");
                    this.productionCountry = resultSet.getString("productionCountry");
                    this.freeID = Long.parseLong(resultSet.getString("freeID"));
                    this.genre = resultSet.getString("genre");
                    this.actionID = Long.parseLong(resultSet.getString("actionID"));
                    this.adventureID = Long.parseLong(resultSet.getString("adventureID"));
                    this.comedyID = Long.parseLong(resultSet.getString("comedyID"));
                    this.documentaryID = Long.parseLong(resultSet.getString("documentaryID"));
                    this.horrorID = Long.parseLong(resultSet.getString("horrorID"));
                    this.kidsID = Long.parseLong(resultSet.getString("kidsID"));
                    this.romanceID = Long.parseLong(resultSet.getString("romanceID"));
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public String getMovieName() 
    
    {
        return movieName;
    }

    public String getMoviePoster() 
    
    {
        return moviePoster;
    }

    public String getDistributor() 
    
    {
        return distributor;
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public String getLocality() 
    
    {
        return locality;
    }

    public String getMovieTrailer() 
    
    {
        return movieTrailer;
    }

    public String getMovieContent() 
    
    {
        return movieContent;
    }

    public String getDescription() 
    
    {
        return description;
    }

    public long getNumberOfPodcastFeeds() 
    
    {
        return numberOfPodcastFeeds;
    }

    public long getNumberOfPodcastPeppers() 
    
    {
        return numberOfPodcastPeppers;
    }

    public long getNumberOfPodcastShares() 
    
    {
        return numberOfPodcastShares;
    }

    public long getNumberOfTeaserFeeds() 
    
    {
        return numberOfTeaserFeeds;
    }

    public long getNumberOfTeaserPeppers() 
    
    {
        return numberOfTeaserPeppers;
    }

    public String getGenre() 
    
    {
        return genre;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public String getProducer() 
    
    {
        return producer;
    }

    public String getProductionCountry() 
    
    {
        return productionCountry;
    }

    public long getDistributorID() 
    
    {
        return distributorID;
    }

    public long getFreeID() 
    
    {
        return freeID;
    }

    public int getVerification() 
    
    {
        return verification;
    }

    public long getActionID() 
    
    {
        return actionID;
    }

    public long getAdventureID() 
    
    {
        return adventureID;
    }

    public long getComedyID() 
    
    {
        return comedyID;
    }

    public long getDocumentaryID() 
    
    {
        return documentaryID;
    }

    public long getHorrorID() 
    
    {
        return horrorID;
    }

    public long getKidsID() 
    
    {
        return kidsID;
    }

    public long getRomanceID() 
    
    {
        return romanceID;
    }
    
}
