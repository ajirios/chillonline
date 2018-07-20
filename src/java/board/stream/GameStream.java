/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.stream;


import client.Game;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class GameStream 

{
    private long programID;
    private Game game;
    private Game[] otherGames;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    private Connection videosConnection = null;
    private PreparedStatement videosStatement = null;
    private ResultSet videoSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 12;
    private int size;
    
    public GameStream(long programID)
            
    {
        this.programID = programID;
        this.game = null;
        this.otherGames = new Game[NUMBER_OF_PROGRAMS_PER_PAGE];
    }
    
}
