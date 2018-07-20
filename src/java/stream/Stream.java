/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stream;

import client.Game;
import client.Movie;
import client.Music;
import client.RadioChannel;
import client.TVChannel;
import client.TVSeries;
import client.Video;
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
public class Stream 

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
    
    
    private Video[] similarVideos;
    private Movie[] similarMovies;
    private TVSeries[] similarTVSeries;
    private Music[] similarMusic;
    private TVChannel[] similarTVChannels;
    private RadioChannel[] similarRadioChannels;
    private Game[] similarGames;
    
    private Video videoOne;
    private Video videoTwo;
    private Video videoThree;
    
    private int[] randomNumbers;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Stream(long articleID, String department)
            
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
        //this.randomNumbers = generateRandomNumbers(3);
        
        
        this.similarMovies = new Movie[3];
        this.similarGames = new Game[3];
        this.similarMusic = new Music[3];
        this.similarTVSeries = new TVSeries[3];
        this.similarVideos = new Video[3];
        this.similarTVChannels = new TVChannel[3];
        this.similarRadioChannels = new RadioChannel[3];
        
        this.videoOne = null;
        this.videoTwo = null;
        this.videoThree = null;
        
        //constructProgram();
        //constructDistributor();
        //constructSimilarPrograms();
        constructProgram(0, 7);
        constructProgram(1, 12);
        constructProgram(2, 17);
        
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
    
    private int[] generateRandomNumbers(int length)
            
    {
        int[] randomNumbers;
        int size;
        int count;
        
        randomNumbers = new int[3];
        size = getVideoCount();
        
        for (count = 0; count < length; count++)

        {
            randomNumbers[count] = (int) (Math.random() * size);
        }
        
        return randomNumbers;
        
    }
    
    
    private void constructSimilarPrograms()
            
    {
        int count;
        int currentNumber;
        
        currentNumber = 0;
        
        for (count = 0; count < 3; count++)
            
        {
            currentNumber = this.randomNumbers[count];
            
            constructProgram(count, currentNumber);
            
        }
        
    }
    
    private void constructProgram(int index, int number)
            
    {
        Connection programConnection = null;
        PreparedStatement programStatement = null;
        ResultSet programSet = null;
        int count;
        
        long id = Long.valueOf(number);

        try
        {
            programConnection = DriverManager.getConnection(URL, dbUserName, dbPassword);


            if (department.equals("movie"))
            {
                programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM movies WHERE movieID=" + id );
            }

            else if (department.equals("series"))
            {
                programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcastListID FROM series WHERE seriesID=" + id );
            }

            else if (department.equals("video"))
            {
                programStatement = programConnection.prepareStatement("SELECT videoID, videoPoster, videoName, distributor, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM videos WHERE videoID=" + id );
            }

            else if (department.equals("music"))
            {
                programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributor, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcastListID FROM music WHERE musicID=" + id );
            }

            else if (department.equals("tv"))
            {
                programStatement = programConnection.prepareStatement("SELECT channelID, channelPoster, channelName, distributor, rentalPrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM tv WHERE channelID=" + id );
            }

            else if (department.equals("radio"))
            {
                programStatement = programConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributor, rentalPrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM radio WHERE radioID=" + id );
            }

            else if (department.equals("game"))
            {
                programStatement = programConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributor, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM games WHERE gameID=" + id );
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
                    /*
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
                    */
                    
                    
                    this.similarMovies[index] = new Movie(id, programSet.getString("movieName"), programSet.getString("moviePoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("rentalPrice"));
                    
                }

                else if (department.equals("series"))
                {
                    /*
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
                    */
                    
                    
                    this.similarTVSeries[index] = new TVSeries(id, programSet.getString("seriesName"), programSet.getString("seriesPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("rentalPrice"), programSet.getString("purchasePrice"));
                    
                }

                else if (department.equals("video"))
                {
                    /*
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
                    */
                    
                    
                    //Video video = new Video(id, programSet.getString("videoName"), programSet.getString("videoPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("purchasePrice"));
                    
                    //this.similarVideos[index] = video; 
                    
                    if (index == 0)
                        
                    {
                        videoOne = new Video(id, programSet.getString("videoName"), programSet.getString("videoPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("purchasePrice"));
                    
                    }
                    
                    else if (index == 1)
                        
                    {
                        videoTwo = new Video(id, programSet.getString("videoName"), programSet.getString("videoPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("purchasePrice"));
                    
                    }
                    
                    else if (index == 2)
                        
                    {
                        videoThree = new Video(id, programSet.getString("videoName"), programSet.getString("videoPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("purchasePrice"));
                    
                    }
                    
                }

                else if (department.equals("music"))
                {
                    /*
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
                    */
                    
                    
                    this.similarMusic[index] = new Music(id, programSet.getString("musicName"), programSet.getString("musicPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("purchasePrice"));
                    
                }

                else if (department.equals("tv"))
                {
                    /*
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
                    */
                    
                    
                    this.similarTVChannels[index] = new TVChannel(id, programSet.getString("channelName"), programSet.getString("channelPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("rentalPrice"));
                    
                }

                else if (department.equals("radio"))
                {
                    /*
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
                    */
                    
                    
                    this.similarRadioChannels[index] = new RadioChannel(id, programSet.getString("radioName"), programSet.getString("radioPoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("rentalPrice"));
                    
                }

                else if (department.equals("game"))
                {
                    /*
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
                    */
                    
                    
                    this.similarGames[index] = new Game(id, programSet.getString("gameName"), programSet.getString("gamePoster"), programSet.getString("distributor"), programSet.getString("locality"), programSet.getString("purchasePrice"));
                    
                    
                } 

            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public Video getVideoOne() 
    
    {
        return videoOne;
    }

    public Video getVideoTwo() 
    
    {
        return videoTwo;
    }

    public Video getVideoThree() 
    
    {
        return videoThree;
    }

    public Video getSimilarVideos(int count) 
    
    {
        return this.getSimilarVideos(count);
    }

    public Movie getSimilarMovies(int count) 
    
    {
        return similarMovies[count];
    }

    public TVSeries getSimilarTVSeries(int count) 
    
    {
        return similarTVSeries[count];
    }

    public Music getSimilarMusic(int count) 
    
    {
        return similarMusic[count];
    }

    public TVChannel getSimilarTVChannels(int count) 
    
    {
        return similarTVChannels[count];
    }

    public RadioChannel getSimilarRadioChannels(int count) 
    
    {
        return similarRadioChannels[count];
    }

    public Game getSimilarGames(int count) 
    
    {
        return similarGames[count];
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
    
    private int getMovieCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT COUNT(moviePoster) FROM movies");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(moviePoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private int getCount()
            
    {
        int count;
        
        count = 0;
        
        if (department.equals("movie"))
            
        {
            count = getMovieCount();
        }
        
        else if (department.equals("video"))
            
        {
            count = getVideoCount();
        }
        
        else if (department.equals("series"))
            
        {
            count = getSeriesCount();
        }
        
        else if (department.equals("music"))
            
        {
            count = getMusicCount();
        }
        
        else if (department.equals("tv"))
            
        {
            count = getTVChannelCount();
        }
        
        else if (department.equals("radio"))
            
        {
            count = getRadioChannelCount();
        }
        
        else if (department.equals("game"))
            
        {
            count = getGameCount();
        }
        
        return count;
    }
    
    private int getGameCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT COUNT(gamePoster) FROM games");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(gamePoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private int getMusicCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
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
    
    private int getRadioChannelCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT COUNT(radioPoster) FROM radio");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(radioPoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private int getTVChannelCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT COUNT(channelPoster) FROM tv");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(channelPoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private int getSeriesCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT COUNT(seriesPoster) FROM series");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(seriesPoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private int getVideoCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT COUNT(videoPoster) FROM videos");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(videoPoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
}
