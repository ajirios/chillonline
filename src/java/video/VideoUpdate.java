/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class VideoUpdate 

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
    
    public VideoUpdate(long videoID)
            
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
    }

    public void setVideoID(long videoID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set videoID=" + videoID + " WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.videoID = videoID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setVideoName(String videoName) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set videoName='" + videoName + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.videoName = videoName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setVideoThumbnail(String videoThumbnail) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set thumbnail='" + videoThumbnail + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate();
                this.videoThumbnail = videoThumbnail;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setDistributor(String distributor) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set distributor='" + distributor + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.distributor = distributor;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setPurchasePrice(String purchasePrice) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set purchasePrice='" + purchasePrice + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.purchasePrice = purchasePrice;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setLocality(String locality) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set locality='" + locality + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.locality = locality;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setVideoTrailer(String videoTrailer) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set teaser='" + videoTrailer + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.videoTrailer = videoTrailer;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setVideoContent(String videoContent) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set videoPoster='" + videoContent + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.videoContent = videoContent;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setDescription(String description) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set description='" + description + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.description = description;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setNumberOfPodcastFeeds(long numberOfPodcastFeeds) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set numberOfPodcastFeeds=" + numberOfPodcastFeeds + " WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.numberOfPodcastFeeds = numberOfPodcastFeeds;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setNumberOfPodcastPeppers(long numberOfPodcastPeppers) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set numberOfPodcastPeppers=" + numberOfPodcastPeppers + " WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.numberOfPodcastPeppers = numberOfPodcastPeppers;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setNumberOfPodcastShares(long numberOfPodcastShares) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set numberOfPodcastShares=" + numberOfPodcastShares + " WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.numberOfPodcastShares = numberOfPodcastShares;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setNumberOfTeaserFeeds(long numberOfTeaserFeeds) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set numberOfTeaserFeeds=" + numberOfTeaserFeeds + " WHERE videoID=" + this.videoID);
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
                
                result = statement.executeUpdate(); 
                this.numberOfTeaserFeeds = numberOfTeaserFeeds;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setNumberOfTeaserPeppers(long numberOfTeaserPeppers) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set numberOfTeaserPeppers=" + numberOfTeaserPeppers + " WHERE videoID=" + this.videoID);
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
                
                result = statement.executeUpdate(); 
                this.numberOfTeaserPeppers = numberOfTeaserPeppers;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setVerification(int verification) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set verification=" + verification + " WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.verification = verification;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setDistributorID(long distributorID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set distributorID=" + distributorID + " WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.distributorID = distributorID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setProducer(String producer) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set producer='" + producer + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.producer = producer;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setProductionCountry(String productionCountry) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set productionCountry='" + productionCountry + "' WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.productionCountry = productionCountry;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setFreeID(long freeID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE videos set freeID=" + freeID + " WHERE videoID=" + this.videoID);
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
            
                result = statement.executeUpdate(); 
                this.freeID = freeID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
