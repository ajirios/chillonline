/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package checkout;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import loggedout.ContentList;

/**
 *
 * @author El Jefe
 */
public class Checkout 

{
    private long programID;
    private String department;
    private String programName;
    private String programPoster;
    private long programDistributorID;
    private String programDistributorName;
    private String programDistributorPicture;
    private String programLocality;
    private String teaser;
    private long numberOfTeaserFeeds;
    private long numberOfTeaserPeppers;
    private String programDescription;
    private String rentalPrice;
    private String purchasePrice;
    private String podcast;
    private String podcastName;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long podcastListID;
    private ContentList podcastList;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Checkout(long articleID, String department)
            
    {
        this.programID = articleID;
        this.department = department;
        this.programName = null;
        this.programPoster = null;
        this.programDistributorID = -1;
        this.programDistributorName = null;
        this.programDistributorPicture = null;
        this.programLocality = null;
        this.teaser = null;
        this.numberOfTeaserFeeds = 0;
        this.numberOfTeaserPeppers = 0;
        this.programDescription = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        this.podcast = null;
        this.podcastName = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.podcastListID = -1;
        this.podcastList = null;
        
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
            programConnection = DriverManager.getConnection(URL, dbUserName, dbPassword);


            if (department.equals("movie"))
            {
                programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributorID, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM movies WHERE movieID=" + programID );
            }

            else if (department.equals("series"))
            {
                programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributorID, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcastListID FROM series WHERE seriesID=" + programID );
            }

            else if (department.equals("video"))
            {
                programStatement = programConnection.prepareStatement("SELECT videoID, videoPoster, videoName, distributorID, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM videos WHERE videoID=" + programID );
            }

            else if (department.equals("music"))
            {
                programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributorID, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcastListID FROM music WHERE musicID=" + programID );
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
                    programDescription = programSet.getString("description");
                    podcastListID = Long.parseLong(programSet.getString("podcastListID"));
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

                else if (department.equals("music"))
                {
                    programID = Long.parseLong(programSet.getString("musicID"));
                    programName = programSet.getString("musicName"); 
                    programPoster = programSet.getString("musicPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcastListID = Long.parseLong(programSet.getString("podcastListID"));
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
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
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

    public long getProgramID() 
    
    {
        return programID;
    }

    public void setProgramID(long programID) 
    
    {
        this.programID = programID;
    }

    public String getDepartment() 
    
    {
        return department;
    }

    public void setDepartment(String department) 
    
    {
        this.department = department;
    }

    public String getProgramName() 
    
    {
        return programName;
    }

    public void setProgramName(String programName) 
    
    {
        this.programName = programName;
    }

    public String getProgramPoster() 
    
    {
        return programPoster;
    }

    public void setProgramPoster(String programPoster) 
    
    {
        this.programPoster = programPoster;
    }

    public long getProgramDistributorID() 
    
    {
        return programDistributorID;
    }

    public void setProgramDistributorID(long programDistributorID) 
    
    {
        this.programDistributorID = programDistributorID;
    }

    public String getProgramDistributorName() 
    
    {
        return programDistributorName;
    }

    public void setProgramDistributorName(String programDistributorName) 
    
    {
        this.programDistributorName = programDistributorName;
    }

    public String getProgramDistributorPicture() 
    
    {
        return programDistributorPicture;
    }

    public void setProgramDistributorPicture(String programDistributorPicture) 
    
    {
        this.programDistributorPicture = programDistributorPicture;
    }

    public String getProgramLocality() 
    
    {
        return programLocality;
    }

    public void setProgramLocality(String programLocality) 
    
    {
        this.programLocality = programLocality;
    }

    public String getTeaser() 
    
    {
        return teaser;
    }

    public void setTeaser(String teaser) 
    
    {
        this.teaser = teaser;
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

    public String getProgramDescription() 
    
    {
        return programDescription;
    }

    public void setProgramDescription(String programDescription) 
    
    {
        this.programDescription = programDescription;
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

    public String getPodcast() 
    
    {
        return podcast;
    }

    public void setPodcast(String podcast) 
    
    {
        this.podcast = podcast;
    }

    public String getPodcastName() 
    
    {
        return podcastName;
    }

    public void setPodcastName(String podcastName) 
    
    {
        this.podcastName = podcastName;
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

    public ContentList getPodcastList() 
    
    {
        return podcastList;
    }

    public long getPodcastListID() 
    
    {
        return podcastListID;
    }

    public void setPodcastListID(long podcastListID) 
    
    {
        this.podcastListID = podcastListID;
    }

    public void setPodcastList(ContentList podcastList) 
    
    {
        this.podcastList = podcastList;
    }
    
}
