/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.stream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import music.Music;
import song.SongRetrieve;

/**
 *
 * @author El Jefe
 */
public class SongStream 

{
    private long musicID;
    private long songID;
    private String songName;
    private int songOrder;
    private String podcast;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    
    private String musicName;
    private String musicPoster;
    private String purchasePrice;
    private String locality;
    private String description;
    private String producer;
    private String productionCountry;
    private long distributorID;
    private String distributorName;
    private String distributorPicture;
    private static final String department = "music";
    private int size;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    public SongStream()
            
    {
        this.songID = -1;
        this.musicID = -1;
        this.songName = null;
        this.songOrder = 0;
        this.podcast = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        this.musicName = null;
        this.musicPoster = null;
        this.purchasePrice = null;
        this.locality = null;
        this.description = null;
        this.distributorID = -1;
        this.distributorName = null;
        this.distributorPicture = null;
        this.producer = null;
        this.productionCountry = null;
        
        this.size = getSongCount();
        
    }
    
    public SongStream(long songID)
            
    {
        SongRetrieve retrieve = new SongRetrieve(songID);
        this.songID = songID;
        this.musicID = retrieve.getMusicID();
        this.songName = retrieve.getSongName();
        this.songOrder = retrieve.getSongOrder();
        this.podcast = retrieve.getPodcast();
        this.numberOfPodcastFeeds = retrieve.getNumberOfPodcastFeeds();
        this.numberOfPodcastPeppers = retrieve.getNumberOfPodcastPeppers();
        this.numberOfPodcastShares = retrieve.getNumberOfPodcastShares();
        
        this.musicName = null;
        this.musicPoster = null;
        this.purchasePrice = null;
        this.locality = null;
        this.description = null;
        this.distributorID = -1;
        this.distributorName = null;
        this.distributorPicture = null;
        this.producer = null;
        this.productionCountry = null;
        
        this.size = getSongCount();
        
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
            
            
            if (department.equals("music"))
            {
                programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributorID, purchasePrice, description, locality, producer"
                        + ", productionCountry FROM music WHERE musicID=" + musicID );
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

                if (department.equals("music"))
                {
                    musicName = programSet.getString("musicName"); 
                    musicPoster = programSet.getString("musicPoster");
                    distributorID = Long.parseLong(programSet.getString("distributorID"));
                    description = programSet.getString("description");
                    locality = programSet.getString("locality");
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
    
    private int getSongCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(songID) FROM songs");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(songID)")); 
                
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
    
    public long search(String musicName)
            
    {
        long musicID;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        musicID = 1;
        musicName = musicName.trim();
        musicName = modifyChars(musicName);
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT musicID FROM music WHERE musicName='" + musicName + "'");
            
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
                
                musicID = Long.parseLong(resultSet.getString("musicID")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return musicID;
        
    }
    
    private String modifyChars(String musicName)
            
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
        
        for (count = 0; count < musicName.length(); count++)
            
        {
            
            if (musicName.charAt(count) == '\'')
            
            {
                modification = modification + '\\'; 
            }
            
            for (index = 0; index < prohibitedChars.length; index++)
                
            {
                
                if (musicName.charAt(count) == prohibitedChars[index])

                {
                    prohibitedExists = true;
                }
                
            }
            
            if (prohibitedExists == false)
                
            {
                modification = modification + musicName.charAt(count);
            }
            
        }
        
        return modification;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }

    public long getMusicID() 
    
    {
        return musicID;
    }

    public long getSongID() 
    
    {
        return songID;
    }

    public String getSongName() 
    
    {
        return songName;
    }

    public int getSongOrder() 
    
    {
        return songOrder;
    }

    public String getPodcast() 
    
    {
        return podcast;
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

    public String getMusicName() 
    
    {
        return musicName;
    }

    public String getMusicPoster() 
    
    {
        return musicPoster;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public String getLocality() 
    
    {
        return locality;
    }

    public String getDescription() 
    
    {
        return description;
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

    public String getDistributorName() 
    
    {
        return distributorName;
    }

    public String getDistributorPicture() 
    
    {
        return distributorPicture;
    }
    
}
