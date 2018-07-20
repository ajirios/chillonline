/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie.peppers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class MoviePepperCreate 

{
    private long accountNumber;
    private long movieID;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public MoviePepperCreate(long accountNumber, long movieID)
            
    {
        this.accountNumber = accountNumber;
        this.movieID = movieID;
        
        boolean exists = search();
        
        if (exists == false)
            
        {
            insertMoviePepper();
        }
        
    }
    
    private boolean search()
            
    {
        boolean programExistsInAccount = false;
        
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT movieID FROM movie_peppers WHERE accountNumber=" + this.accountNumber + " AND movieID=" + this.movieID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (resultSet != null)
                
            {
                
                if (resultSet.next() == true)
                    
                {

                    programExistsInAccount = true; 

                }
                
                else
                    
                {
                    
                    programExistsInAccount = false;
                    
                }
                
            }
            
            else
                
            {
                
                programExistsInAccount = false;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        
        return programExistsInAccount;
        
    }
    
    private void insertMoviePepper()
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO movie_peppers(accountNumber, movieID) VALUES(" + this.accountNumber + ", " + this.movieID + ")");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the result
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
