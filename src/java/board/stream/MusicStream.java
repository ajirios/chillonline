/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.stream;


import music.Music;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class MusicStream 

{
    private long programID;
    private String department;
    private String programName;
    private String programPoster;
    private String producer;
    private long programDistributorID;
    private String programDistributorName;
    private String programDistributorPicture;
    private String programLocality;
    private String thumbnail;
    private String teaser;
    private long numberOfTeaserFeeds;
    private long numberOfTeaserPeppers;
    private long numberOfTeaserShares;
    private String programDescription;
    private String rentalPrice;
    private String purchasePrice;
    private String podcast;
    private String podcastName;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    private long podcastListID;
    private Music[] podcastList;
    
    private Music music;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    Connection musicConnection = null;
    PreparedStatement musicStatement = null;
    ResultSet musicSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 10;
    private int size;
    private long startID;
    private long endID;
    
    public MusicStream()
            
    {
        this.programID = -1;
        this.department = "music";
        this.programName = null;
        this.programPoster = null;
        this.producer = null;
        this.programDistributorID = -1;
        this.programDistributorName = null;
        this.programDistributorPicture = null;
        this.programLocality = null;
        this.thumbnail = null;
        this.teaser = null;
        this.numberOfTeaserFeeds = 0;
        this.numberOfTeaserPeppers = 0;
        this.numberOfTeaserShares = 0;
        this.programDescription = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        this.podcast = null;
        this.podcastName = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        this.podcastListID = -1;
        this.podcastList = null;
        
        this.music = null;
        this.size = getMusicCount();
    }
    
    public MusicStream(long programID)
            
    {
        this.programID = programID;
        this.department = "music";
        this.programName = null;
        this.programPoster = null;
        this.producer = null;
        this.programDistributorID = -1;
        this.programDistributorName = null;
        this.programDistributorPicture = null;
        this.programLocality = null;
        this.thumbnail = null;
        this.teaser = null;
        this.numberOfTeaserFeeds = 0;
        this.numberOfTeaserPeppers = 0;
        this.numberOfTeaserShares = 0;
        this.programDescription = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        this.podcast = null;
        this.podcastName = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        this.podcastListID = -1;
        this.podcastList = null;
        
        this.music = null;
        this.size = getMusicCount();
        
        constructProgram();
        constructDistributor();
        this.music = new Music(this.programID, this.programName, this.programPoster, this.programDistributorName, this.purchasePrice, this.programLocality);
        
    }

    private ResultSet getMusicList()
    {
        try
        {
            musicSet = musicStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return musicSet;

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


            if (department.equals("movie"))
            {
                programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributorID, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM movies WHERE movieID=" + programID );
            }

            else if (department.equals("series"))
            {
                programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributorID, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfTeaserShares FROM series WHERE seriesID=" + programID );
            }

            else if (department.equals("video"))
            {
                programStatement = programConnection.prepareStatement("SELECT videoID, videoPoster, videoName, distributorID, purchasePrice, thumbnail, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfPodcastFeeds, numberOfPodcastPeppers, numberOfPodcastShares "
                        + "FROM videos WHERE videoID=" + programID );
            }

            else if (department.equals("music"))
            {
                programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributorID, purchasePrice, description, locality, producer"
                        + ", numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfTeaserShares FROM music WHERE musicID=" + programID );
            }

            else if (department.equals("tv"))
            {
                programStatement = programConnection.prepareStatement("SELECT channelID, channelPoster, channelName, distributorID, rentalPrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM tv WHERE channelID=" + programID );
            }

            else if (department.equals("radio"))
            {
                programStatement = programConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributorID, rentalPrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM radio WHERE radioID=" + programID );
            }

            else if (department.equals("game"))
            {
                programStatement = programConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributorID, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM games WHERE gameID=" + programID );
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

                if (department.equals("movie"))
                {
                    programID = Long.parseLong(programSet.getString("movieID"));
                    programName = programSet.getString("movieName"); 
                    programPoster = programSet.getString("moviePoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    purchasePrice = programSet.getString("purchasePrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
                }

                else if (department.equals("series"))
                {
                    programID = Long.parseLong(programSet.getString("seriesID"));
                    programName = programSet.getString("seriesName"); 
                    programPoster = programSet.getString("seriesPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    purchasePrice = programSet.getString("purchasePrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    numberOfTeaserShares = Long.parseLong(programSet.getString("numberOfTeaserShares"));
                    podcastListID = 0;
                }

                else if (department.equals("video"))
                {
                    programID = Long.parseLong(programSet.getString("videoID"));
                    programName = programSet.getString("videoName"); 
                    programPoster = programSet.getString("videoPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice");
                    thumbnail = programSet.getString("thumbnail");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = teaser;
                    podcastName = programName;
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    numberOfPodcastShares = Long.parseLong(programSet.getString("numberOfPodcastShares"));
                    podcastList = null;
                }

                else if (department.equals("music"))
                {
                    programID = Long.parseLong(programSet.getString("musicID"));
                    programName = programSet.getString("musicName"); 
                    programPoster = programSet.getString("musicPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice");
                    producer = programSet.getString("producer");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    numberOfTeaserShares = Long.parseLong(programSet.getString("numberOfTeaserShares"));
                }

                else if (department.equals("tv"))
                {
                    programID = Long.parseLong(programSet.getString("channelID"));
                    programName = programSet.getString("channelName"); 
                    programPoster = programSet.getString("channelPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
                }

                else if (department.equals("radio"))
                {
                    programID = Long.parseLong(programSet.getString("radioID"));
                    programName = programSet.getString("radioName"); 
                    programPoster = programSet.getString("radioPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
                }

                else if (department.equals("game"))
                {
                    programID = Long.parseLong(programSet.getString("gameID"));
                    programName = programSet.getString("gameName"); 
                    programPoster = programSet.getString("gamePoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice"); 
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
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
            statement = connection.prepareStatement("SELECT distributorLogo, distributorName FROM distributors WHERE distributorID=" + programDistributorID );
            
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
                
                programDistributorName = resultSet.getString("distributorName"); 
                programDistributorPicture = resultSet.getString("distributorLogo");
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private int getMusicCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(musicPoster) FROM music");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(musicPoster)")); 
                
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

    public long getProgramID() 
    
    {
        return programID;
    }

    public String getDepartment() 
    
    {
        return department;
    }

    public String getProgramName() 
    
    {
        return programName;
    }

    public String getProgramPoster() 
    
    {
        return programPoster;
    }

    public long getProgramDistributorID() 
    
    {
        return programDistributorID;
    }

    public String getProgramDistributorName() 
    
    {
        return programDistributorName;
    }

    public String getProgramDistributorPicture() 
    
    {
        return programDistributorPicture;
    }

    public String getProgramLocality() 
    
    {
        return programLocality;
    }

    public String getTeaser() 
    
    {
        return teaser;
    }

    public long getNumberOfTeaserFeeds() 
    
    {
        return numberOfTeaserFeeds;
    }

    public long getNumberOfTeaserPeppers() 
    
    {
        return numberOfTeaserPeppers;
    }

    public String getProgramDescription() 
    
    {
        return programDescription;
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public String getPodcast() 
    
    {
        return podcast;
    }

    public String getPodcastName() 
    
    {
        return podcastName;
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

    public String getProducer() 
    
    {
        return producer;
    }

    public Music getMusic() 
    
    {
        return music;
    }
    
}
