/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.music;


import music.Music;
import java.sql.*;

/**
 *
 * @author El Jefe
 */
public class MusicList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection musicConnection = null;
    PreparedStatement musicStatement = null;
    ResultSet musicSet = null;
    
    private long accountNumber;
    private int size;
    Music[] musicList;
    private int musicListingContainerLength;
    private int musicListingAreaLength;
    private int musicAreaLength;
    
    public MusicList(long accountNumber)
    {
        this.accountNumber = accountNumber;
        this.size = getMusicCount();
        this.musicList = new Music[size];
        this.musicListingContainerLength = 170;
        this.musicListingAreaLength = (((int) (Math.ceil((double) this.size / (double) 5))) * this.musicListingContainerLength) + 60;
        this.musicAreaLength = this.musicListingAreaLength + 200;
        
        
        try
        {
            musicConnection = DriverManager.getConnection(URL, userName, password);
            musicStatement = musicConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributor, purchasePrice, locality FROM music "
                    + "WHERE musicID IN (SELECT musicID FROM account_music WHERE accountNumber=" + this.accountNumber + ")");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateMusic();

    }

    private ResultSet getMusic()
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
    
    private void populateMusic()
            
    {
        int count;
        long nextCount = 0;
        ResultSet musicListSet = getMusic();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (musicListSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(musicListSet.getString("musicID"));
                musicList[count] = new Music(nextCount, musicListSet.getString("musicName"), musicListSet.getString("musicPoster"), musicListSet.getString("distributor"), musicListSet.getString("purchasePrice"), musicListSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Music getMusic(int count)
            
    {
        return musicList[count];
    }
    
    public long length()
            
    {
        return musicList.length;
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
            statement = connection.prepareStatement("SELECT COUNT(musicID) FROM account_music WHERE accountNumber=" + this.accountNumber);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(musicID)")); 
                
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

    public int getMusicListingAreaLength() 
    
    {
        return musicListingAreaLength;
    }

    public int getMusicAreaLength() 
    
    {
        return musicAreaLength;
    }
    
}
