/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.movie;



import movie.Movie;
import java.sql.*;


/**
 *
 * @author El Jefe
 */
public class MovieList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection moviesConnection = null;
    private PreparedStatement moviesStatement = null;
    private ResultSet movieSet = null;
    
    private long accountNumber;
    private int size;
    private Movie[] movies;
    private int movieListingContainerLength;
    private int movieListingAreaLength;
    private int moviesAreaLength;
    
    public MovieList(long accountNumber)
    {
        this.accountNumber = accountNumber;
        this.size = getMovieCount();
        this.movies = new Movie[size];
        this.movieListingContainerLength = 235;
        this.movieListingAreaLength = (((int) (Math.ceil((double) this.size / (double) 5))) * this.movieListingContainerLength) + 60;
        this.moviesAreaLength = this.movieListingAreaLength + 200;
        
        
        try
        {
            moviesConnection = DriverManager.getConnection(URL, userName, password);
            moviesStatement = moviesConnection.prepareStatement("SELECT movieID, moviePoster, movieName, description, distributor, "
                    + "rentalPrice, purchasePrice, locality, thumbnail, podcast, numberOfPodcastFeeds, numberOfPodcastPeppers, numberOfPodcastShares  FROM movies "
                    + "WHERE movieID IN (SELECT movieID FROM account_movies WHERE accountNumber=" + this.accountNumber + ")");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateMovies();

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
    
    private void populateMovies()
            
    {
        int count;
        long nextCount = 0;
        ResultSet moviesSet = getMovies();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (moviesSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(moviesSet.getString("movieID"));
                movies[count] = new Movie(nextCount, moviesSet.getString("movieName"), moviesSet.getString("moviePoster"), moviesSet.getString("distributor"), moviesSet.getString("rentalPrice"), moviesSet.getString("locality"));
                this.movies[count].setDescription(moviesSet.getString("description"));
                this.movies[count].setMovieContent(moviesSet.getString("podcast"));
                this.movies[count].setNumberOfPodcastFeeds(Long.parseLong(moviesSet.getString("numberOfPodcastFeeds")));
                this.movies[count].setNumberOfPodcastPeppers(Long.parseLong(moviesSet.getString("numberOfPodcastPeppers")));
                this.movies[count].setNumberOfPodcastShares(Long.parseLong(moviesSet.getString("numberOfPodcastShares")));
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Movie getMovie(int count)
            
    {
        return movies[count];
    }
    
    public long length()
            
    {
        return movies.length;
    }
    
    private int getMovieCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(movieID) FROM account_movies WHERE accountNumber=" + this.accountNumber);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(movieID)")); 
                
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
    
    public int getMovieListingAreaLength() 
    
    {
        return movieListingAreaLength;
    }

    public int getMoviesAreaLength() 
    
    {
        return moviesAreaLength;
    }

}
