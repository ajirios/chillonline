/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class VideoRetrieve 

{
    private long videoID;
    private String videoName;
    private String videoThumbnail;
    private String distributor;
    private String purchasePrice;
    private String locality;
    private String videoTrailer;
    private String videoContent;
    private String description;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    private long numberOfTeaserFeeds;
    private long numberOfTeaserPeppers;
    private int verification;
    private long distributorID;
    private String producer;
    private String productionCountry;
    private long freeID;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    public VideoRetrieve(long videoID)
            
    {
        this.videoID = videoID;
        this.videoName = null;
        this.videoThumbnail = null;
        this.distributor = null;
        this.purchasePrice = null;
        this.locality = null;
        this.description = null;
        this.videoContent = null;
        this.videoTrailer = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        this.numberOfTeaserFeeds = 0;
        this.numberOfTeaserPeppers = 0;
        this.verification = 0;
        this.distributorID = -1;
        this.producer = null;
        this.productionCountry = null;
        this.freeID = 0;
        
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
            statement = connection.prepareStatement("SELECT videoName, thumbnail, distributor, purchasePrice, locality, description, videoPoster, verification, "
                    + "freeID, distributorID, teaser, producer, productionCountry, numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfPodcastFeeds, "
                    + "numberOfPodcastPeppers, numberOfPodcastShares FROM videos WHERE videoID=" + this.videoID);
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
                    
                    this.videoName = resultSet.getString("videoName"); 
                    this.videoThumbnail = resultSet.getString("thumbnail"); 
                    this.distributor = resultSet.getString("distributor");
                    this.purchasePrice = resultSet.getString("purchasePrice");
                    this.locality = resultSet.getString("locality");
                    this.description = resultSet.getString("description");
                    this.videoContent = resultSet.getString("videoPoster");
                    this.videoTrailer = resultSet.getString("teaser");
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
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public String getVideoName() 
    
    {
        return videoName;
    }

    public String getVideoThumbnail() 
    
    {
        return videoThumbnail;
    }

    public String getDistributor() 
    
    {
        return distributor;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public String getLocality() 
    
    {
        return locality;
    }

    public String getVideoTrailer() 
    
    {
        return videoTrailer;
    }

    public String getVideoContent() 
    
    {
        return videoContent;
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

    public int getVerification() 
    
    {
        return verification;
    }

    public long getDistributorID() 
    
    {
        return distributorID;
    }

    public String getProducer() 
    
    {
        return producer;
    }

    public String getProductionCountry() 
    
    {
        return productionCountry;
    }

    public long getFreeID() 
    
    {
        return freeID;
    }
}
