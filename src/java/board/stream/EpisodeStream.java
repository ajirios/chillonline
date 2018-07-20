/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.stream;

import episode.EpisodeRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class EpisodeStream 

{
    private long seriesID;
    private long episodeID;
    private String episodeName;
    private String podcast;
    private String thumbnail;
    private int order;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    private String seriesName;
    private String seriesPoster;
    private long distributorID;
    private String distributorName;
    private String distributorPicture;
    private String producer;
    private String productionCountry;
    private String locality;
    private String description;
    private String rentalPrice;
    private String purchasePrice;
    private static final String department = "series";
    private int size;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    public EpisodeStream()
            
    {
        this.seriesID = -1;
        this.episodeID = -1;
        this.episodeName = null;
        this.podcast = null;
        this.thumbnail = null;
        this.order = 0;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        this.seriesName = null;
        this.seriesPoster = null;
        this.distributorID = -1;
        this.distributorName = null;
        this.distributorPicture = null;
        this.producer = null;
        this.productionCountry = null;
        this.locality = null;
        this.thumbnail = null;
        this.description = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        
        this.size = getEpisodeCount();
        
    }
    
    public EpisodeStream(long episodeID)
            
    {
        EpisodeRetrieve episodeRetrieve = new EpisodeRetrieve(episodeID);
        this.seriesID = episodeRetrieve.getSeriesID();
        this.episodeID = episodeID;
        this.episodeName = episodeRetrieve.getEpisodeName();
        this.podcast = episodeRetrieve.getPodcast();
        this.thumbnail = episodeRetrieve.getThumbnail();
        this.order = episodeRetrieve.getOrder();
        this.numberOfPodcastFeeds = episodeRetrieve.getNumberOfPodcastFeeds();
        this.numberOfPodcastPeppers = episodeRetrieve.getNumberOfPodcastPeppers();
        this.numberOfPodcastShares = episodeRetrieve.getNumberOfPodcastShares();
        
        this.seriesName = null;
        this.seriesPoster = null;
        this.distributorID = -1;
        this.distributorName = null;
        this.distributorPicture = null;
        this.producer = null;
        this.productionCountry = null;
        this.locality = null;
        this.thumbnail = null;
        this.description = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        
        this.size = getEpisodeCount();
        
        constructProgram();
        constructDistributor();
        
    }
    
    private void constructProgram()
            
    {
        Connection programConnection = null;
        PreparedStatement programStatement = null;
        ResultSet programSet = null;
        int count;

        try
        {
            programConnection = DriverManager.getConnection(URL, userName, password);


            if (department.equals("series"))
                
            {
                programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributorID, rentalPrice, purchasePrice, description, locality"
                        + ", producer, productionCountry FROM series WHERE seriesID=" + seriesID );
            }
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            programSet = programStatement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            for (count = 0; (count < 1) && (programSet.next() == true); count++) 

            {

                if (department.equals("series"))
                    
                {
                    seriesName = programSet.getString("seriesName"); 
                    seriesPoster = programSet.getString("seriesPoster");
                    distributorID = Long.parseLong(programSet.getString("distributorID"));
                    description = programSet.getString("description");
                    locality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    purchasePrice = programSet.getString("purchasePrice");
                    producer = programSet.getString("producer");
                    productionCountry = programSet.getString("productionCountry");
                }

            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
    }
    
    private void constructDistributor()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT distributorLogo, distributorName FROM distributors WHERE distributorID=" + distributorID );
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            for (count = 0; (count < 1) && (resultSet.next() == true); count++) 

            {
                
                distributorName = resultSet.getString("distributorName"); 
                distributorPicture = resultSet.getString("distributorLogo");
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private int getEpisodeCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(episodeID) FROM episodes");
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                count = Integer.parseInt(resultSet.getString("COUNT(episodeID)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public long getRandomProgramID(long exception)
            
    {
        long randomID;
        
        randomID = 1;
        
        if (this.size > 2)
            
        {
            randomID = (long) Math.ceil(Math.random() * this.size); 

            while (randomID == exception)

            {
                randomID = (long) Math.ceil(Math.random() * this.size); 
            }
            
        }
        
        return randomID;
        
    }
    
    public long search(String seriesName)
            
    {
        long seriesID;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        seriesID = 1;
        seriesName = seriesName.trim();
        seriesName = modifyChars(seriesName);
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT seriesID FROM series WHERE seriesName='" + seriesName + "'");
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                seriesID = Long.parseLong(resultSet.getString("seriesID")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return seriesID;
        
    }
    
    private String modifyChars(String seriesName)
            
    {
        String modification;
        char[] prohibitedChars = new char[19];
        int count;
        int index;
        boolean prohibitedExists = false;
        
        modification = "";
        prohibitedChars[0] = '@';
        prohibitedChars[1] = '#';
        prohibitedChars[2] = '%';
        prohibitedChars[3] = '^';
        prohibitedChars[4] = '&';
        prohibitedChars[5] = '*';
        prohibitedChars[6] = '(';
        prohibitedChars[7] = ')';
        prohibitedChars[8] = '+';
        prohibitedChars[9] = '=';
        prohibitedChars[10] = ';';
        prohibitedChars[11] = ':';
        prohibitedChars[12] = '`';
        prohibitedChars[13] = '~';
        prohibitedChars[14] = '\\';
        prohibitedChars[15] = '/';
        prohibitedChars[16] = '>';
        prohibitedChars[17] = '<';
        prohibitedChars[18] = '\"';
        
        modification = "";
        
        for (count = 0; count < seriesName.length(); count++)
            
        {
            
            if (seriesName.charAt(count) == '\'')
            
            {
                modification = modification + '\\'; 
            }
            
            for (index = 0; index < prohibitedChars.length; index++)
                
            {
                
                if (seriesName.charAt(count) == prohibitedChars[index])

                {
                    prohibitedExists = true;
                }
                
            }
            
            if (prohibitedExists == false)
                
            {
                modification = modification + seriesName.charAt(count);
            }
            
        }
        
        return modification;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }
    
    public long getSeriesID() 
    
    {
        return seriesID;
    }

    public long getEpisodeID() 
    
    {
        return episodeID;
    }

    public String getEpisodeName() 
    
    {
        return episodeName;
    }

    public String getPodcast() 
    
    {
        return podcast;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public int getOrder() 
    
    {
        return order;
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

    public String getSeriesName() 
    
    {
        return seriesName;
    }

    public String getSeriesPoster() 
    
    {
        return seriesPoster;
    }

    public long getDistributorID() 
    
    {
        return distributorID;
    }

    public String getDistributorName() 
    
    {
        return distributorName;
    }

    public String getDistributorPicture() 
    
    {
        return distributorPicture;
    }

    public String getLocality() 
    
    {
        return locality;
    }

    public String getDescription() 
    
    {
        return description;
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }
    
    public String getProducer() 
    
    {
        return producer;
    }

    public String getProductionCountry() 
    
    {
        return productionCountry;
    }
    
}
