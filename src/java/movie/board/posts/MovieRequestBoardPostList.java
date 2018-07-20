/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie.board.posts;

import client.ClientRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import movie.MovieRetrieve;

/**
 *
 * @author El Jefe
 */
public class MovieRequestBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection moviesConnection = null;
    private PreparedStatement moviesStatement = null;
    private ResultSet movieSet = null;
    
    private long boardID;
    private int size;
    private MovieRequestBoardPost[] movies;
    
    public MovieRequestBoardPostList(long boardID)
    {
        this.boardID = boardID;
        this.size = getMovieRequestBoardPostCount();
        this.movies = new MovieRequestBoardPost[size];
        
        
        try
        {
            moviesConnection = DriverManager.getConnection(URL, userName, password);
            moviesStatement = moviesConnection.prepareStatement("SELECT movieID, clientID, creationTime, numberOfPeppers FROM movie_request_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 120");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateMovieRequestBoardPosts();
        
    }
    
    private ResultSet getMovies()
    {
        try
        {
            movieSet = moviesStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return movieSet;

    }
    
    private void populateMovieRequestBoardPosts()
            
    {
        int count;
        long nextCount = 0;
        ResultSet moviesSet = getMovies();
        MovieRetrieve retrieve = null;
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (moviesSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(moviesSet.getString("movieID"));
                movies[count] = new MovieRequestBoardPost(nextCount, boardID, Long.parseLong(moviesSet.getString("clientID")), moviesSet.getString("creationTime"));
                this.movies[count].setNumberOfPostPeppers(Long.parseLong(moviesSet.getString("numberOfPeppers")));
                
                retrieve = new MovieRetrieve(nextCount);
                
                this.movies[count].setContent(retrieve.getMovieContent());
                this.movies[count].setThumbnail(retrieve.getThumbnail());
                this.movies[count].setMovieName(retrieve.getMovieName());
                this.movies[count].setMoviePoster(retrieve.getMoviePoster());
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(moviesSet.getString("clientID")), "client");
                
                this.movies[count].setClientName(clientRetrieve.getClientName());
                this.movies[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.movies[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public MovieRequestBoardPost getMovieRequestBoardPost(int count)
            
    {
        return movies[count];
    }
    
    public long length()
            
    {
        return movies.length;
    }
    
    private int getMovieRequestBoardPostCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM movie_request_board_posts WHERE boardID=" + this.boardID);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(creationTime)")); 
                
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
    
}
