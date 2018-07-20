/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package home;

import client.ClientList;
import game.GameList;
import movie.MovieList;
import music.MusicList;
import radio.RadioChannelList;
import series.TVSeriesList;
import tv.TVChannelList;
import video.VideoList;

/**
 *
 * @author El Jefe
 */
public class Home 

{
    private long accountNumber;
    private long clientID;
    private MovieList movieList;
    private VideoList videoList;
    private MusicList musicList;
    private TVSeriesList seriesList;
    private TVChannelList tvChannelList;
    private RadioChannelList radioChannelList;
    private GameList gameList;
    
    private String clientProfilePicture;
    private String clientWallPaper;
    private ClientList connectionList;
    private String[] pictureList;
    
    public Home(long accountNumber)
            
    {
        
    }
    
}
