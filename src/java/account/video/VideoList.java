/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.video;


import video.Video;
import java.sql.*;


/**
 *
 * @author El Jefe
 */
public class VideoList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection videosConnection = null;
    PreparedStatement videosStatement = null;
    ResultSet videoSet = null;
    
    private long accountNumber;
    private int size;
    Video[] videos;
    private int videoListingContainerLength;
    private int videoListingAreaLength;
    private int videoAreaLength;

    public VideoList(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        this.size = getVideoCount();
        this.videos = new Video[size];
        this.videoListingContainerLength = 135;
        this.videoListingAreaLength = (((int) (Math.ceil((double) this.size / (double) 4))) * this.videoListingContainerLength) + 60;
        this.videoAreaLength = this.videoListingAreaLength + 200;
        

        try
        {
            videosConnection = DriverManager.getConnection(URL, userName, password);
            videosStatement = videosConnection.prepareStatement("SELECT videoID, videoName, thumbnail, description, distributor, purchasePrice, locality, "
                    + "teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfPodcastFeeds, numberOfPodcastPeppers, numberOfPodcastShares  FROM videos "
                    + "WHERE videoID IN (SELECT videoID FROM account_videos WHERE accountNumber=" + this.accountNumber + ")");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateVideos();

    }

    private ResultSet getVideos()
    {
        try
            
        {
            videoSet = videosStatement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return videoSet;

    }
    
    private void populateVideos()
            
    {
        int count;
        long nextCount = 0;
        ResultSet videosSet = getVideos();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (videosSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(videosSet.getString("videoID"));
                videos[count] = new Video(nextCount, videosSet.getString("videoName"), videosSet.getString("thumbnail"), videosSet.getString("distributor"), videosSet.getString("purchasePrice"), videosSet.getString("locality"));
                this.videos[count].setDescription(videosSet.getString("description"));
                this.videos[count].setVideoContent(videosSet.getString("teaser"));
                this.videos[count].setNumberOfPodcastFeeds(Long.parseLong(videosSet.getString("numberOfPodcastFeeds")));
                this.videos[count].setNumberOfPodcastPeppers(Long.parseLong(videosSet.getString("numberOfPodcastPeppers")));
                this.videos[count].setNumberOfPodcastShares(Long.parseLong(videosSet.getString("numberOfPodcastShares")));
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Video getVideo(int count)
            
    {
        return videos[count];
    }
    
    public long length()
            
    {
        return videos.length;
    }
    
    private int getVideoCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(videoID) FROM account_videos WHERE accountNumber=" + this.accountNumber);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(videoID)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }

    public int getVideoListingAreaLength() 
    
    {
        return videoListingAreaLength;
    }

    public int getVideoAreaLength() 
    
    {
        return videoAreaLength;
    }
    
}
