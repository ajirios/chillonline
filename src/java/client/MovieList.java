/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;


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

    Connection moviesConnection = null;
    PreparedStatement moviesStatement = null;
    ResultSet movieSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    private int startID;
    private int endID;
    private int currentPageNumber;
    private int finalPageNumber;
    private Movie[] movies;

    public MovieList()
    {
        this.size = getMovieCount();
        this.movies = new Movie[size];
        
        try
        {
            moviesConnection = DriverManager.getConnection(URL, userName, password);
            moviesStatement = moviesConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, locality FROM movies WHERE movieID<" + this.size);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateMovies();

    }
    
    public MovieList(int pageNumber)
    {
        this.size = getMovieCount();
        this.movies = new Movie[18];
        this.startID = getStartID(pageNumber);
        this.endID = getEndID(pageNumber);
        this.currentPageNumber = pageNumber;
        this.finalPageNumber = (int) Math.ceil(((double) this.size) / ((double) NUMBER_OF_PROGRAMS_PER_PAGE)); 
        
        System.out.println(this.size);
        System.out.println(this.startID);
        System.out.println(this.endID);
        System.out.println(this.currentPageNumber);
        System.out.println(this.finalPageNumber);
        
        try
        {
            moviesConnection = DriverManager.getConnection(URL, userName, password);
            moviesStatement = moviesConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, locality FROM movies "
                    + "WHERE movieID>=" + this.startID + " AND movieID<=" + this.endID);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateMoviePage();

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
        int randomElement;
        ResultSet moviesSet = getMovies();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (moviesSet.next() == true); count++) 

            {
                randomElement = (int) (Math.random() * this.size);
                long nextCount = count + 1;
                movies[count] = new Movie(nextCount, moviesSet.getString("movieName"), moviesSet.getString("moviePoster"), moviesSet.getString("distributor"), moviesSet.getString("rentalPrice"), moviesSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void populateMoviePage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet moviesSet = getMovies();
        
        try
            
        {
                        
            for (count = 0; (count < 18) && (moviesSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(moviesSet.getString("movieID"));
                movies[count] = new Movie(nextCount, moviesSet.getString("movieName"), moviesSet.getString("moviePoster"), moviesSet.getString("distributor"), moviesSet.getString("rentalPrice"), moviesSet.getString("locality"));

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
    
    private int getStartID(int pageNumber)
            
    {
        int databaseID;
        
        databaseID = 0;
        
        if (pageNumber > 0)
            
        {
            
            databaseID = (18 * (pageNumber - 1)) + 1;
        
        }
        
        return databaseID;
        
    }
    
    private int getEndID(int pageNumber)
            
    {
        int databaseID;
        
        databaseID = 0;
        
        if (pageNumber > 0)
            
        {
            databaseID = (18 * pageNumber);
            
            if (databaseID <= this.size)
                
            {
                databaseID = (18 * pageNumber);
            }
            
            else if (databaseID > this.size)
                
            {
                databaseID = this.size;
            }
        
        }
        
        return databaseID;
        
    }

    public int getCurrentPageNumber() 
    
    {
        return currentPageNumber;
    }

    public int getFinalPageNumber() 
    
    {
        return finalPageNumber;
    }
    
    public int getSize()
            
    {
        return this.size;
    }

}
